# Lean Agent Skill Collection V8.3.1 — Repository Integrity Hardening

V8.3.1 is a patch release. It keeps all 23 V8.3.0 skills, profiles, invocation rules, adaptive prose, considerate-agency behaviour, and human-usable-information rules unchanged.

## What changed

- Added `scripts/audit-repository.ps1` for cross-file release metadata, version, inventory, evaluation-mirror, scenario-count, text-hygiene, support-reference, temporary-scaffold, and built-asset checks.
- Added that repository audit to both PowerShell 7 and Windows PowerShell 5.1 CI jobs.
- Corrected stale README release wording.
- Regenerated the affected canonical source checksums.
- Preserved the V8.3.0 tag and release unchanged.

## Compatibility

- Same 23 skills.
- Same six profiles.
- Same manual and implicit invocation policy.
- No new dependency, service, runtime hook, installer, executable skill payload, or automatic trusted-state mutation.

## Validation

The release candidate must pass:

- deterministic double builds;
- validator rejection-control tests;
- static source and archive validation;
- repository-integrity validation;
- PowerShell 7 CI;
- Windows PowerShell 5.1 CI;
- post-publication tag, release, asset, and checksum read-back.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT routing behaviour, user comprehension, accessibility conformance, usability conformance, security certification, or formal standards conformance.
