#!/usr/bin/env python3
"""Check current catalogs and the dated re-audit ledger; never change source files."""
import argparse
from collections import Counter
from copy import deepcopy
import json
from pathlib import Path
import re
import sys

CATALOG = "docs/SKILL-CATALOG.md"
REGISTER = "docs/STANDARDS-REGISTER.md"
HISTORY = "docs/HISTORY.md"
CONTROLLED = "packs/controlled-execution/CATALOG.md"
LEDGER = "docs/UPSTREAM-PROVENANCE-2026-10-11.json"
BASELINE = "89a96c163521e6ead8898c40d8b85eebe25716ad"
PROFILE_COUNTS = {"core": 9, "engineering": 20, "complete": 24,
                  "communication": 3, "get-it-done": 6, "gauntlet": 4}
BASIS_COUNTS = {"EXACT_PIN": 14, "BASELINE_UNKNOWN": 20,
                "PAPER_OR_RECONSTRUCTED_CUTOFF; REVIEWED_PIN_UNKNOWN": 11}
SHA = re.compile(r"[0-9a-f]{40}\Z")
DRIVERS = ("ASD-STE100", "ISO 704", "Diátaxis")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def marked(text, name):
    start, end = f"<!-- {name}:start -->", f"<!-- {name}:end -->"
    require(text.count(start) == text.count(end) == 1, f"{name}: markers missing or repeated")
    require(text.index(start) < text.index(end), f"{name}: markers out of order")
    return text.split(start, 1)[1].split(end, 1)[0]


def validate(root, overrides=None):
    """Overrides are in-memory file replacements used only by calibration tests."""
    overrides = overrides or {}

    def read(path):
        return overrides[path] if path in overrides else (root / path).read_text(encoding="utf-8")

    profiles = json.loads(read("release-profiles.json"))
    canonical = {p.parent.name for p in (root / "skills").glob("*/SKILL.md")}
    require(len(canonical) == 24, "canonical base count must remain 24")
    require(set(profiles["profiles"]) == set(PROFILE_COUNTS), "profile names changed")
    for name, definition in profiles["profiles"].items():
        members = definition["skills"]
        require(len(members) == len(set(members)) == PROFILE_COUNTS[name], f"{name}: base count changed")
        require(set(members) <= canonical, f"{name}: noncanonical profile member")
    require(set(profiles["profiles"]["complete"]["skills"]) == canonical, "complete profile membership differs")
    supplemental = profiles["user_facing_standards"]
    require(supplemental["skills_expected"] == 27, "supplemental count must remain 27")
    require(set(supplemental["included_profiles"]) == set(PROFILE_COUNTS), "supplemental profile membership changed")
    for relative, expected in (("packs/user-facing-standards/skills", 27),
                               ("packs/remaining-standards/skills", 63),
                               ("packs/remaining-standards/gated-skills", 7),
                               ("packs/controlled-execution/skills", 13)):
        require(len(list((root / relative).glob("*/SKILL.md"))) == expected, f"{relative}: source count changed")

    catalog = read(CATALOG)
    require(catalog.splitlines()[0] == "# Lean Agent Skills catalog", "catalog heading must be current and unversioned")
    rows = re.findall(r"^\| `([^`]+)` \| ([^|]+) \| ([^|]+) \|", catalog, re.M)
    names = [row[0] for row in rows]
    require(len(names) == len(set(names)) and set(names) == canonical,
            "base catalog must map each canonical route exactly once")
    for name, roles, invocation in rows:
        actual_roles = [role.strip() for role in roles.split(",")]
        expected_roles = {p for p, d in profiles["profiles"].items() if name in d["skills"]}
        require(len(actual_roles) == len(set(actual_roles)) and set(actual_roles) == expected_roles,
                f"{name}: catalog profile membership differs")
        adapter = read(f"skills/{name}/agents/openai.yaml")
        flags = re.findall(r"^\s*allow_implicit_invocation:\s*(true|false)\s*$", adapter, re.M)
        require(len(flags) == 1, f"{name}: missing or ambiguous adapter invocation")
        expected_invocation = "explicit request" if name == "quick-mode" else ("implicit" if flags[0] == "true" else "manual")
        require(invocation.strip() == expected_invocation, f"{name}: catalog invocation differs")
        if name == "quick-mode":
            require(flags[0] == "true", "quick-mode: preserve implicit-capable adapter with explicit-request rule")

    root_kernel = marked(read("AGENTS.md"), "communication-kernel")
    current = marked(read(REGISTER), "current-communication-drivers")
    for name, block in (("root", root_kernel), ("register", current)):
        driver_rows = re.findall(r"^- \*\*([^\n]+)", block, re.M)
        require(len(driver_rows) == 3 and all(driver in row for driver, row in zip(DRIVERS, driver_rows)),
                f"{name}: current communication drivers must be ASD-STE100, ISO 704 and Diátaxis")
        require("CDC" not in block, f"{name}: stale CDC default-driver assertion")
    register = read(REGISTER)
    require(register.splitlines()[0] == "# Standards register", "register heading must be current and unversioned")
    require("## Historical V8.13 lean-kernel adoption (superseded)" in register,
            "V8.13 default-driver policy must remain explicitly historical and superseded")
    cdc_rows = [line for line in register.splitlines() if line.startswith("| CDC Clear Communication Index |")]
    require(len(cdc_rows) == 1 and "no default-driver role" in cdc_rows[0], "CDC register row must remain task-selected")
    current_register = re.sub(r"^## Historical V8\.13 lean-kernel adoption \(superseded\).*?(?=^## |\Z)", "", register, flags=re.M | re.S)
    current_register = current_register.replace(cdc_rows[0], "").replace(
        "CDC CCI remains a public-communication diagnostic; it is not part of the default kernel.", "")
    require("CDC" not in current_register, "register: unscoped current CDC assertion outside historical snapshot")
    require("## Current state:" not in read(HISTORY) and "## Current release note" not in read(HISTORY),
            "history contains a stale current-state heading")
    require("open PR #17" not in read(CONTROLLED), "controlled catalog still calls PR #17 open")
    for skill in ("standard-owasp-asvs", "standard-nist-ssdf"):
        relative = f"packs/remaining-standards/skills/{skill}/SKILL.md"
        target = f"https://github.com/zznabil/lean-agent-skill-collection/blob/{BASELINE}/{relative}"
        require(target in read(CONTROLLED) and (root / relative).is_file(),
                f"controlled catalog lacks merged routine link: {skill}")

    ledger = json.loads(read(LEDGER))
    require(ledger["schema_version"] == 1 and ledger["audit_date"] == "2026-10-11" and ledger["lean_baseline"] == BASELINE,
            "dated provenance ledger identity changed")
    sources, support = ledger["sources"], ledger["supporting_repositories"]
    require(len(sources) == 45 and len(support) == 2, "provenance source count changed")
    require(ledger["counts"] == {"primary_sources": 45, "primary_repositories": 43, "paper_only": 2,
                                 "supporting_repositories": 2, "by_comparison_basis": BASIS_COUNTS},
            "provenance summary counts differ")
    require({r["id"] for r in sources} == {f"S{i:02}" for i in range(1, 46)}, "primary source IDs missing or duplicated")
    urls = [r["url"] for r in sources] + [r["repository"] for r in support]
    require(len(urls) == len(set(urls)), "source identities must not be double-counted")
    require(Counter(r["comparison_basis"] for r in sources) == BASIS_COUNTS, "historical comparison counts changed")
    require(Counter(r["kind"] for r in sources) == {"repository": 43, "paper": 2}, "source kinds changed")
    for row in sources:
        label = row["id"]
        history, current_review = row["historical_review"], row["current_review"]
        revision = current_review["revision"]
        valid_revision = bool(SHA.fullmatch(revision)) if row["kind"] == "repository" else bool(re.fullmatch(r"arXiv:\d{4}\.\d{4,5}v\d+", revision))
        require(valid_revision and current_review["date"] == "2026-10-11", f"{label}: invalid reviewed revision/date")
        require(revision.removeprefix("arXiv:") in current_review["url"], f"{label}: revision URL differs")
        if row["comparison_basis"] == "EXACT_PIN":
            require(bool(SHA.fullmatch(history["revision"] or "")), f"{label}: exact historical pin missing")
        else:
            require(history["revision"] is None, f"{label}: unknown historical pin must remain null")
        if row["comparison_basis"] == "BASELINE_UNKNOWN":
            require(row["change_level"] == "UNKNOWN", f"{label}: unknown baseline cannot prove a delta")
        for field in ("component_scope", "rights", "review_trigger", "evidence"):
            require(bool(row.get(field)), f"{label}: {field} missing")
        require(bool(history.get("identity_confidence")), f"{label}: historical identity confidence missing")
        require(all(url.startswith("https://") for url in row["evidence"]), f"{label}: evidence must be public URLs")
    for row in support:
        require(bool(SHA.fullmatch(row["sha"])), "supporting repository pin missing")
    by_id = {row["id"]: row for row in sources}
    require(by_id["S10"]["successor_source_id"] == "S11" and by_id["S08"]["successor_source_id"] == "S09",
            "successor identities must stay separate and explicit")
    require("Apache-2.0" in by_id["S34"]["rights"] and "BSL" in by_id["S34"]["rights"], "Caveman current/historical rights boundary missing")


def self_test(root):
    """Positive real-tree control plus independently mutated, expected-error cases."""
    validate(root)
    read = lambda path: (root / path).read_text(encoding="utf-8")
    catalog, register = read(CATALOG), read(REGISTER)
    cases = [
        ("omitted Quick Mode", {CATALOG: re.sub(r"^\| `quick-mode`.*\n", "", catalog, flags=re.M)}, "base catalog"),
        ("duplicate route", {CATALOG: catalog + next(line for line in catalog.splitlines(True) if line.startswith("| `quick-mode`"))}, "base catalog"),
        ("wrong Quick Mode profiles", {CATALOG: catalog.replace("| `quick-mode` | core, engineering, complete, get-it-done", "| `quick-mode` | complete")}, "profile membership"),
        ("implicit Quick Mode activation", {CATALOG: catalog.replace("| explicit request |", "| implicit |")}, "invocation differs"),
        ("stale CDC default", {REGISTER: register.replace("<!-- current-communication-drivers:end -->", "CDC CCI is a default communication driver.\n<!-- current-communication-drivers:end -->")}, "stale CDC"),
        ("CDC assertion outside driver block", {REGISTER: register.replace("## Rules", "CDC CCI is a default communication driver.\n\n## Rules")}, "unscoped current CDC"),
        ("unsuperseded V8.13", {REGISTER: register.replace("## Historical V8.13 lean-kernel adoption (superseded)", "## V8.13 lean-kernel adoption")}, "explicitly historical"),
        ("stale PR ownership", {CONTROLLED: read(CONTROLLED).replace("merged PR #17", "open PR #17")}, "PR #17 open"),
    ]
    for label, mutate, expected in (("invented historical pin", lambda x: x["sources"][0]["historical_review"].update(revision=x["sources"][0]["current_review"]["revision"]), "unknown historical pin"),
                                    ("floating reviewed head", lambda x: x["sources"][0]["current_review"].update(revision="HEAD"), "invalid reviewed revision"),
                                    ("duplicate source identity", lambda x: x["sources"][1].update(url=x["sources"][0]["url"]), "double-counted")):
        ledger = deepcopy(json.loads(read(LEDGER)))
        mutate(ledger)
        cases.append((label, {LEDGER: json.dumps(ledger)}, expected))
    for label, overrides, expected in cases:
        try:
            validate(root, overrides)
        except ValueError as error:
            require(expected in str(error), f"{label}: rejected for unrelated reason: {error}")
        else:
            raise ValueError(f"negative control accepted: {label}")
    # Historical wording remains legal under its explicit historical heading.
    validate(root, {HISTORY: read(HISTORY) + "\nHistorical test note: V8.13 used CDC in its default kernel.\n"})
    return len(cases)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--self-test", action="store_true", help="also reject representative broken records in memory")
    args = parser.parse_args()
    try:
        validate(args.root)
        controls = self_test(args.root) if args.self_test else 0
    except (ValueError, KeyError, TypeError, OSError) as error:
        print(f"CATALOGUE_PROVENANCE_FAIL: {error}", file=sys.stderr)
        return 1
    print(f"CATALOGUE_PROVENANCE_PASS: 24 routes; 27+63+7+13 pack routines; 45 primary sources; {controls} negative controls")
    return 0


if __name__ == "__main__":
    sys.exit(main())
