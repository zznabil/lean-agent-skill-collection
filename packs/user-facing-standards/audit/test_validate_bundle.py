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

SURFACES = (
    "CATALOG.md",
    "README.md",
    "SOURCE-MANIFEST.json",
    "audit/ASD-STE100-source-study-and-proposal.md",
)


def append_surface_claim(path: Path, claim: str) -> None:
    text = path.read_text(encoding="utf-8")
    if path.name == "SOURCE-MANIFEST.json":
        marker = "No approval assertion is made."
        assert marker in text
        text = text.replace(marker, f"{marker} {claim}", 1)
    else:
        text = text.rstrip() + chr(10) + claim + chr(10)
    path.write_text(text, encoding="utf-8", newline=chr(10))



def rehash(root: Path) -> None:
    files = inventory(root)
    (root / "CHECKSUMS.sha256").write_text(
        "".join(
            f"{digest(path.read_bytes())}  {name}\n"
            for name, path in sorted(files.items())
            if name != "CHECKSUMS.sha256"
        ),
        encoding="utf-8",
        newline="\n",
    )


class BundleTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp = tempfile.TemporaryDirectory(prefix="lean-standards-test-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / "pack"
        shutil.copytree(ROOT, self.root)

    def assertRejected(self, phrase: str) -> None:
        with self.assertRaisesRegex(InvalidBundle, phrase):
            validate(self.root)

    def test_positive_control(self) -> None:
        self.assertEqual(validate(self.root)["skills"], 27)

    def test_integration_base_scope_is_explicit(self) -> None:
        path = self.root / "SOURCE-MANIFEST.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        data["integration_base_scope"] = "The current bytes are in this file."
        path.write_text(
            json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n"
        )
        rehash(self.root)
        self.assertRejected("integration base scope is unclear")

    def test_approval_assertions_are_rejected_after_rehash(self) -> None:
        mutations = {
            "CATALOG.md": ("retained ASD-STE100 internal pilot", "approved ASD-STE100 pilot"),
            "README.md": ("retained ASD-STE100 internal prototype", "approved ASD-STE100 routine"),
            "SOURCE-MANIFEST.json": ("retained internal pilot unchanged", "approved pilot retained unchanged"),
            "audit/ASD-STE100-source-study-and-proposal.md": (
                "retained internal prototype record",
                "local approval prototype",
            ),
        }
        for relative, (old, new) in mutations.items():
            path = self.root / relative
            original = path.read_bytes()
            try:
                text = original.decode("utf-8")
                self.assertIn(old, text)
                path.write_text(text.replace(old, new, 1), encoding="utf-8", newline="\n")
                rehash(self.root)
                self.assertRejected("approval assertion")
            finally:
                path.write_bytes(original)
                rehash(self.root)

    def test_approval_claim_polarity_after_rehash(self) -> None:
        cases = (
            ("Publisher approval granted.", True),
            ("This is not an approved ASD-STE100 pilot.", False),
            ("No approval assertion is made; Publisher approval granted.", True),
        )
        for claim, rejected in cases:
            for relative in SURFACES:
                path = self.root / relative
                original = path.read_bytes()
                try:
                    append_surface_claim(path, claim)
                    rehash(self.root)
                    if rejected:
                        self.assertRejected("approval assertion")
                    else:
                        self.assertEqual(validate(self.root)["skills"], 27)
                finally:
                    path.write_bytes(original)
                    rehash(self.root)

    def test_instruction_change_even_with_rehashed_inventory(self) -> None:
        p = self.root / "skills/standard-asd-ste100/SKILL.md"
        text = p.read_text(encoding="utf-8")
        self.assertIn("Do not mechanically replace MAY", text)
        p.write_text(
            text.replace("Do not mechanically replace MAY", "Always replace MAY"),
            encoding="utf-8",
            newline="\n",
        )
        rehash(self.root)
        self.assertRejected("prototype instruction changed")

    def test_overlong_skill(self) -> None:
        p = self.root / "skills/standard-asd-ste100/SKILL.md"
        p.write_bytes(p.read_bytes() + b"\n")
        rehash(self.root)
        self.assertRejected("line budget")

    def test_cross_skill_dependency(self) -> None:
        p = self.root / "skills/standard-bcp14/SOURCES.md"
        p.write_bytes(
            p.read_bytes() + b"\n[dependency](../standard-asd-ste100/SKILL.md)\n"
        )
        rehash(self.root)
        self.assertRejected("non-local link")

    def test_missing_reference(self) -> None:
        (self.root / "skills/standard-bcp14/references/rfc2119.txt").unlink()
        rehash(self.root)
        self.assertRejected("missing link|missing declared reference")

    def test_empty_checksum(self) -> None:
        (self.root / "CHECKSUMS.sha256").write_text("")
        self.assertRejected("empty checksum")

    def test_checksum_bom(self) -> None:
        path = self.root / "CHECKSUMS.sha256"
        path.write_bytes(bytes((0xEF, 0xBB, 0xBF)) + path.read_bytes())
        self.assertRejected("UTF-8 BOM")

    def test_duplicate_checksum(self) -> None:
        p = self.root / "CHECKSUMS.sha256"
        p.write_bytes(p.read_bytes() + p.read_bytes().splitlines(keepends=True)[0])
        self.assertRejected("duplicate")

    def test_unsafe_checksum(self) -> None:
        (self.root / "CHECKSUMS.sha256").write_text("0" * 64 + "  ../outside.txt\n", newline="\n")
        self.assertRejected("unsafe path")

    def test_windows_path_alias(self) -> None:
        (self.root / "CHECKSUMS.sha256").write_text("0" * 64 + "  C:\\outside.txt\n", newline="\n")
        self.assertRejected("non-portable path")

    def test_unexpected_file(self) -> None:
        (self.root / "extra.txt").write_text("Unexpected unreviewed data.")
        self.assertRejected("checksum inventory mismatch")

    def test_restricted_pdf(self) -> None:
        p = self.root / "skills/guidance-cast-udl/references/cast-udl3-organizer.pdf"
        p.parent.mkdir()
        p.write_bytes(b"%PDF-1.7\nnot an authorised public reference")
        rehash(self.root)
        self.assertRejected("undeclared or missing publisher file|restricted CAST")

    def test_original_register_decision(self) -> None:
        p = self.root / "REGISTER-COVERAGE.json"
        data = json.loads(p.read_text(encoding="utf-8"))
        data["entries"][0]["adoption_decision"] = "Mandatory for every task"
        p.write_text(json.dumps(data), encoding="utf-8")
        rehash(self.root)
        self.assertRejected("original provenance changed")

    def test_fake_pass_claim(self) -> None:
        p = self.root / "VALIDATION.json"
        data = json.loads(p.read_text(encoding="utf-8"))
        data["formal_conformance_claimed"] = True
        p.write_text(json.dumps(data), encoding="utf-8")
        rehash(self.root)
        self.assertRejected("validation declaration overclaims")

    def test_publisher_baseline_drift_after_checksum_rehash(self) -> None:
        manifest_path = self.root / "audit/original-download-manifest.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        items = manifest["items"]
        matches = [entry for entry in items if entry["name"] == "rfc2119.txt"]
        self.assertEqual(len(matches), 1)
        matches[0]["bytes"] += 1
        manifest_path.write_text(
            json.dumps(manifest, indent=2) + "\n", encoding="utf-8", newline="\n"
        )
        rehash(self.root)
        self.assertRejected("publisher baseline digest drift")

    def test_publisher_and_manifest_change_after_checksum_rehash(self) -> None:
        p = self.root / "skills/standard-bcp14/references/rfc2119.txt"
        relative = p.relative_to(self.root).as_posix()
        manifest_path = self.root / "SOURCE-MANIFEST.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        matches = [
            entry
            for entry in manifest["bundled_publisher_files"]
            if entry["path"] == relative
        ]
        self.assertEqual(len(matches), 1)
        entry = matches[0]
        altered = p.read_bytes() + b"Altered text.\n"
        p.write_bytes(altered)
        entry["sha256"] = digest(altered)
        entry["bytes"] = len(altered)
        self.assertIs(entry["modified"], False)
        manifest_path.write_text(
            json.dumps(manifest, indent=2) + "\n", encoding="utf-8", newline="\n"
        )
        rehash(self.root)
        self.assertRejected(
            r"publisher manifest drift: skills/standard-bcp14/references/rfc2119\.txt"
        )

    def test_zip_roundtrip_reproducibility_and_boundaries(self) -> None:
        a = Path(self.temp.name) / "a.zip"
        b = Path(self.temp.name) / "b.zip"
        with contextlib.redirect_stdout(io.StringIO()):
            build(self.root, a)
            build(self.root, b)
        self.assertEqual(a.read_bytes(), b.read_bytes())
        with self.assertRaisesRegex(InvalidBundle, "overwrite"):
            build(self.root, a)
        with self.assertRaisesRegex(InvalidBundle, "outside the pack"):
            build(self.root, self.root / "inside.zip")
        self.assertEqual(validate(self.root)["skills"], 27)


if __name__ == "__main__":
    unittest.main(verbosity=2)
