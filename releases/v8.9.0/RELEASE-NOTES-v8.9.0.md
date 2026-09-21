# V8.9.0 — Integrated User-Facing Standards

## Changes

V8.9.0 integrates the canonical 27-skill user-facing standards pack into all six generated release profiles:

- Core: 8 base + 27 supplemental = 35 skills
- Engineering: 19 base + 27 supplemental = 46 skills
- Complete: 23 base + 27 supplemental = 50 skills
- Communication: 3 base + 27 supplemental = 30 skills
- Get It Done: 5 base + 27 supplemental = 32 skills
- Gauntlet Loop: 4 base + 27 supplemental = 31 skills

The 23 base task skills, existing adapters, base profile membership, routing, and historical V8.8.0 preservation material remain unchanged. Supplemental routines add zero adapters. Release metadata, citation, package names, validation examples, checksums, and documentation identify V8.9.0.

## Source, rights, and limitations

The canonical source is `packs/user-facing-standards/`, with its source manifest, rights notices, per-skill `SOURCES.md` files, and pinned publisher-download records. Publisher documents retain their individual rights. No publisher, standards body, or government agency endorsement is claimed. Licensed or unavailable normative texts remain explicit prerequisites; this pack does not recreate them or claim complete formal standards conformance.

`SOURCE-MANIFEST.json` records an `integrated_release_source` for this release and identifies `6e7e141dcb020f8e715a0bda299072836178c1d9` as the pre-release `integration_base_commit`; its scope states that current integrated bytes are represented by this working tree and release checksums, not by that commit. `VALIDATION.json` remains a declared structural contract (`declared_contract_not_execution_evidence`); `live_model_evaluation` is `not_run`. Authored acceptance cases are not executed model tests. These materials therefore make no claim about model routing, comprehension, activation probability, or live-agent performance.

## Install and verify

Choose one generated profile and install it as a skills-only plugin where the host supports that format. Otherwise extract the archive and copy its `skills/` directories into the host’s supported skill directory. Do not install overlapping profiles together.

From the repository root, the release verification procedure is:

```powershell
./scripts/build-release.ps1 -OutputDirectory ./artifacts/v8.9.0
./scripts/test-validator.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/test-prose-preservation.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
```

Run the commands in PowerShell 7 and Windows PowerShell 5.1 when both are available. The checks are static/source-integrity and package checks; they do not install or execute skills and do not substitute for live-model evaluation.

## Release status

These notes describe the V8.9.0 repository release source and its verification contract. They do not claim a published artifact, hosted download, completed CI run, or external distribution. Preserve the pack’s rights notices and verify the exact archive and checksum inventory before redistribution.
