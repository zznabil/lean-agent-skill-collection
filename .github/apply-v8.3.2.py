#!/usr/bin/env python3
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

ROOT = Path.cwd()
OLD = "8.3.1"
NEW = "8.3.2"
TAG = f"v{NEW}"


def read(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")


def write(path: str, content: str) -> None:
    target = ROOT / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(content.rstrip("\n") + "\n", encoding="utf-8", newline="\n")


def replace_once(text: str, old: str, new: str, label: str) -> str:
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected one match, found {count}")
    return text.replace(old, new, 1)


def load_json(path: str) -> dict:
    return json.loads(read(path))


def dump_json(path: str, value: dict) -> None:
    write(path, json.dumps(value, indent=2, ensure_ascii=False))


communication_skills = ["teach", "wait-what", "writing"]
get_it_done_skills = ["gauntlet-loop", "get-it-done", "teach", "wait-what", "writing"]
gauntlet_skills = ["gauntlet-loop", "teach", "wait-what", "writing"]

# Canonical release profile definition.
profiles = load_json("release-profiles.json")
profiles["version"] = NEW
profiles["release"] = TAG
profiles["release_title"] = "Communication-Complete Task Packs"
profiles["release_summary"] = (
    "V8.3.2 keeps all 23 canonical skills and embeds the complete Communication profile "
    "into both the Get It Done and Gauntlet packs so their user-facing, teaching, writing, "
    "and human-usable-information behaviour is available without a second installation."
)
profiles["profiles"]["get-it-done"]["description"] = (
    "Five compact skills for long-horizon execution, adversarial acceptance, adaptive "
    "communication, teaching, writing, and human-usable information."
)
profiles["profiles"]["get-it-done"]["skills"] = get_it_done_skills
profiles["profiles"]["gauntlet"]["description"] = (
    "Four compact skills for adversarial quality review plus adaptive communication, "
    "teaching, writing, and human-usable information."
)
profiles["profiles"]["gauntlet"]["skills"] = gauntlet_skills
if profiles["profiles"]["communication"]["skills"] != communication_skills:
    raise SystemExit("Communication profile no longer has its expected three-skill contract")
dump_json("release-profiles.json", profiles)

# Root plugin and package metadata.
plugin = load_json(".codex-plugin/plugin.json")
plugin["version"] = NEW
dump_json(".codex-plugin/plugin.json", plugin)

package = load_json("PACKAGE-VALIDATION.json")
package["version"] = NEW
package["profile_composition"] = {
    "communication_skills": communication_skills,
    "get_it_done_skills": get_it_done_skills,
    "gauntlet_skills": gauntlet_skills,
    "communication_embedded_in_get_it_done": True,
    "communication_embedded_in_gauntlet": True,
}
dump_json("PACKAGE-VALIDATION.json", package)

citation = read("CITATION.cff")
citation = replace_once(citation, f"version: {OLD}", f"version: {NEW}", "citation version")
write("CITATION.cff", citation)

# README.
readme = read("README.md")
readme = replace_once(readme, "version-v8.3.1-2563eb", "version-v8.3.2-2563eb", "README badge")
old_summary = (
    "V8.3.1 keeps all V8.3.0 skill behaviour and adds repository-integrity hardening: "
    "cross-file version checks, evaluation-mirror checks, text hygiene, temporary-scaffold "
    "detection, and repository auditing on both supported PowerShell hosts. The V8.3 "
    "human-usable-information layer remains unchanged. Read the [project history](docs/HISTORY.md), "
    "[standards register](docs/STANDARDS-REGISTER.md), and [repository audit](docs/REPOSITORY-AUDIT.md)."
)
new_summary = (
    "V8.3.2 keeps the V8.3 skill behaviour and V8.3.1 repository hardening. It also embeds "
    "the complete Communication profile (`teach`, `wait-what`, and `writing`) into both the "
    "Get It Done and Gauntlet packs. These packs now carry adaptive prose, teaching, writing, "
    "and human-usable-information support without a second installation. Read the "
    "[project history](docs/HISTORY.md), [standards register](docs/STANDARDS-REGISTER.md), and "
    "[repository audit](docs/REPOSITORY-AUDIT.md)."
)
readme = replace_once(readme, old_summary, new_summary, "README summary")
readme = readme.replace("-openai-v8.3.1.zip", "-openai-v8.3.2.zip")
readme = readme.replace("./artifacts/v8.3.1", "./artifacts/v8.3.2")
readme = replace_once(
    readme,
    "| Get It Done | 3 | Long-horizon execution and acceptance | `get-it-done-pack-openai-v8.3.2.zip` |",
    "| Get It Done | 5 | Long-horizon execution, acceptance, and complete communication support | `get-it-done-pack-openai-v8.3.2.zip` |",
    "README Get It Done row",
)
readme = replace_once(
    readme,
    "| Gauntlet Loop | 1 | High-risk adversarial quality review | `gauntlet-loop-pack-openai-v8.3.2.zip` |",
    "| Gauntlet Loop | 4 | High-risk adversarial review with complete communication support | `gauntlet-loop-pack-openai-v8.3.2.zip` |",
    "README Gauntlet row",
)
readme = replace_once(
    readme,
    "Browse the [skill catalog](docs/SKILL-CATALOG.md) before choosing a profile.",
    "The Get It Done and Gauntlet packs each include the full Communication trio. `wait-what` is included once through set union, not duplicated.\n\nBrowse the [skill catalog](docs/SKILL-CATALOG.md) before choosing a profile.",
    "README profile note",
)
readme = replace_once(
    readme,
    "The source on `main` is canonical for V8.3.1.",
    "The source on `main` is canonical for V8.3.2.",
    "README release integrity version",
)
write("README.md", readme)

# Changelog.
changelog = read("CHANGELOG.md")
entry = """## 8.3.2 — 2026-08-30

- Keep all 23 canonical skills, all six profile names, and all skill instructions unchanged.
- Merge the full Communication profile (`teach`, `wait-what`, and `writing`) into the Get It Done pack by set union, expanding it from 3 to 5 skills.
- Merge the full Communication profile into the Gauntlet pack, expanding it from 1 to 4 skills.
- Keep the standalone Communication profile available.
- Add an explicit profile-composition contract and CI audit so either task pack cannot silently lose communication coverage.
- Preserve V8.3.1 and all earlier tags and releases unchanged; publish V8.3.2 as a separate release.

"""
changelog = replace_once(changelog, "# Changelog\n\n", "# Changelog\n\n" + entry, "changelog insertion")
write("CHANGELOG.md", changelog)

# Skill catalog profile membership.
catalog = read("docs/SKILL-CATALOG.md")
catalog = replace_once(catalog, "# Lean Agent Skills V8.3.1 catalog", "# Lean Agent Skills V8.3.2 catalog", "catalog heading")
catalog = replace_once(
    catalog,
    "V8.3.1 keeps the same 23 canonical skills, profiles, and invocation policy as V8.3.0. The patch adds repository-integrity checks; human-usable information remains a conditional layer inside the existing communication, teaching, interface, planning, review, and document authorities.",
    "V8.3.2 keeps the same 23 canonical skills and invocation policy. The standalone Communication profile remains available, and its three skills are also included in the Get It Done and Gauntlet packs.",
    "catalog summary",
)
catalog = replace_once(catalog, "| `teach` | complete, communication | implicit |", "| `teach` | complete, communication, get-it-done, gauntlet | implicit |", "teach profile membership")
catalog = replace_once(catalog, "| `wait-what` | core, engineering, complete, communication, get-it-done | manual |", "| `wait-what` | core, engineering, complete, communication, get-it-done, gauntlet | manual |", "wait-what profile membership")
catalog = replace_once(catalog, "| `writing` | complete, communication | implicit |", "| `writing` | complete, communication, get-it-done, gauntlet | implicit |", "writing profile membership")
write("docs/SKILL-CATALOG.md", catalog)

# Release audit.
audit = read("docs/AUDIT.md")
audit = replace_once(audit, "# Lean Agent Skills V8.3.1 — release audit", "# Lean Agent Skills V8.3.2 — release audit", "audit heading")
audit = replace_once(
    audit,
    "V8.3.1 keeps all V8.3.0 skill content: 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. It adds repository-integrity hardening and no routed skill, dependency, service, runtime hook, executable skill payload, or automatic trusted-state mutation.",
    "V8.3.2 keeps all V8.3 skill content: 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. It changes only two profile inventories: Get It Done now contains 5 skills, and Gauntlet now contains 4. No routed skill, dependency, service, runtime hook, executable skill payload, or automatic trusted-state mutation is added.",
    "audit introduction",
)
profile_section = """## V8.3.2 communication-complete task packs

The canonical Communication profile remains:

```text
teach
wait-what
writing
```

The task-pack unions are:

```text
Get It Done (5)
= gauntlet-loop + get-it-done + teach + wait-what + writing

Gauntlet (4)
= gauntlet-loop + teach + wait-what + writing
```

The profile audit verifies both unions against the canonical Communication profile. Duplicate skill names are not allowed.

"""
audit = replace_once(audit, "## Candidate synthesis\n", profile_section + "## Candidate synthesis\n", "audit profile section")
audit = replace_once(audit, "Publish V8.3.1 only from the exact merged commit", "Publish V8.3.2 only from the exact merged commit", "audit release recommendation")
write("docs/AUDIT.md", audit)

repo_audit = read("docs/REPOSITORY-AUDIT.md")
repo_audit = replace_once(repo_audit, "# Repository integrity audit — V8.3.1", "# Repository integrity audit — V8.3.2", "repository audit heading")
profile_audit_section = """## Profile composition

- The standalone Communication profile contains `teach`, `wait-what`, and `writing`.
- The Get It Done profile contains the full Communication profile plus `get-it-done` and `gauntlet-loop`.
- The Gauntlet profile contains the full Communication profile plus `gauntlet-loop`.
- CI compares these unions against the canonical profile lists and rejects missing or duplicate entries.

"""
repo_audit = replace_once(repo_audit, "## Release gate\n", profile_audit_section + "## Release gate\n", "repository audit profile section")
repo_audit = replace_once(repo_audit, "V8.3.1 must be tagged", "V8.3.2 must be tagged", "repository audit release gate")
write("docs/REPOSITORY-AUDIT.md", repo_audit)

# Release notes.
release_notes = """# Lean Agent Skill Collection V8.3.2 — Communication-Complete Task Packs

V8.3.2 keeps all 23 canonical skills and all skill instructions unchanged. It changes package composition only.

## What changed

The standalone Communication profile remains:

```text
teach
wait-what
writing
```

The Get It Done pack now contains five skills:

```text
gauntlet-loop
get-it-done
teach
wait-what
writing
```

The Gauntlet pack now contains four skills:

```text
gauntlet-loop
teach
wait-what
writing
```

This means both task packs carry adaptive prose, teaching, writing, cognitive-accessibility, and human-usable-information support without requiring a second overlapping profile installation.

## Compatibility

- Same 23 canonical skills.
- Same six profile names.
- Same manual and implicit invocation policy for every skill.
- The Get It Done package grows from 3 to 5 skills.
- The Gauntlet package grows from 1 to 4 skills.
- The standalone Communication package remains available.
- No dependency, service, runtime hook, installer, executable skill payload, or automatic trusted-state mutation is added.

## Validation

- Profile unions are checked against the canonical Communication profile.
- Duplicate skill names are rejected.
- Deterministic double builds, validator rejection controls, source validation, repository auditing, PowerShell 7 CI, and Windows PowerShell 5.1 CI must pass.
- The annotated tag and published assets must be read back after release.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT routing behaviour, user comprehension, accessibility conformance, usability conformance, security certification, or formal standards conformance.
"""
write("releases/v8.3.2/RELEASE-NOTES-v8.3.2.md", release_notes)

# Enforce the profile union in the repository audit.
audit_script = read("scripts/audit-repository.ps1")
anchor = "if ((Compare-Object $actualSkills $completeSkills).Count -ne 0) { Add-Failure 'Complete profile does not match the canonical skills directory' }\n"
insert = r'''if ((Compare-Object $actualSkills $completeSkills).Count -ne 0) { Add-Failure 'Complete profile does not match the canonical skills directory' }

$communicationSkills = @($profiles.profiles.communication.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
$getItDoneSkills = @($profiles.profiles.'get-it-done'.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
$gauntletSkills = @($profiles.profiles.gauntlet.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
if ($communicationSkills.Count -ne 3) { Add-Failure "Communication profile must contain 3 unique skills; found $($communicationSkills.Count)" }
if ($getItDoneSkills.Count -ne 5) { Add-Failure "Get It Done profile must contain 5 unique skills; found $($getItDoneSkills.Count)" }
if ($gauntletSkills.Count -ne 4) { Add-Failure "Gauntlet profile must contain 4 unique skills; found $($gauntletSkills.Count)" }
foreach ($skill in $communicationSkills) {
    if (-not ($getItDoneSkills -contains $skill)) { Add-Failure "Get It Done profile lacks Communication skill: $skill" }
    if (-not ($gauntletSkills -contains $skill)) { Add-Failure "Gauntlet profile lacks Communication skill: $skill" }
}
if (-not ($getItDoneSkills -contains 'get-it-done') -or -not ($getItDoneSkills -contains 'gauntlet-loop')) { Add-Failure 'Get It Done profile lacks a required task controller' }
if (-not ($gauntletSkills -contains 'gauntlet-loop')) { Add-Failure 'Gauntlet profile lacks gauntlet-loop' }
$composition = $package.profile_composition
if ($null -eq $composition -or -not $composition.communication_embedded_in_get_it_done -or -not $composition.communication_embedded_in_gauntlet) {
    Add-Failure 'PACKAGE-VALIDATION.json lacks the communication-complete task-pack contract'
} else {
    $metadataCommunication = @($composition.communication_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    $metadataGetItDone = @($composition.get_it_done_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    $metadataGauntlet = @($composition.gauntlet_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    if ((Compare-Object $communicationSkills $metadataCommunication).Count -ne 0) { Add-Failure 'Communication profile metadata differs from release-profiles.json' }
    if ((Compare-Object $getItDoneSkills $metadataGetItDone).Count -ne 0) { Add-Failure 'Get It Done profile metadata differs from release-profiles.json' }
    if ((Compare-Object $gauntletSkills $metadataGauntlet).Count -ne 0) { Add-Failure 'Gauntlet profile metadata differs from release-profiles.json' }
}
'''
audit_script = replace_once(audit_script, anchor, insert, "repository audit profile checks")
write("scripts/audit-repository.ps1", audit_script)

# Refresh every source hash already governed by the canonical manifest.
manifest_path = ROOT / "UPSTREAM-CHECKSUMS.sha256"
lines: list[str] = []
for raw in manifest_path.read_text(encoding="utf-8").splitlines():
    match = re.fullmatch(r"([0-9a-fA-F]{64})\s+(.+)", raw)
    if not match:
        raise SystemExit(f"Malformed checksum line: {raw}")
    relative = match.group(2)
    target = ROOT / relative
    if not target.is_file():
        raise SystemExit(f"Checksum target is missing: {relative}")
    digest = hashlib.sha256(target.read_bytes()).hexdigest()
    lines.append(f"{digest}  {relative}")
write("UPSTREAM-CHECKSUMS.sha256", "\n".join(lines))

print("Applied V8.3.2 communication-complete task-pack update.")
