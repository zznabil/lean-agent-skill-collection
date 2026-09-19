#!/usr/bin/env python3
"""Read-only validation for the controlled-execution review pack."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter
from pathlib import Path, PurePosixPath
from urllib.parse import urlparse

EXPECTED_SKILLS = ('practice-normative-precision',
 'practice-verifiable-requirements',
 'practice-compliant-contrast',
 'practice-use-error-controls',
 'practice-state-verification',
 'practice-transition-checklists',
 'guidance-safety-messages',
 'guidance-safe-technical-procedures',
 'practice-versioned-verification-requirements',
 'practice-implementation-example-traceability',
 'profile-ui-procedure-writing',
 'profile-action-step-structure',
 'practice-modular-information-units')
SKILL_SHA256 = {'practice-normative-precision': 'b91aab4a1314b16bda7fbd88cbdc18bb87d601e19c2c84a3121969363855d14d',
 'practice-verifiable-requirements': '0e09c35b143a293267ebc18ec923ca4ca5c5608d6215030079b18fb618822e79',
 'practice-compliant-contrast': 'dbae29e422e0e0e4a492cc391d05bcc1d637d623415f7facaa7ac6187b5632b9',
 'practice-use-error-controls': 'fd5e8a08049679f1ca152951d3207c6cccbf6bee50f061c487dd3fdf95ff4717',
 'practice-state-verification': '850aeacd2cd2f3499c632e2c3f0f9c3caef07246de6c71fcd3a1dc13253727f8',
 'practice-transition-checklists': 'a1029371f943770b2e80ec334b986e317d2063774f04f0fa2d0babb53236f77e',
 'guidance-safety-messages': 'e4839435b049ecb49001c118d4507419ab3e3ebbe6f2afbb1cbccdc678ad3348',
 'guidance-safe-technical-procedures': '9aa43db5f6098fc1cbcfd9628c37e5e61d5df22a04e92e6406cf4742c45e2e13',
 'practice-versioned-verification-requirements': 'bc9dbc9e99e0cc648d119a342febaf248dc1b5dc2f09c39b4d2c98e6742037fa',
 'practice-implementation-example-traceability': '26cf345ba0e6228355c04a252d468df70cc3e81a5733c461766bf9c4030c956f',
 'profile-ui-procedure-writing': '6163fe17e4ba3301f7c4c99c13a9079cfaaa2571b4e06e3d1e283f05cbe8a201',
 'profile-action-step-structure': 'f1414c320f898d7829d09dfdde6d0a6f37d1d8f802f517257cf7513012e57a99',
 'practice-modular-information-units': 'b502a134ed2215f01bd8e24d64a5629d7ed113ba414ac233e7e47b84f528128e'}
SOURCE_NOTE_SHA256 = {'practice-normative-precision': 'ce7a5a431a08ef1a9812de98724e8ba692391af6bb3b00b6256974827d7b56fe',
 'practice-verifiable-requirements': '2819999a2b1a03cd657edb7292ca56d123b63ea789ae1b7435822cd55321e567',
 'practice-compliant-contrast': '86a87cf4ffd5f06f851f25c5fae9a8fff51a0d8c78cb73ed1ae84e98fefc9ee2',
 'practice-use-error-controls': '8cbef45d11ef657b87bf43d859bbe1a78aeb812e46fa6627585424db4f0181aa',
 'practice-state-verification': '35be129fdb3a4569aab140a3b6d588b6728ec53af36cefad33b46dc53d929b80',
 'practice-transition-checklists': '091e30cc04f595db73b76bef23c92e48ea4e164e394cc5d0eb8959f0aeebd244',
 'guidance-safety-messages': '928338a5bb065970bcbb8ac9dca25fe6d6172babd890f565e4c0b816e3244ea9',
 'guidance-safe-technical-procedures': '6f9a82037fdf4b4778cafe67216b8e3872294e79d37d75a874544eac69489939',
 'practice-versioned-verification-requirements': '5a52264f00ac858e2e5ff1f3b8f33ba2f2eb512ebd9c3e7955e3c1fe71c022b7',
 'practice-implementation-example-traceability': '1da53970cd0a8f90ef833225818e10369481e0d2b047e0b4bfbd60f0bc28c62f',
 'profile-ui-procedure-writing': 'bb920e7f217d3349cf7826707f8d504620b5201102251ea5a26c970f9bbdf93e',
 'profile-action-step-structure': '1d341c8f5ddf8af63b7534f6d48a82f0a3d207d7ae437e04c0b809bfaed26159',
 'practice-modular-information-units': '2a7e4b180699a26ffb47aec5e2db642804c3bd8c0a2bafd1732b7eb6171fc356'}
CORE_SHA256 = {'SOURCE-MANIFEST.json': '57eaa6e3ff20755818d6dcf92140adb53d6a9c36ac9b6d52a8867ec220f04f32',
 'CONTROL-MODEL.md': 'fd944b48388ee8d15caf427fd897e2321a1aaa01cbe8518364e51d16a35eff95',
 'audit/acceptance-cases.json': '77a924439b5cd612250fec7e755f566521665edc407de4b81435b7790c2700d4',
 'VALIDATION.json': '300c5a2ad604e0beb9b934c5caba4ed2219ad4e7dd8838a38197aed8a1b60e37',
 'CATALOG.md': 'e45868b4d8d69476f497fa8f9b397cb6536564bca8219fd2b3d3b9d944810a15'}
CONTROL_FIELDS = (
    "ID",
    "TYPE",
    "ACTOR",
    "TRIGGER / PRECONDITION",
    "REQUIREMENT",
    "PROHIBITION",
    "EXPECTED RESULT",
    "EVIDENCE",
    "VERIFIER",
    "HOLD POINT",
    "FAILURE CONDITION",
    "RECOVERY",
    "EXCEPTION",
    "RATIONALE",
    "REFERENCES",
)
FIXED_FILES = {
    "README.md",
    "CATALOG.md",
    "CONTROL-MODEL.md",
    "SOURCE-MANIFEST.json",
    "VALIDATION.json",
    "CHECKSUMS.sha256",
    "LICENSE",
    "THIRD-PARTY-NOTICES.md",
    "audit/acceptance-cases.json",
    "audit/validate_pack.py",
    "audit/test_validate_pack.py",
    "audit/build_zip.py",
}
EXPECTED_FILES = FIXED_FILES | {
    f"skills/{name}/{filename}"
    for name in EXPECTED_SKILLS
    for filename in ("SKILL.md", "SOURCES.md")
}


class InvalidPack(ValueError):
    """An observed contract failure, distinct from a checker defect."""


def require(condition: object, message: str) -> None:
    if not condition:
        raise InvalidPack(message)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def local_path(root: Path, relative: str) -> Path:
    require(isinstance(relative, str) and relative, "empty or non-string path")
    require("\\" not in relative and ":" not in relative, f"non-portable path: {relative}")
    parts = PurePosixPath(relative)
    require(
        not parts.is_absolute()
        and ".." not in parts.parts
        and parts.as_posix() == relative
        and relative != ".",
        f"unsafe path: {relative}",
    )
    path = root.joinpath(*parts.parts)
    require(
        not any(item.is_symlink() for item in [path, *path.parents] if item != root.parent),
        f"symlink path: {relative}",
    )
    require(path.resolve().is_relative_to(root.resolve()), f"path escapes root: {relative}")
    return path


def inventory(root: Path) -> dict[str, Path]:
    found: dict[str, Path] = {}
    for path in root.rglob("*"):
        relative = path.relative_to(root).as_posix()
        require(not path.is_symlink(), f"symlink entry: {relative}")
        if path.is_file():
            local_path(root, relative)
            found[relative] = path
    require(
        len({name.casefold() for name in found}) == len(found),
        "case-colliding files",
    )
    return found


def read_json(root: Path, relative: str) -> dict:
    try:
        value = json.loads(local_path(root, relative).read_text(encoding="utf-8"))
    except (OSError, UnicodeError, ValueError) as exc:
        raise InvalidPack(f"cannot read {relative}: {exc}") from exc
    require(isinstance(value, dict), f"expected JSON object: {relative}")
    return value


def read_checksums(root: Path) -> dict[str, str]:
    try:
        lines = (root / "CHECKSUMS.sha256").read_text(encoding="utf-8").splitlines()
    except (OSError, UnicodeError) as exc:
        raise InvalidPack(f"cannot read checksum inventory: {exc}") from exc
    require(lines, "empty checksum inventory")
    checksums: dict[str, str] = {}
    for line in lines:
        match = re.fullmatch(r"([a-f0-9]{64})  (.+)", line)
        require(match is not None, "malformed checksum entry")
        value, relative = match.groups()
        local_path(root, relative)
        require(
            relative not in checksums and relative != "CHECKSUMS.sha256",
            f"duplicate or self-checksum: {relative}",
        )
        checksums[relative] = value
    return checksums


def check_text(relative: str, data: bytes) -> str:
    require(not data.startswith(b"\xef\xbb\xbf"), f"UTF-8 BOM: {relative}")
    require(b"\r" not in data, f"CR or CRLF line endings: {relative}")
    require(b"\x00" not in data, f"binary NUL byte: {relative}")
    require(not data or data.endswith(b"\n"), f"missing final newline: {relative}")
    try:
        text = data.decode("utf-8")
    except UnicodeError as exc:
        raise InvalidPack(f"non-UTF-8 text: {relative}") from exc
    require(not re.search(r"(?m)[ \t]+$", text), f"trailing whitespace: {relative}")
    require(
        not re.search(r"(?i)\b(?:TO" + "DO|T" + "BD|FIX" + "ME|X" + "XX)\b", text),
        f"placeholder marker: {relative}",
    )
    return text


def check_links(document: Path, boundary: Path) -> None:
    text = document.read_text(encoding="utf-8")
    targets = re.findall(r"\]\(([^)]+)\)", text)
    targets += re.findall(r"^\[[^\]]+\]:\s+(\S+)", text, re.M)
    for target in targets:
        if target.startswith("#"):
            continue
        parsed = urlparse(target)
        if parsed.scheme:
            require(parsed.scheme == "https", f"non-HTTPS external link in {document.name}: {target}")
            continue
        path_part = target.split("#", 1)[0]
        require(path_part, f"empty local link in {document.name}")
        path = (document.parent / path_part).resolve()
        require(
            path.is_relative_to(boundary.resolve()),
            f"local link escapes pack in {document.name}: {target}",
        )
        require(path.is_file(), f"missing local link in {document.name}: {target}")


def validate(root: Path) -> dict:
    root = root.resolve()
    require(root.is_dir(), "pack directory does not exist")
    files = inventory(root)
    require(set(files) == EXPECTED_FILES, "exact pack inventory mismatch")
    require(not any("/references/" in name for name in files), "publisher reference directory included")
    require(
        not any(Path(name).suffix.lower() in {".pdf", ".zip", ".html", ".htm", ".docx", ".xlsx", ".pptx"} for name in files),
        "bundled publisher or binary file included",
    )

    texts: dict[str, str] = {}
    for relative, path in files.items():
        texts[relative] = check_text(relative, path.read_bytes())

    checksums = read_checksums(root)
    require(set(files) - {"CHECKSUMS.sha256"} == set(checksums), "checksum inventory mismatch")
    for relative, value in checksums.items():
        require(digest(files[relative].read_bytes()) == value, f"checksum mismatch: {relative}")

    manifest = read_json(root, "SOURCE-MANIFEST.json")
    require(manifest.get("status") == "public_review_prototype", "wrong distribution scope")
    require(manifest.get("pack") == "controlled-execution", "wrong pack identity")
    require(manifest.get("source_snapshot") == "2026-09-19", "source snapshot drift")
    require(manifest.get("publisher_files_bundled") == 0, "publisher files declared")
    require(manifest.get("existing_files_modified") == 0, "existing-file scope changed")
    require(manifest.get("canonical_skill_tree_changed") is False, "canonical skill scope changed")
    require(manifest.get("release_profiles_changed") is False, "release profile scope changed")
    require(manifest.get("release_identity_changed") is False, "release identity scope changed")
    records = manifest.get("skills")
    require(isinstance(records, list), "manifest skill records missing")
    names = [entry.get("name") for entry in records if isinstance(entry, dict)]
    require(tuple(names) == EXPECTED_SKILLS and len(set(names)) == 13, "manifest skill inventory mismatch")
    by_name = {entry["name"]: entry for entry in records}

    for name in EXPECTED_SKILLS:
        skill_relative = f"skills/{name}/SKILL.md"
        source_relative = f"skills/{name}/SOURCES.md"
        skill_text = texts[skill_relative]
        source_text = texts[source_relative]
        match = re.match(
            r'\A---\nname: ([a-z0-9-]+)\ndescription: "([^"\n]+)"\n---\n',
            skill_text,
        )
        require(match is not None and match[1] == name, f"frontmatter mismatch: {name}")
        entry = by_name[name]
        require(match[2] == entry.get("description") and len(match[2]) <= 60, f"description mismatch: {name}")
        lines = skill_text.splitlines()
        require(len(lines) < 100 and len(lines) == entry.get("skill_lines"), f"line budget or count mismatch: {name}")
        require(len(source_text.splitlines()) == entry.get("sources_lines"), f"source-note line count mismatch: {name}")
        require("[SOURCES.md](SOURCES.md)" in skill_text, f"source link missing: {name}")
        require("## Official source access" in source_text, f"official source section missing: {name}")
        require("## Adaptation boundary" in source_text, f"adaptation boundary missing: {name}")
        require("No publisher file is bundled" in source_text, f"publisher-file declaration missing: {name}")
        require(entry.get("bundled_files") == [], f"bundled files declared: {name}")
        require(entry.get("formal_conformance_claimed") is False, f"formal claim set: {name}")
        require(entry.get("behavioural_evaluation") == "not_run", f"behavioural evidence overclaim: {name}")
        urls = entry.get("source_urls")
        require(isinstance(urls, list) and urls, f"source URLs missing: {name}")
        require(all(isinstance(url, str) and url.startswith("https://") for url in urls), f"invalid source URL: {name}")
        require(all(url in source_text for url in urls), f"source URL not documented: {name}")
        require(digest(files[skill_relative].read_bytes()) == SKILL_SHA256[name], f"authored skill baseline drift: {name}")
        require(digest(files[source_relative].read_bytes()) == SOURCE_NOTE_SHA256[name], f"source-note baseline drift: {name}")
        require(entry.get("skill_sha256") == SKILL_SHA256[name], f"manifest skill digest drift: {name}")
        require(entry.get("sources_sha256") == SOURCE_NOTE_SHA256[name], f"manifest source digest drift: {name}")

    require("standard-owasp-asvs" not in names and "standard-nist-ssdf" not in names, "broad PR #17 identity duplicated")

    control = texts["CONTROL-MODEL.md"]
    for field in CONTROL_FIELDS:
        require(f"### {field}" in control, f"control-model field missing: {field}")
    for heading in (
        "### 1. PREVENT THE ERROR",
        "### 2. DETECT AND CONTAIN THE ERROR",
        "### 3. EXPLAIN THE ERROR",
    ):
        require(heading in control, f"control hierarchy missing: {heading}")

    cases = read_json(root, "audit/acceptance-cases.json")
    require(cases.get("status") == "authored_not_executed" and cases.get("model_calls") == 0, "cases mislabelled as model results")
    case_rows = cases.get("cases")
    require(isinstance(case_rows, list) and len(case_rows) == 39, "acceptance case count mismatch")
    ids = [case.get("id") for case in case_rows if isinstance(case, dict)]
    require(len(ids) == 39 and len(set(ids)) == 39, "acceptance case IDs not unique")
    counts = Counter(case.get("skill") for case in case_rows if isinstance(case, dict))
    require(counts == Counter({name: 3 for name in EXPECTED_SKILLS}), "acceptance case skill coverage mismatch")
    categories = {
        name: {case.get("category") for case in case_rows if case.get("skill") == name}
        for name in EXPECTED_SKILLS
    }
    require(all(value == {"apply", "boundary", "failure"} for value in categories.values()), "acceptance category coverage mismatch")
    require(
        all(
            all(isinstance(case.get(field), str) and case.get(field) for field in ("id", "skill", "category", "prompt", "expected", "disallowed"))
            for case in case_rows
        ),
        "acceptance case field missing",
    )

    contract = read_json(root, "VALIDATION.json")
    require(
        contract.get("status") == "declared_contract_not_execution_evidence"
        and contract.get("skills_expected") == 13
        and contract.get("authored_cases") == 39
        and contract.get("model_calls") == 0
        and contract.get("live_model_evaluation") == "not_run"
        and contract.get("formal_conformance_claimed") is False
        and contract.get("publisher_files_bundled") == 0
        and contract.get("release_integration") is False
        and contract.get("local_installation") is False
        and contract.get("merge_authorised_by_this_contract") is False,
        "validation declaration overclaims",
    )

    require(texts["LICENSE"].startswith("MIT License\n"), "pack licence missing or malformed")
    require("contains no copied publisher" in texts["THIRD-PARTY-NOTICES.md"], "third-party boundary missing")
    for relative, value in CORE_SHA256.items():
        require(digest(files[relative].read_bytes()) == value, f"immutable core baseline drift: {relative}")
    for relative, path in files.items():
        if relative.endswith(".md"):
            check_links(path, root)

    return {
        "skills": 13,
        "authored_cases": 39,
        "publisher_files": 0,
        "files": len(files),
        "scope": "structural, source and packaging integrity only; no live-model evaluation",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", nargs="?", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    try:
        result = validate(args.root)
    except (InvalidPack, OSError, UnicodeError, KeyError, TypeError) as exc:
        print(f"FAIL: {exc}")
        return 1
    print("PASS: " + json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
