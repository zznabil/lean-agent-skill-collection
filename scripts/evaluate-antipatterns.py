#!/usr/bin/env python3
"""Check four code fixtures. Candidate execution is not a security sandbox."""
import argparse
import hashlib
import importlib.util
import json
import platform
from pathlib import Path
import sqlite3
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parent.parent
CORPUS = ROOT / 'docs/evals/antipatterns'
MARKER = 'ANTIPATTERN_CANDIDATE_PASS:'
RESULT = 'ANTIPATTERN_RESULT:'


class ContractFailure(Exception):
    def __init__(self, code, detail):
        self.code = code
        super().__init__(detail)


def require(condition, code, detail):
    if not condition:
        raise ContractFailure(code, detail)


def check_policy(candidate):
    observed = []
    for subtotal, fee in ((0, 500), (4999, 500), (5000, 0), (5001, 0)):
        api = candidate.api_quote(subtotal)
        cli = candidate.cli_quote(subtotal)
        observed.append({'subtotal': subtotal, 'api': api, 'cli': cli})
        require(api == {'shipping_cents': fee} and cli == f'Shipping: {fee} cents',
                'POLICY_DRIFT', f'Wrong shipping result at subtotal {subtotal}: {api!r}, {cli!r}')
    for surface in (candidate.api_quote, candidate.cli_quote):
        try:
            surface(-1)
        except ValueError:
            continue
        raise ContractFailure('INVALID_INPUT', 'A negative subtotal was accepted')
    return {'quotes': observed, 'negative_subtotal': 'rejected on both surfaces'}


class OrderService:
    """Model a write boundary with lost responses and explicit outcome states."""
    def __init__(self, outcome):
        self.outcome = outcome
        self.events = []
        self.orders = []

    def record_intent(self, intent_id):
        self.events.append(('intent', intent_id))

    def submit(self, intent_id):
        self.events.append(('submit', intent_id))
        attempts = sum(event[0] == 'submit' for event in self.events)
        retry = self.outcome.startswith('retry_')
        outcome = self.outcome.removeprefix('retry_')
        if attempts == 1 and (retry or outcome == 'retryable_failure'):
            return {'status': 'retryable_failure'}
        target_attempt = 2 if retry else 1
        if attempts == target_attempt and outcome in ('unknown_timeout', 'lookup_timeout'):
            raise TimeoutError('The write outcome is unknown')
        self.orders.append(intent_id)
        if attempts == target_attempt and outcome == 'committed_timeout':
            raise TimeoutError('The response was lost after the write')
        return {'status': 'succeeded', 'order_id': intent_id}

    def lookup(self, intent_id):
        self.events.append(('lookup', intent_id))
        if self.outcome.removeprefix('retry_') == 'lookup_timeout':
            raise TimeoutError('The readback is unavailable')
        if intent_id in self.orders:
            return {'status': 'succeeded', 'order_id': intent_id}
        return {'status': 'unknown'}


def check_retry(candidate):
    observed = []
    for outcome in ('success', 'committed_timeout', 'unknown_timeout', 'lookup_timeout', 'retryable_failure',
                    'retry_committed_timeout', 'retry_unknown_timeout', 'retry_lookup_timeout'):
        service = OrderService(outcome)
        try:
            result = candidate.send_order(service, 'intent-1')
        except TimeoutError as error:
            raise ContractFailure('UNRECONCILED_TIMEOUT', f'{outcome}: {error}') from error
        require(len(service.orders) <= 1, 'DUPLICATE_WRITE', f'{outcome}: {service.orders!r}')
        require(service.events and service.events[0] == ('intent', 'intent-1'),
                'MISSING_INTENT', f'{outcome}: intent was not recorded before the write')
        submits = [event for event in service.events if event[0] == 'submit']
        require(submits and all(event[1] == 'intent-1' for event in submits),
                'CHANGED_INTENT', f'{outcome}: a retry changed the intent identifier')
        retry = outcome.startswith('retry_')
        effective_outcome = outcome.removeprefix('retry_')
        expected_submits = 2 if retry else 1
        stopped_after_failure = retry and len(submits) == 1
        if stopped_after_failure:
            require(result == {'status': 'retryable_failure'} and not service.orders,
                    'WRONG_OUTCOME', f'{outcome}: wrong result after stopping on definite failure')
        elif effective_outcome in ('success', 'committed_timeout'):
            require(result == {'status': 'succeeded', 'order_id': 'intent-1'}
                    and service.orders == ['intent-1'] and len(submits) == expected_submits,
                    'WRONG_OUTCOME', f'{outcome}: {result!r}')
        elif effective_outcome in ('unknown_timeout', 'lookup_timeout'):
            require(result == {'status': 'unknown'} and len(submits) == expected_submits,
                    'UNKNOWN_RETRY', f'{outcome}: {result!r}, {submits!r}')
        else:
            require((result == {'status': 'retryable_failure'} and len(submits) == 1 and not service.orders)
                    or (result == {'status': 'succeeded', 'order_id': 'intent-1'}
                        and len(submits) == 2 and service.orders == ['intent-1']),
                    'WRONG_OUTCOME', f'{outcome}: stop or retry once after definite failure')
        if effective_outcome.endswith('timeout') and not stopped_after_failure:
            require(('lookup', 'intent-1') in service.events, 'MISSING_READBACK', outcome)
        observed.append({'condition': outcome, 'result': result, 'events': service.events, 'orders': service.orders})
    return {'scenarios': observed}


def checkout_variant(mode):
    def checkout(prices, gateway):
        total = sum(prices) + (1 if mode == 'wrong_total' else 0)
        receipt = 'receipt-1' if mode == 'no_charge' else gateway.charge(total)
        if mode == 'double_charge':
            gateway.charge(total)
        return {'total_cents': total, 'receipt': receipt}
    return checkout


def check_test_boundary(candidate):
    candidate.check_checkout(checkout_variant('correct'))
    rejected = []
    for defect in ('wrong_total', 'no_charge', 'double_charge'):
        try:
            candidate.check_checkout(checkout_variant(defect))
        except AssertionError:
            rejected.append(defect)
        else:
            raise ContractFailure('INSENSITIVE_TEST', f'The test accepted {defect}')
    return {'correct_checkout': 'accepted', 'rejected_mutants': rejected}


class MeasuredCursor:
    def __init__(self, cursor, db):
        self.cursor, self.db = cursor, db

    def fetchone(self):
        row = self.cursor.fetchone()
        self.db.rows += row is not None
        return row

    def fetchall(self):
        rows = self.cursor.fetchall()
        self.db.rows += len(rows)
        return rows

    def __iter__(self):
        while True:
            row = self.fetchone()
            if row is None:
                return
            yield row


class MeasuredDatabase:
    """Count queries and fetched rows at a real in-memory SQLite boundary."""
    def __init__(self):
        self.connection = sqlite3.connect(':memory:')
        self.connection.executescript('''
            CREATE TABLE orders (id INTEGER PRIMARY KEY);
            CREATE TABLE lines (order_id INTEGER, cents INTEGER);
            CREATE INDEX lines_order ON lines(order_id);
        ''')
        self.connection.executemany('INSERT INTO orders VALUES (?)', [(i,) for i in range(1, 43)])
        self.connection.executemany('INSERT INTO lines VALUES (?, ?)',
                                    [(i, cents) for i in range(1, 43) if i % 7 for cents in (100, i)])
        self.queries, self.rows = 0, 0

    def execute(self, sql, parameters=()):
        self.queries += 1
        return MeasuredCursor(self.connection.execute(sql, parameters), self)


def check_query_budget(candidate):
    db = MeasuredDatabase()
    observations = []
    try:
        for after, limit in ((0, 1), (0, 5), (6, 10), (37, 5), (39, 5), (42, 5)):
            db.queries, db.rows = 0, 0
            result = candidate.order_page(db, after, limit)
            require(db.queries <= 2 and db.rows <= 3 * (limit + 1), 'READ_BUDGET',
                    f'after={after}, limit={limit}: {db.queries} queries and {db.rows} fetched rows')
            ids = list(range(after + 1, min(after + limit, 42) + 1))
            expected = {'items': [{'id': i, 'total_cents': 100 + i if i % 7 else 0} for i in ids],
                        'next_after': ids[-1] if after + limit < 42 else None}
            require(result == expected, 'WRONG_PAGE', f'after={after}, limit={limit}: {result!r}')
            observations.append({'after': after, 'limit': limit, 'queries': db.queries, 'fetched_rows': db.rows})
        for after, limit in ((-1, 5), (0, 0), (0, 11)):
            db.queries = 0
            try:
                candidate.order_page(db, after, limit)
            except ValueError:
                require(db.queries == 0, 'INVALID_INPUT', 'Invalid page reached the database')
                continue
            raise ContractFailure('INVALID_INPUT', 'Invalid page was accepted')
        return {'pages': observations, 'invalid_pages': 'rejected before database access'}
    finally:
        db.connection.close()


CHECKS = {'policy': check_policy, 'retry': check_retry,
          'test_boundary': check_test_boundary, 'query_budget': check_query_budget}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_file(case, path):
    result = {'case': case, 'candidate_sha256': digest(path), 'oracle_sha256': digest(Path(__file__)),
              'status': 'ERROR', 'failure_code': None}
    try:
        spec = importlib.util.spec_from_file_location('candidate', path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        result['observed'] = CHECKS[case](module)
        result['status'] = 'PASS'
    except ContractFailure as error:
        result.update(status='FAIL', failure_code=error.code, detail=str(error))
    except Exception as error:
        result.update(detail=f'{type(error).__name__}: {error}')
    return result


def run_candidate(case, path, timeout=10):
    """Use a child process for isolation of imports, not for hostile code."""
    oracle_hash = digest(Path(__file__))
    try:
        run = subprocess.run([sys.executable, '-B', str(Path(__file__).resolve()),
                              '--case', case, '--candidate', str(path.resolve()), '--_child'],
                             capture_output=True, text=True, encoding='utf-8', timeout=timeout, check=False)
        records = [json.loads(line[len(RESULT):]) for line in run.stdout.splitlines() if line.startswith(RESULT)]
        if len(records) != 1:
            raise ValueError('Expected one result record')
        record = records[0]
        status = record['status']
        expected_exit = {'PASS': 0, 'FAIL': 1, 'ERROR': 2}[status]
        markers = [line for line in run.stdout.splitlines() if line.startswith(MARKER)]
        if (run.returncode != expected_exit or record['case'] != case
                or record['candidate_sha256'] != digest(path)
                or record['oracle_sha256'] != oracle_hash or digest(Path(__file__)) != oracle_hash
                or markers != ([MARKER + case] if status == 'PASS' else [])):
            raise ValueError('Exit, result record, artifact hash, or success marker mismatch')
        return record
    except (OSError, subprocess.TimeoutExpired, ValueError, KeyError, TypeError) as error:
        return {'case': case, 'status': 'ERROR', 'failure_code': None, 'detail': str(error)}


def self_test():
    manifest_hash = digest(CORPUS / 'manifest.json')
    manifest = json.loads((CORPUS / 'manifest.json').read_text(encoding='utf-8'))
    require(manifest['schema_version'] == 1, 'MANIFEST', 'Unsupported schema')
    cases = manifest['cases']
    require(len(cases) == len(CHECKS) and {case['id'] for case in cases} == set(CHECKS),
            'MANIFEST', 'Case inventory differs from the executable checks')
    results = []
    for case in cases:
        require(all(isinstance(case.get(field), str) and case[field].strip()
                    for field in ('pattern', 'prompt', 'source', 'diagnosis', 'minimal_repair',
                                  'legitimate_control', 'acceptance', 'failure_code', 'project_check')),
                'MANIFEST', f'{case["id"]}: a required field is absent')
        require(case['skills'] and len(set(case['skills'])) == len(case['skills'])
                and all((ROOT / 'skills' / skill / 'SKILL.md').is_file() for skill in case['skills']),
                'MANIFEST', f'{case["id"]}: invalid skill mapping')
        require((ROOT / case['source'].split('#')[0]).is_file(), 'MANIFEST', 'Missing source rule')
        for variant in ('broken', 'repair', 'control'):
            path = CORPUS / case['id'] / (variant + '.py')
            record = run_candidate(case['id'], path)
            expected = 'FAIL' if variant == 'broken' else 'PASS'
            require(record['status'] == expected, 'CALIBRATION', f'{case["id"]}/{variant}: {record}')
            if variant == 'broken':
                require(record['failure_code'] == case['failure_code'], 'CALIBRATION', str(record))
            results.append({'pattern': case['pattern'], 'skills': case['skills'], 'variant': variant,
                            'expected': expected, **record})
    # Calibrate the two query budgets separately. Each mutant violates one budget.
    query = CORPUS / 'query_budget'
    bounded_n_plus_one = (query / 'broken.py').read_text(encoding='utf-8').replace(
        "ORDER BY id', (after,)", "ORDER BY id LIMIT ?', (after, limit + 1)")
    unbounded_join = (query / 'repair.py').read_text(encoding='utf-8').replace(
        ' ORDER BY orders.id LIMIT ?', ' ORDER BY orders.id').replace('(after, limit + 1)', '(after,)')
    full_page_cursor = (query / 'repair.py').read_text(encoding='utf-8').replace(
        'if len(rows) > limit', 'if len(items) == limit')
    sensitivity = []
    with tempfile.TemporaryDirectory() as temporary:
        for name, content, failure in (('bounded_n_plus_one', bounded_n_plus_one, 'READ_BUDGET'),
                                       ('unbounded_join', unbounded_join, 'READ_BUDGET'),
                                       ('full_page_cursor', full_page_cursor, 'WRONG_PAGE')):
            path = Path(temporary) / (name + '.py')
            path.write_text(content, encoding='utf-8')
            record = run_candidate('query_budget', path)
            require(record['status'] == 'FAIL' and record['failure_code'] == failure,
                    'CALIBRATION', f'{name}: {record}')
            sensitivity.append({'mutation': name, **record})
    retry_control = (CORPUS / 'retry/control.py').read_text(encoding='utf-8')
    unreconciled_retry = retry_control.replace(
        '        try:\n', '        if attempt == 1:\n            return service.submit(intent_id)\n        try:\n', 1)
    with tempfile.TemporaryDirectory() as temporary:
        path = Path(temporary) / 'unreconciled_retry.py'
        path.write_text(unreconciled_retry, encoding='utf-8')
        retry_sensitivity = run_candidate('retry', path)
        require(retry_sensitivity['status'] == 'FAIL'
                and retry_sensitivity['failure_code'] == 'UNRECONCILED_TIMEOUT',
                'CALIBRATION', f'Unreconciled retry: {retry_sensitivity}')
    # Errors must not count as successful rejection of a broken implementation.
    with tempfile.TemporaryDirectory() as temporary:
        bad = Path(temporary) / 'candidate.py'
        for content in ('def invalid syntax\n', 'raise SystemExit(0)\n',
                        "print('ANTIPATTERN_CANDIDATE_PASS:policy'); raise SystemExit(0)\n"):
            bad.write_text(content, encoding='utf-8')
            require(run_candidate('policy', bad)['status'] == 'ERROR', 'CALIBRATION',
                    'Invalid or incomplete candidate run was accepted')
        bad.write_text('while True:\n    pass\n', encoding='utf-8')
        require(run_candidate('policy', bad, timeout=0.2)['status'] == 'ERROR', 'CALIBRATION',
                'A timed-out candidate run was accepted')
    require(digest(CORPUS / 'manifest.json') == manifest_hash, 'CALIBRATION', 'The manifest changed during execution')
    return {'scope': 'fixture calibration', 'live_agent_status': 'NOT_RUN',
            'environment': {'python': platform.python_version(), 'platform': platform.system(),
                            'sqlite': sqlite3.sqlite_version},
            'manifest_sha256': manifest_hash, 'results': results, 'query_budget_sensitivity': sensitivity,
            'retry_sensitivity': retry_sensitivity}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--self-test', action='store_true')
    parser.add_argument('--case', choices=CHECKS)
    parser.add_argument('--candidate', type=Path)
    parser.add_argument('--out', type=Path, help='Write the current JSON evidence outside the source tree.')
    parser.add_argument('--_child', action='store_true', help=argparse.SUPPRESS)
    args = parser.parse_args()
    if args.self_test and (args.case or args.candidate or args._child):
        parser.error('Choose --self-test or --case with --candidate')
    if not args.self_test and not (args.case and args.candidate):
        parser.error('Use --self-test or --case with --candidate')
    if args._child:
        record = check_file(args.case, args.candidate)
        print(RESULT + json.dumps(record, sort_keys=True))
        if record['status'] == 'PASS':
            print(MARKER + args.case)
        return {'PASS': 0, 'FAIL': 1, 'ERROR': 2}[record['status']]
    try:
        report = self_test() if args.self_test else run_candidate(args.case, args.candidate)
        if args.out:
            target = args.out.resolve()
            if ROOT in target.parents and ROOT / 'artifacts' not in target.parents:
                raise ValueError('Write the report under artifacts/ or outside the source checkout')
            if args.candidate and target == args.candidate.resolve():
                raise ValueError('The report must not overwrite the candidate')
            args.out.parent.mkdir(parents=True, exist_ok=True)
            args.out.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
        if args.self_test:
            for row in report['results']:
                print(f'{row["case"]}/{row["variant"]}: expected {row["expected"]}; observed {row["status"]}')
            print(f'ANTIPATTERN_CORPUS_PASS: {len(CHECKS)} cases; broken examples rejected; repairs and controls accepted; live agent NOT_RUN')
            return 0
        print(json.dumps(report, indent=2))
        if report['status'] == 'PASS':
            print(MARKER + args.case)
        return {'PASS': 0, 'FAIL': 1, 'ERROR': 2}[report['status']]
    except (ContractFailure, OSError, ValueError, KeyError) as error:
        print(f'ANTIPATTERN_CORPUS_ERROR: {error}', file=sys.stderr)
        return 2


if __name__ == '__main__':
    sys.exit(main())
