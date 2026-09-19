#!/usr/bin/env python3
"""Exercise deliberate bad states in disposable copies; not model tests."""
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

from build_zip import build
from validate_pack import InvalidPack, digest, inventory, validate

ROOT = Path(__file__).resolve().parents[1]


def rehash(root: Path) -> None:
    files = inventory(root)
    content = "".join(
        f"{digest(path.read_bytes())}  {name}\n"
        for name, path in sorted(files.items())
        if name != "CHECKSUMS.sha256"
    )
    (root / "CHECKSUMS.sha256").write_text(content, encoding="utf-8", newline="\n")


class PackTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp = tempfile.TemporaryDirectory(prefix="lean-controlled-execution-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / "pack"
        shutil.copytree(ROOT, self.root)

    def assert_rejected(self, phrase: str) -> None:
        with self.assertRaisesRegex(InvalidPack, phrase):
            validate(self.root)

    def test_positive_control(self) -> None:
        result = validate(self.root)
        self.assertEqual(result["skills"], 13)
        self.assertEqual(result["authored_cases"], 39)

    def test_missing_skill(self) -> None:
        shutil.rmtree(self.root / "skills/practice-normative-precision")
        rehash(self.root)
        self.assert_rejected("exact pack inventory mismatch")

    def test_instruction_change_after_checksum_rehash(self) -> None:
        path = self.root / "skills/practice-verifiable-requirements/SKILL.md"
        text = path.read_text(encoding="utf-8")
        self.assertIn("one accountable actor", text)
        path.write_text(
            text.replace("one accountable actor", "any available actor", 1),
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assert_rejected("authored skill baseline drift")

    def test_source_note_change_after_checksum_rehash(self) -> None:
        path = self.root / "skills/guidance-safety-messages/SOURCES.md"
        path.write_text(
            path.read_text(encoding="utf-8") + "\nAltered source claim.\n",
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assert_rejected("source-note line count mismatch|source-note baseline drift")

    def test_frontmatter_identity_change(self) -> None:
        path = self.root / "skills/practice-state-verification/SKILL.md"
        text = path.read_text(encoding="utf-8")
        path.write_text(
            text.replace("name: practice-state-verification", "name: practice-other-state", 1),
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assert_rejected("frontmatter mismatch")

    def test_overlong_skill(self) -> None:
        path = self.root / "skills/practice-compliant-contrast/SKILL.md"
        path.write_text(
            path.read_text(encoding="utf-8") + "".join(f"Extra line {index}.\n" for index in range(70)),
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assert_rejected("line budget")

    def test_bundled_pdf(self) -> None:
        path = self.root / "skills/guidance-safety-messages/source.pdf"
        path.write_bytes(b"%PDF-1.7\nnot an authorised publisher copy\n")
        rehash(self.root)
        self.assert_rejected("exact pack inventory mismatch|bundled publisher")

    def test_control_model_field_removed(self) -> None:
        path = self.root / "CONTROL-MODEL.md"
        text = path.read_text(encoding="utf-8")
        path.write_text(
            text.replace("### HOLD POINT\n", "### DELETED FIELD\n", 1),
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assert_rejected("control-model field missing: HOLD POINT")

    def test_manifest_scope_overclaim(self) -> None:
        path = self.root / "SOURCE-MANIFEST.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        data["release_profiles_changed"] = True
        path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n")
        rehash(self.root)
        self.assert_rejected("release profile scope changed")

    def test_validation_overclaim(self) -> None:
        path = self.root / "VALIDATION.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        data["formal_conformance_claimed"] = True
        path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n")
        rehash(self.root)
        self.assert_rejected("validation declaration overclaims")

    def test_acceptance_case_drift(self) -> None:
        path = self.root / "audit/acceptance-cases.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        data["cases"].pop()
        path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n")
        rehash(self.root)
        self.assert_rejected("acceptance case count mismatch")

    def test_non_https_source(self) -> None:
        path = self.root / "SOURCE-MANIFEST.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        data["skills"][0]["source_urls"][0] = "http://example.invalid/source"
        path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n")
        rehash(self.root)
        self.assert_rejected("invalid source URL")

    def test_checksum_tamper(self) -> None:
        path = self.root / "README.md"
        path.write_text(
            path.read_text(encoding="utf-8") + "\nTampered without checksum update.\n",
            encoding="utf-8",
            newline="\n",
        )
        self.assert_rejected("checksum mismatch")

    def test_zip_roundtrip_reproducibility_and_boundaries(self) -> None:
        first = Path(self.temp.name) / "first.zip"
        second = Path(self.temp.name) / "second.zip"
        with contextlib.redirect_stdout(io.StringIO()):
            build(self.root, first)
            build(self.root, second)
        self.assertEqual(first.read_bytes(), second.read_bytes())
        with self.assertRaisesRegex(InvalidPack, "overwrite"):
            build(self.root, first)
        with self.assertRaisesRegex(InvalidPack, "outside the pack"):
            build(self.root, self.root / "inside.zip")
        self.assertEqual(validate(self.root)["skills"], 13)


if __name__ == "__main__":
    unittest.main(verbosity=2)
