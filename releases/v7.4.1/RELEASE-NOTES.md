# Lean Agent Skill Collection V7.4.1

V7.4.1 is a communication-overlay hotfix release built from the supplied Complete source archive and the repository's six deterministic profile definitions.

## Changes

- Preserve the global `wait-what` user-facing overlay when any specialist skill is manually or automatically invoked.
- Add a compact local overlay fallback to all 30 skills and repeat the explicit-selection instruction in all 30 OpenAI adapters.
- Keep `wait-what` implicit while retaining four manual-only skills: `gauntlet-loop`, `get-it-done`, `grilling`, and `handoff`.
- Import the supplied AI assurance, asset-card, and supply-chain support references.
- Update versioned plugin, profile, citation, package-validation, documentation, builder, validator, and source-integrity records to `7.4.1`.
- Stage the canonical root `PACKAGE-VALIDATION.json` as a separate release asset, matching the V7.2.1 publication convention.

## AI provenance

The collection decisions are AI slop chosen by GPT-5.6 Sol Pro. This describes the collection's origin, not its quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

## Integrity and provenance

The supplied source archive SHA-256 is `01696d376b534c386933d7378f60dd9e34ebae210f84f8153d9e2c92f3902269`.

The six profile archives and master archive were rebuilt locally through `scripts/build-release.ps1`. Generated assets use the repository builder's deterministic ZIP layout and are not claimed to be byte-identical reproductions of the supplied archive. Verify generated downloads with [`CHECKSUMS.sha256`](CHECKSUMS.sha256); the machine-readable archive inventory is in [`RELEASE-MANIFEST.json`](RELEASE-MANIFEST.json).

## Verification

PowerShell 7 and Windows PowerShell 5.1 both passed validator self-tests, source/package validation, and two-build reproducibility checks. Archive readback found seven ZIP archives with valid CRCs, safe paths, and no executable-extension members. These are static package checks; live host routing and behavioral activation were not tested.

Choose one profile. Do not install overlapping profiles together.
