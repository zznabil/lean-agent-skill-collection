#!/usr/bin/env python3
"""Deliberate bad states in disposable copies; not model-behaviour tests."""
from __future__ import annotations

import contextlib
import io
import json
import shutil
import sys
import tempfile
import unittest
from pathlib import Path

sys.dont_write_bytecode = True
from validate_bundle import InvalidBundle, digest, inventory, validate
from build_zip import build

ROOT = Path(__file__).resolve().parents[1]


def rehash(root: Path) -> None:
    files = inventory(root)
    (root / 'CHECKSUMS.sha256').write_text(''.join(
        f'{digest(path.read_bytes())}  {name}\n' for name, path in sorted(files.items())
        if name != 'CHECKSUMS.sha256'), encoding='utf-8', newline='\n')


class BundleTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp = tempfile.TemporaryDirectory(prefix='lean-standards-test-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / 'pack'
        shutil.copytree(ROOT, self.root)

    def assertRejected(self, phrase: str) -> None:
        with self.assertRaisesRegex(InvalidBundle, phrase):
            validate(self.root)

    def test_positive_control(self) -> None:
        self.assertEqual(validate(self.root)['skills'], 27)

    def test_instruction_change_even_with_rehashed_inventory(self) -> None:
        p = self.root / 'skills/standard-asd-ste100/SKILL.md'
        text = p.read_text(encoding='utf-8'); self.assertIn('Do not mechanically replace MAY', text)
        p.write_text(text.replace('Do not mechanically replace MAY', 'Always replace MAY'), encoding='utf-8', newline='\n')
        rehash(self.root)
        self.assertRejected('prototype instruction changed')

    def test_overlong_skill(self) -> None:
        p = self.root / 'skills/standard-asd-ste100/SKILL.md'
        p.write_bytes(p.read_bytes() + b'\n')
        rehash(self.root)
        self.assertRejected('line budget')

    def test_cross_skill_dependency(self) -> None:
        p = self.root / 'skills/standard-bcp14/SOURCES.md'
        p.write_bytes(p.read_bytes() + b'\n[dependency](../standard-asd-ste100/SKILL.md)\n')
        rehash(self.root)
        self.assertRejected('non-local link')

    def test_missing_reference(self) -> None:
        (self.root / 'skills/standard-bcp14/references/rfc2119.txt').unlink()
        rehash(self.root)
        self.assertRejected('missing link|missing declared reference')

    def test_empty_checksum(self) -> None:
        (self.root / 'CHECKSUMS.sha256').write_text('')
        self.assertRejected('empty checksum')

    def test_duplicate_checksum(self) -> None:
        p = self.root / 'CHECKSUMS.sha256'
        p.write_bytes(p.read_bytes() + p.read_bytes().splitlines(keepends=True)[0])
        self.assertRejected('duplicate')

    def test_unsafe_checksum(self) -> None:
        (self.root / 'CHECKSUMS.sha256').write_text('0' * 64 + '  ../outside.txt\n')
        self.assertRejected('unsafe path')

    def test_windows_path_alias(self) -> None:
        (self.root / 'CHECKSUMS.sha256').write_text('0' * 64 + '  C:\\outside.txt\n')
        self.assertRejected('non-portable path')

    def test_unexpected_file(self) -> None:
        (self.root / 'extra.txt').write_text('Unexpected unreviewed data.')
        self.assertRejected('checksum inventory mismatch')

    def test_restricted_pdf(self) -> None:
        p = self.root / 'skills/guidance-cast-udl/references/cast-udl3-organizer.pdf'
        p.parent.mkdir(); p.write_bytes(b'%PDF-1.7\nnot an authorised public reference')
        rehash(self.root)
        self.assertRejected('undeclared or missing publisher file|restricted CAST')

    def test_original_register_decision(self) -> None:
        p = self.root / 'REGISTER-COVERAGE.json'
        data = json.loads(p.read_text(encoding='utf-8')); data['entries'][0]['adoption_decision'] = 'Mandatory for every task'
        p.write_text(json.dumps(data), encoding='utf-8'); rehash(self.root)
        self.assertRejected('original provenance changed')

    def test_fake_pass_claim(self) -> None:
        p = self.root / 'VALIDATION.json'
        data = json.loads(p.read_text(encoding='utf-8')); data['formal_conformance_claimed'] = True
        p.write_text(json.dumps(data), encoding='utf-8'); rehash(self.root)
        self.assertRejected('validation declaration overclaims')

    def test_publisher_file_change_after_rehash(self) -> None:
        p = self.root / 'skills/standard-bcp14/references/rfc2119.txt'
        p.write_bytes(p.read_bytes() + b'Altered text.\n'); rehash(self.root)
        self.assertRejected('publisher bytes changed')

    def test_zip_roundtrip_reproducibility_and_boundaries(self) -> None:
        a = Path(self.temp.name) / 'a.zip'; b = Path(self.temp.name) / 'b.zip'
        with contextlib.redirect_stdout(io.StringIO()):
            build(self.root, a); build(self.root, b)
        self.assertEqual(a.read_bytes(), b.read_bytes())
        with self.assertRaisesRegex(InvalidBundle, 'overwrite'):
            build(self.root, a)
        with self.assertRaisesRegex(InvalidBundle, 'outside the pack'):
            build(self.root, self.root / 'inside.zip')
        self.assertEqual(validate(self.root)['skills'], 27)


if __name__ == '__main__':
    unittest.main(verbosity=2)
