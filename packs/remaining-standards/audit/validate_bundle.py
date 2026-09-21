"""Read-only pack checks. Structural checks are not semantic/model evaluations."""
from __future__ import annotations
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import sys
from urllib.parse import unquote, urlparse

GATED = {71, 72, 75, 76, 78, 79, 80}
PREVIOUS = {1, 2, 9, 20, 21, 22, 52, 53, 54, 55, *range(81, 98)}
ISO = {3, 4, 5, 6, 18, 32, 40, 41, 42, 47, 49, 50, 51, 63, 64, 65, 72, 73, 74}
SOURCE_MANIFEST_SHA256 = '85d72b7c738dd97683cb1a2c090f752af8b729666f576e2a2db8617f42101166'
SKILL_INVENTORY_SHA256 = 'ee756f616a6039cb3b67c9cfca0673782f46935465c9cf86888325e130ea9003'
REGISTER_BLOB = '983cd4532cbf97dd77c4446accaf358b5317fcfa'
SOURCE_BASELINE_SHA256 = '99099578940d2664069b0645720dbed9c8b553ea9aa52e7807a5f966d73ddddf'
SOURCE_BASELINE_NAME = 'SOURCE-BASELINE.sha256'
SOURCE_BASELINE_EXCLUDED = {'CHECKSUMS.sha256', SOURCE_BASELINE_NAME, 'audit/validate_bundle.py'}

class InvalidPack(ValueError):
    """A directly observed structural or integrity check failed."""

def require(condition: bool, message: str) -> None:
    if not condition:
        raise InvalidPack(message)

def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()

def verify_source_baseline(root: Path, rels: list[str]) -> None:
    baseline = root / SOURCE_BASELINE_NAME
    require(baseline.is_file(), 'Source baseline missing')
    require(sha(baseline.read_bytes()) == SOURCE_BASELINE_SHA256, 'Source baseline pin changed')
    entries = {}
    for line in baseline.read_text(encoding='utf-8').splitlines():
        match = re.fullmatch(r'([a-f0-9]{64})  (.+)', line)
        require(match is not None, 'Malformed source baseline line')
        digest, rel = match.groups()
        require(rel not in entries and rel.casefold() not in {x.casefold() for x in entries},
                'Duplicate source baseline entry')
        entries[rel] = digest
        safe_path(root, rel)
    expected = set(rels) - SOURCE_BASELINE_EXCLUDED
    require(set(entries) == expected, 'Source baseline coverage differs')
    for rel, digest in entries.items():
        require(sha(safe_path(root, rel).read_bytes()) == digest, f'Source baseline mismatch: {rel}')

def read_json(path: Path):
    try:
        return json.loads(path.read_text(encoding='utf-8'))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise InvalidPack(f'Cannot read JSON: {path.name}: {exc}') from exc

def safe_path(root: Path, relative: str) -> Path:
    p = PurePosixPath(relative)
    require(bool(relative) and not p.is_absolute() and '..' not in p.parts and '\\' not in relative,
            f'Unsafe path: {relative}')
    result = (root / relative).resolve()
    require(result.is_relative_to(root.resolve()), f'Path escapes root: {relative}')
    return result

def validate(root: Path) -> dict:
    root = root.resolve()
    require(root.is_dir(), 'Pack directory missing')
    paths = [p for p in root.rglob('*') if p.is_file() and '__pycache__' not in p.parts and p.suffix.lower() != '.pyc']
    require(not any(p.is_symlink() for p in root.rglob('*')), 'Symlinks are not allowed')
    rels = [p.relative_to(root).as_posix() for p in paths]
    require(len(rels) == len({p.casefold() for p in rels}), 'Case-colliding paths')
    for rel in rels:
        safe_path(root, rel)
        require(Path(rel).suffix.lower() not in {'.exe', '.dll', '.ps1', '.bat', '.cmd', '.sh'},
                f'Unexpected executable payload: {rel}')
    checkfile = root / 'CHECKSUMS.sha256'
    require(checkfile.is_file(), 'Checksum inventory missing')
    hashes = {}
    for line in checkfile.read_text(encoding='utf-8').splitlines():
        m = re.fullmatch(r'([a-f0-9]{64})  (.+)', line)
        require(m is not None, 'Malformed checksum line')
        digest, rel = m.groups()
        require(rel not in hashes, 'Duplicate checksum entry')
        hashes[rel] = digest
    require(bool(hashes), 'Checksum inventory empty')
    require(set(hashes) == set(rels) - {'CHECKSUMS.sha256'}, 'Checksum inventory coverage differs')
    for rel, digest in hashes.items():
        require(sha(safe_path(root, rel).read_bytes()) == digest, f'Checksum mismatch: {rel}')
    inv = read_json(root / 'SKILL-INVENTORY.json')
    require(len(inv) == 70, 'Expected 70 new routines')
    names = [x['name'] for x in inv]
    rows = [x['register_row'] for x in inv]
    require(len(set(names)) == 70 and len(set(rows)) == 70, 'Duplicate skill or register row')
    require(set(rows) == set(range(1, 98)) - PREVIOUS, 'Remaining-register complement differs')
    require({x['register_row'] for x in inv if x['off_default']} == GATED, 'Off-default policy differs')
    require({x['register_row'] for x in inv if x['source_gated']} == ISO, 'Licensed-source boundary differs')
    actual_roots = {p.relative_to(root).as_posix() for parent in ['skills', 'gated-skills']
                    for p in (root / parent).glob('*/SKILL.md')}
    require(actual_roots == {x['path'] + '/SKILL.md' for x in inv}, 'Skill directory inventory differs')
    for entry in inv:
        row, name = entry['register_row'], entry['name']
        require(re.fullmatch(r'[a-z0-9]+(?:-[a-z0-9]+)*', name) is not None, 'Invalid skill name')
        expected_path = ('gated-skills/' if row in GATED else 'skills/') + name
        require(entry['path'] == expected_path, 'Guard moved into default discovery')
        folder = safe_path(root, expected_path)
        text = (folder / 'SKILL.md').read_text(encoding='utf-8')
        require(not text.startswith('\ufeff') and '\x00' not in text, 'Invalid instruction encoding')
        lines = text.splitlines()
        require(0 < len(lines) < 100, f'Line limit violated: {name}')
        require(entry['line_count'] == len(lines), f'Stale line count: {name}')
        require(lines[:2] == ['---', 'name: ' + name] and lines[3] == '---', 'Frontmatter/name mismatch')
        require(lines[2].startswith('description: '), 'Description missing')
        description = json.loads(lines[2][13:])
        require(0 < len(description) <= 60, 'Description limit violated')
        require(len(description) == entry['description_characters'], 'Description metadata stale')
        prose = re.sub(r'`[^`]*`', '', text)
        require(re.search(r'<[A-Za-z][^>]*>', prose) is None, 'Unfenced HTML-like template')
        require('[SOURCES.md](SOURCES.md)' in text and (folder / 'SOURCES.md').is_file(), 'Source route missing')
        require('does not grant permission' in text, 'Authority boundary missing')
        require('Missing or stale evidence is not a pass.' in text, 'Evidence guard missing')
        require('Preserve facts, identifiers, links, required checks, permissions, negation' in text, 'Preservation guard missing')
        require('Historical adoption decision: ' + entry['historical_decision'] in text, 'Adoption instruction differs')
        steps = re.findall(r'^(\d+)\. ', text, re.M)
        require(steps == [str(n) for n in range(1, 11)], 'Numbered procedure steps differ')
        if row in GATED:
            require('OFF-DEFAULT GUARD' in text, 'Off-default guard missing')
        if row in ISO:
            require('Full licensed text was not obtained.' in text, 'Licensed-source disclaimer missing')
        for doc in [folder / 'SKILL.md', folder / 'SOURCES.md']:
            content = doc.read_text(encoding='utf-8')
            for dest in re.findall(r'\]\(([^)]+)\)', content):
                if urlparse(dest).scheme or dest.startswith('#'):
                    continue
                dest = unquote(dest.split('#', 1)[0])
                target = safe_path(folder, dest)
                require(target.is_file(), f'Missing local reference: {name}/{dest}')
    source_data = (root / 'provenance/STANDARDS-REGISTER-baseline.md.txt').read_bytes()
    blob = hashlib.sha1(b'blob ' + str(len(source_data)).encode() + b'\0' + source_data).hexdigest()
    require(blob == REGISTER_BLOB, 'Historical register bytes changed')
    registered = []
    for line in source_data.decode('utf-8').splitlines():
        cells = [x.strip() for x in line.strip('|').split('|')]
        if line.startswith('| ') and not line.startswith('| Candidate') and len(cells) == 7:
            registered.append(cells)
    require(len(registered) == 97, 'Register parse count differs')
    coverage = read_json(root / 'REGISTER-COVERAGE.json')['entries']
    require([x['register_row'] for x in coverage] == list(range(1, 98)), 'Register coverage incomplete/duplicate')
    for n, (original, mapped) in enumerate(zip(registered, coverage), 1):
        require(mapped['candidate'] == original[0] and mapped['historical_version'] == original[1]
                and mapped['historical_decision'] == original[2] and mapped['historical_source'] == original[6],
                f'Register decision/source drift: row {n}')
        require(mapped['selected_here'] == (n not in PREVIOUS), 'Previous/new coverage overlap')
    sources = read_json(root / 'SOURCE-MANIFEST.json')
    require(len({x['path'] for x in sources}) == len(sources), 'Duplicate source path')
    source_pdfs = set()
    pdf_digests = set()
    for s in sources:
        p = safe_path(root, s['path'])
        require(p.is_file(), 'Missing bundled original')
        data = p.read_bytes()
        require(len(data) == s['bytes'] and sha(data) == s['sha256'], 'Source bytes differ')
        require(s['official_url'].startswith('https://') and s['rights'] and s['publisher'], 'Source provenance incomplete')
        if 'pages' in s:
            require(data.startswith(b'%PDF-') and b'%%EOF' in data[-2048:], 'Invalid PDF envelope')
            require(s['pages'] > 0, 'Invalid PDF page count')
            source_pdfs.add(s['path']); pdf_digests.add(s['sha256'])
    require(source_pdfs == {r for r in rels if r.lower().endswith('.pdf')}, 'Unmanifested PDF')
    require(len(source_pdfs) == 26 and len(pdf_digests) == 24, 'PDF copy/unique count differs')
    require(not any('cast-udl3-organizer' in r or '/atam-1998.pdf' in r or '/model-cards.pdf' in r or '/datasheets.pdf' in r for r in rels),
            'Restricted/unapproved PDF bundled')
    cases = read_json(root / 'audit/acceptance-cases.json')
    require(cases['model_runs'] == 0 and cases['status'] == 'authored_not_executed', 'Unrun cases misrepresented')
    cases = cases['cases']
    require(len(cases) == 210 and len({x['id'] for x in cases}) == 210, 'Authored case count/identity differs')
    for name in names:
        c = [x for x in cases if x['skill'] == name]
        require(len(c) == 3 and {x['case_type'] for x in c} == {'positive', 'near_miss', 'missing_evidence'}, 'Case coverage missing')
        require(all(x['status'] == 'authored_not_executed' and x['prompt'] and x['expected'] for x in c), 'Invalid case record')
    require(sha((root / 'SOURCE-MANIFEST.json').read_bytes()) == SOURCE_MANIFEST_SHA256, 'Independent publisher baseline changed')
    require(sha((root / 'SKILL-INVENTORY.json').read_bytes()) == SKILL_INVENTORY_SHA256, 'Independent routine baseline changed')
    verify_source_baseline(root, rels)
    return dict(result='PASS', files=len(paths), checksum_entries=len(hashes), skills=70,
                off_default=7, register_entries=97, pdf_copies=len(source_pdfs), pdf_unique=len(pdf_digests),
                authored_cases=210, live_model_runs=0,
                scope='Structural integrity and inventory only; not semantic, model or conformance validation')

if __name__ == '__main__':
    try:
        folder = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).resolve().parents[1]
        print(json.dumps(validate(folder), indent=2))
    except (InvalidPack, OSError, KeyError, ValueError) as exc:
        print('FAIL: ' + str(exc), file=sys.stderr)
        sys.exit(1)
