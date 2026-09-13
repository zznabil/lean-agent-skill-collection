"""Positive and deliberate-damage controls; all writes use temporary copies."""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
import shutil
import sys
sys.dont_write_bytecode = True
import tempfile
import unittest
import zipfile
from validate_bundle import InvalidPack, validate
from build_zip import build

SOURCE = Path(__file__).resolve().parents[1]

def refresh_checksums(root: Path) -> None:
    files = sorted(p for p in root.rglob('*') if p.is_file() and p.name != 'CHECKSUMS.sha256')
    text = ''.join(hashlib.sha256(p.read_bytes()).hexdigest() + '  ' + p.relative_to(root).as_posix() + '\n' for p in files)
    (root / 'CHECKSUMS.sha256').write_text(text, encoding='utf-8')

def edit_json(root: Path, name: str, edit) -> None:
    p = root / name; obj = json.loads(p.read_text(encoding='utf-8'))
    edit(obj); p.write_text(json.dumps(obj, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')

def replace(root: Path, name: str, before: str, after: str) -> None:
    p = root / name; text = p.read_text(encoding='utf-8')
    if before not in text:
        raise AssertionError('Mutation target missing: ' + before)
    p.write_text(text.replace(before, after, 1), encoding='utf-8')

class PackControls(unittest.TestCase):
    def reject(self, edit, reason: str, refresh: bool = True) -> None:
        with tempfile.TemporaryDirectory(prefix='lean-standards-test-') as td:
            root = Path(td) / 'pack'; shutil.copytree(SOURCE, root)
            edit(root)
            if refresh:
                refresh_checksums(root)
            with self.assertRaisesRegex(InvalidPack, reason):
                validate(root)
    def test_01_positive_source(self):
        self.assertEqual(validate(SOURCE)['skills'], 70)
    def test_02_missing_skill(self):
        self.reject(lambda p: (p/'skills/standard-iso-29148/SKILL.md').unlink(), 'Skill directory inventory differs')
    def test_03_missing_source_notes(self):
        self.reject(lambda p: (p/'skills/standard-iso-29148/SOURCES.md').unlink(), 'Source route missing')
    def test_04_hundred_lines(self):
        def edit(p):
            f=p/'skills/standard-iso-29148/SKILL.md';t=f.read_text();f.write_text(t+'\n'*(100-len(t.splitlines())) )
        self.reject(edit, 'Line limit violated')
    def test_05_long_description(self):
        def edit(p):
            f=p/'skills/standard-iso-29148/SKILL.md';lines=f.read_text().splitlines();lines[2]='description: '+json.dumps('x'*61);f.write_text('\n'.join(lines)+'\n')
        self.reject(edit, 'Description limit violated')
    def test_06_wrong_name(self):
        self.reject(lambda p: replace(p,'skills/standard-iso-29148/SKILL.md','name: standard-iso-29148','name: unrelated-skill'),'Frontmatter/name mismatch')
    def test_07_lost_source_limit(self):
        self.reject(lambda p: replace(p,'skills/standard-iso-29148/SKILL.md','Full licensed text was not obtained.','Full licensed text is already verified.'),'Licensed-source disclaimer missing')
    def test_08_lost_permission_boundary(self):
        self.reject(lambda p: replace(p,'skills/standard-iso-29148/SKILL.md','does not grant permission','always grants permission'),'Authority boundary missing')
    def test_09_lost_evidence_guard(self):
        self.reject(lambda p: replace(p,'skills/standard-iso-29148/SKILL.md','Missing or stale evidence is not a pass.','Missing or stale evidence is a full pass.'),'Evidence guard missing')
    def test_10_guard_in_default_directory(self):
        def edit(p):
            shutil.move(str(p/'gated-skills/guard-dora-metrics'),str(p/'skills/guard-dora-metrics'))
            edit_json(p,'SKILL-INVENTORY.json',lambda xs: next(x for x in xs if x['register_row']==76).update(path='skills/guard-dora-metrics'))
        self.reject(edit,'Guard moved into default discovery')
    def test_11_register_adoption_changed(self):
        self.reject(lambda p: edit_json(p,'REGISTER-COVERAGE.json',lambda c:c['entries'][70].update(historical_decision='Always mandatory')),'Register decision/source drift')
    def test_12_register_entry_missing(self):
        self.reject(lambda p: edit_json(p,'REGISTER-COVERAGE.json',lambda c:c['entries'].pop()),'Register coverage incomplete/duplicate')
    def test_13_duplicate_skill_name(self):
        self.reject(lambda p: edit_json(p,'SKILL-INVENTORY.json',lambda xs:xs[1].update(name=xs[0]['name'])),'Duplicate skill or register row')
    def test_14_changed_pdf_bytes(self):
        def edit(p):
            f=p/'skills/standard-nist-ssdf/official/nist-ssdf-1.1.pdf';f.write_bytes(f.read_bytes()[:-20])
        self.reject(edit,'Source bytes differ')
    def test_15_unmanifested_pdf(self):
        self.reject(lambda p:(p/'extra.pdf').write_bytes(b'%PDF-1.7\n%%EOF\n'),'Unmanifested PDF')
    def test_16_reference_escape(self):
        self.reject(lambda p:replace(p,'skills/standard-iso-29148/SKILL.md','[SOURCES.md](SOURCES.md)','[SOURCES.md](SOURCES.md) [other](../secret.md)'),'Unsafe path')
    def test_17_empty_checksums(self):
        self.reject(lambda p:(p/'CHECKSUMS.sha256').write_text(''),'Checksum inventory empty',refresh=False)
    def test_18_changed_baseline(self):
        self.reject(lambda p:replace(p,'provenance/STANDARDS-REGISTER-baseline.md.txt','Reject globally','Always required'),'Historical register bytes changed')
    def test_19_fake_model_pass(self):
        self.reject(lambda p:edit_json(p,'audit/acceptance-cases.json',lambda x:x.update(status='passed',model_runs=210)),'Unrun cases misrepresented')
    def test_20_missing_cases(self):
        self.reject(lambda p:edit_json(p,'audit/acceptance-cases.json',lambda x:x['cases'].pop()),'Authored case count/identity differs')
    def test_21_undeclared_file(self):
        self.reject(lambda p:(p/'unlisted.txt').write_text('unexpected'),'Checksum inventory coverage differs',refresh=False)
    def test_22_repeatable_zip_roundtrip(self):
        with tempfile.TemporaryDirectory(prefix='lean-standards-zip-') as td:
            td=Path(td); a=td/'a.zip'; b=td/'b.zip';build(SOURCE,a);build(SOURCE,b)
            self.assertEqual(a.read_bytes(),b.read_bytes())
            with zipfile.ZipFile(a) as z:
                self.assertIsNone(z.testzip())
                z.extractall(td/'extracted')
            self.assertEqual(validate(td/'extracted/lean-remaining-standards')['result'],'PASS')
    def test_23_unfenced_template(self):
        self.reject(lambda p: replace(p,'skills/practice-ears/SKILL.md','`The <system> shall <response>.`','The <system> shall <response>.'),'Unfenced HTML-like template')
    def test_24_positive_restored(self):
        self.assertEqual(validate(SOURCE)['result'],'PASS')

if __name__ == '__main__':
    unittest.main(verbosity=2)
