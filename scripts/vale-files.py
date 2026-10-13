#!/usr/bin/env python3
"""List authored Markdown for Vale; preserve publisher copies and historical releases."""
import argparse
import json
from pathlib import Path
import tempfile

PATTERNS = ('*.md', '.github/*.md', 'docs/**/*.md', 'skills/**/*.md', 'packs/**/*.md')
COPIED_LICENSES = {'packs/remaining-standards/LICENSE.md'}


def select_files(root):
    files = set()
    for pattern in PATTERNS:
        for path in root.glob(pattern):
            relative = path.relative_to(root)
            if (path.is_file() and not {'official', 'references'} & set(relative.parts)
                    and relative.as_posix() not in COPIED_LICENSES):
                files.add(relative.as_posix())
    definition = root / 'release-profiles.json'
    if definition.is_file():
        version = json.loads(definition.read_text(encoding='utf-8'))['version']
        if not isinstance(version, str) or not version or '/' in version or '\\' in version:
            raise ValueError('Invalid current release version')
        notes = f'releases/v{version}/RELEASE-NOTES-v{version}.md'
        if not (root / notes).is_file():
            raise ValueError('Current release notes are missing')
        files.add(notes)
    return sorted(files)


def self_test():
    included = {'AGENTS.md', 'ENGINEERING-CORE.md', 'CONTRIBUTING.md', 'README.md',
                '.github/PULL_REQUEST_TEMPLATE.md', 'docs/SKILL-COMPOSITION.md',
                'docs/nested/current.md', 'skills/example/SKILL.md',
                'packs/example/AGENTS.md', 'packs/example/THIRD-PARTY-NOTICES.md',
                'packs/example/skills/example/SOURCES.md',
                'releases/v9.0.0/RELEASE-NOTES-v9.0.0.md'}
    excluded = {'dist/v1/README.md', 'releases/v1/RELEASE-NOTES.md',
                'packs/example/skills/example/official/source.md',
                'packs/example/skills/example/references/source.md',
                'packs/remaining-standards/LICENSE.md', '.patchloom/backup.md',
                'artifacts/README.md', '.audit-work/README.md'}
    with tempfile.TemporaryDirectory(prefix='lean-vale-selector-') as temporary:
        root = Path(temporary)
        (root / 'release-profiles.json').write_text('{"version":"9.0.0"}', encoding='utf-8')
        for relative in included | excluded:
            path = root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('Fixture.\n', encoding='utf-8')
        actual = select_files(root)
        if set(actual) != included or len(actual) != len(set(actual)):
            raise ValueError('Vale scope missed authored prose or included excluded source material')
        # An omitted contributor file must contradict the expected scope.
        broken = [path for path in actual if path != 'CONTRIBUTING.md']
        if set(broken) == included:
            raise ValueError('Omitted-file negative control was accepted')
        if actual != sorted(actual) or select_files(root) != actual:
            raise ValueError('Vale file order is not deterministic')
    print('VALE_SCOPE_SELF_TEST_PASS: authored root, contributor, companion, pack and current release prose included; publisher copies, licenses and historical releases excluded.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    if args.self_test:
        self_test()
    else:
        files = select_files(args.root.resolve())
        if not files:
            parser.error('No authored Markdown was selected')
        print(json.dumps(files))


if __name__ == '__main__':
    main()
