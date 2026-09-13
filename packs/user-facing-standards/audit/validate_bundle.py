#!/usr/bin/env python3
"""Read-only, standard-library verification. No publisher code or model is run."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter
from pathlib import Path, PurePosixPath


class InvalidBundle(ValueError):
    """An observed contract failure, distinct from an unexpected checker bug."""


def require(condition: object, message: str) -> None:
    if not condition:
        raise InvalidBundle(message)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def local_path(root: Path, relative: str) -> Path:
    require(isinstance(relative, str) and relative, 'empty or non-string path')
    require('\\' not in relative and ':' not in relative, f'non-portable path: {relative}')
    parts = PurePosixPath(relative)
    require(not parts.is_absolute() and '..' not in parts.parts
            and parts.as_posix() == relative and relative != '.', f'unsafe path: {relative}')
    path = root.joinpath(*parts.parts)
    require(not any(p.is_symlink() for p in [path, *path.parents] if p != root.parent),
            f'symlink path: {relative}')
    require(path.resolve().is_relative_to(root.resolve()), f'path escapes root: {relative}')
    return path


def read_json(root: Path, relative: str) -> dict:
    try:
        value = json.loads(local_path(root, relative).read_text(encoding='utf-8'))
    except (OSError, UnicodeError, ValueError) as exc:
        raise InvalidBundle(f'cannot read {relative}: {exc}') from exc
    require(isinstance(value, dict), f'expected JSON object: {relative}')
    return value


def inventory(root: Path) -> dict[str, Path]:
    found = {}
    for path in root.rglob('*'):
        relative = path.relative_to(root).as_posix()
        require(not path.is_symlink(), f'symlink entry: {relative}')
        if path.is_file():
            local_path(root, relative)
            found[relative] = path
    require(len({name.casefold() for name in found}) == len(found), 'case-colliding files')
    return found


def read_checksums(root: Path) -> dict[str, str]:
    checksums = {}
    try:
        lines = (root / 'CHECKSUMS.sha256').read_text(encoding='utf-8').splitlines()
    except (OSError, UnicodeError) as exc:
        raise InvalidBundle(f'cannot read checksum inventory: {exc}') from exc
    require(lines, 'empty checksum inventory')
    for line in lines:
        match = re.fullmatch(r'([a-f0-9]{64})  (.+)', line)
        require(match is not None, 'malformed checksum entry')
        value, relative = match.groups()
        local_path(root, relative)
        require(relative not in checksums and relative != 'CHECKSUMS.sha256',
                f'duplicate or self-checksum: {relative}')
        checksums[relative] = value
    return checksums


def check_links(document: Path, boundary: Path) -> None:
    text = document.read_text(encoding='utf-8')
    targets = re.findall(r'\]\(([^)]+)\)', text)
    targets += re.findall(r'^\[[^\]]+\]:\s+(\S+)', text, re.M)
    for target in targets:
        if re.match(r'^[a-z][a-z0-9+.-]*:', target, re.I) or target.startswith('#'):
            continue
        path = (document.parent / target.split('#')[0]).resolve()
        require(path.is_relative_to(boundary.resolve()), f'non-local link in {document.name}: {target}')
        require(path.is_file(), f'missing link in {document.name}: {target}')


def validate(root: Path) -> dict:
    root = root.resolve()
    require(root.is_dir(), 'pack directory does not exist')
    files = inventory(root)
    checksums = read_checksums(root)
    require(set(files) - {'CHECKSUMS.sha256'} == set(checksums), 'checksum inventory mismatch')
    for relative, value in checksums.items():
        require(digest(files[relative].read_bytes()) == value, f'checksum mismatch: {relative}')

    manifest = read_json(root, 'SOURCE-MANIFEST.json')
    coverage = read_json(root, 'REGISTER-COVERAGE.json')
    origin = read_json(root, 'audit/IMPORT-RECORD.json')
    contract = read_json(root, 'VALIDATION.json')
    require(manifest['status'] == 'public_repository_prototype_for_review', 'wrong distribution scope')
    records = manifest['skills']
    names = [entry['name'] for entry in records]
    require(len(names) == 27 and len(set(names)) == 27, 'expected 27 unique skill records')
    require(set(names) == set(origin['skill_sha256']), 'imported skill inventory mismatch')
    roots = sorted((root / 'skills').glob('*/SKILL.md'))
    require({p.parent.name for p in roots} == set(names) and len(roots) == 27, 'skill directory inventory mismatch')
    by_name = {entry['name']: entry for entry in records}
    for path in roots:
        data = path.read_bytes()
        require(not data.startswith(b'\xef\xbb\xbf') and b'\r' not in data, f'noncanonical text: {path.parent.name}')
        text = data.decode('utf-8')
        lines = text.splitlines()
        name = path.parent.name
        match = re.match(r'\A---\nname: ([a-z0-9-]+)\ndescription: "([^"\n]+)"\n---\n', text)
        require(match is not None and match[1] == name, f'frontmatter mismatch: {name}')
        require(len(match[2]) <= 60 and match[2] == by_name[name]['description'], f'description mismatch: {name}')
        require(len(lines) < 100 and len(lines) == by_name[name]['lines'], f'line budget or count mismatch: {name}')
        reconstructed = text
        if name in origin['skill_changes']:
            change = origin['skill_changes'][name]
            require(text.count(change['after']) == 1, f'undeclared source-access change: {name}')
            reconstructed = text.replace(change['after'], change['before'])
        require(digest(reconstructed.encode('utf-8')) == origin['skill_sha256'][name], f'prototype instruction changed: {name}')
        require((path.parent / 'SOURCES.md').is_file(), f'missing sources: {name}')
        for note in path.parent.glob('*.md'):
            check_links(note, path.parent)
        require(by_name[name]['formal_conformance_claimed'] is False
                and by_name[name]['behavioural_evaluation'] == 'not_run', f'unsupported claim: {name}')
        for relative in by_name[name]['bundled_files']:
            require(local_path(path.parent, relative).is_file(), f'missing declared reference: {name}/{relative}')

    require(coverage['registered_entries'] == 97 and len(coverage['entries']) == 97, 'register count mismatch')
    selected = [x['skill'] for x in coverage['entries'] if x['selected_for_this_pack']]
    require(len(selected) == 27 and set(selected) == set(names), 'selected register coverage mismatch')
    for relative, value in origin['frozen_provenance'].items():
        require(digest(local_path(root, relative).read_bytes()) == value, f'original provenance changed: {relative}')
    require(manifest['asd_pilot_sha256'] == origin['skill_sha256']['standard-asd-ste100'], 'ASD pilot pin mismatch')

    publisher = manifest['bundled_publisher_files']
    publisher_names = [x['path'] for x in publisher]
    require(len(publisher_names) == 19 and len(set(publisher_names)) == 19, 'publisher inventory mismatch')
    actual_refs = {p for p in files if '/references/' in p}
    require(actual_refs == set(publisher_names), 'undeclared or missing publisher file')
    pdf_hashes = []
    for entry in publisher:
        data = local_path(root, entry['path']).read_bytes()
        require(digest(data) == entry['sha256'] and len(data) == entry['bytes'], f'publisher bytes changed: {entry["path"]}')
        require(entry['modified'] is False and entry['source_url'].startswith('https://'), 'invalid publisher provenance')
        if entry['path'].endswith('.pdf'):
            require(data.startswith(b'%PDF-'), f'not a PDF: {entry["path"]}')
            pdf_hashes.append(digest(data))
    require(len(pdf_hashes) == 3 and len(set(pdf_hashes)) == 1, 'public PDF inventory mismatch')
    forbidden = origin['reference_exclusion_sha256']
    require(not any('cast-udl3-organizer.pdf' in p for p in files), 'restricted CAST PDF included')
    require(all(digest(p.read_bytes()) != forbidden for p in files.values()), 'restricted CAST bytes renamed')

    cases = read_json(root, 'audit/acceptance-cases.json')
    require(cases['status'] == 'authored_not_executed' and cases['model_calls'] == 0, 'cases mislabelled as model results')
    require(len(cases['cases']) == 81 and len({x['id'] for x in cases['cases']}) == 81, 'case inventory mismatch')
    require(Counter(x['skill'] for x in cases['cases']) == Counter({name: 3 for name in names}), 'case coverage mismatch')
    require(contract['status'] == 'declared_contract_not_execution_evidence'
            and contract['live_model_evaluation'] == 'not_run'
            and contract['formal_conformance_claimed'] is False, 'validation declaration overclaims')
    require((root / 'LICENSE').is_file() and (root / 'THIRD-PARTY-NOTICES.md').is_file(), 'missing rights notices')
    for path in root.rglob('*.md'):
        if path.relative_to(root).parts[0] != 'skills':
            check_links(path, root)
    return {'skills': 27, 'publisher_file_copies': 19, 'pdf_copies': 3, 'authored_cases': 81,
            'files': len(files), 'scope': 'structural and source integrity only; no live-model evaluation'}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', nargs='?', type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    try:
        result = validate(args.root)
    except (InvalidBundle, OSError, UnicodeError, KeyError, TypeError) as exc:
        print(f'FAIL: {exc}')
        return 1
    print('PASS: ' + json.dumps(result, sort_keys=True))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
