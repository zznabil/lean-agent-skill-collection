# V8.21.0 — Unified Complete Pack and Hermes Installation

## Changes

- Reconcile the V8.20.0 upstream baseline, local profile consolidation and audited evaluator repairs into one release.
- Generate one Complete profile with all 24 base skills and 27 supplemental routines. Retire the five smaller generated profiles.
- Preserve the optional remaining-standards and controlled-execution packs as separate source-only archives. Preserve their references and licensing limits.
- Separate Hermes skill identity, linked-path validation, payload selection and installation transactions. Keep all four extracted-pack installers standalone.
- Use one PowerShell invocation in each BAT launcher. Prefer PowerShell 7 and retain Windows PowerShell 5.1 fallback.
- Reject linked payload roots before policy reads. Retain complete resources, policy confirmation, persona backups, no-overwrite collisions, destination races and rollback checks.
- Recheck linked paths after confirmation and before transaction writes. Recover policy before payload cleanup so cleanup failure cannot skip persona restoration.
- Execute current anti-pattern candidate source rather than timestamp-valid cached bytecode. Support valid dataclass candidates without accepting policy drift.
- Tighten communication evaluation for recommendation evidence, negated decisions, ordered status labels and exact command tokens without weakening source-loading checks.

## Installation and migration

Download and extract `lean-agent-skills-complete-openai-v8.21.0.zip`. Existing smaller-profile users should use Complete for new installations.

For Hermes, run `install-hermes.bat` from the extracted pack. Review the target and policy before confirming. Use `-WhatIf` for preview.

Use a separate `-HermesHome` when trying this release. Existing pack directories and skill names fail safely rather than being overwritten.

Global policy appends a marked block to `SOUL.md` and backs up existing persona bytes. Project policy never overwrites existing `AGENTS.md`.

Use `-PolicyScope None` for skills only. Read [the Hermes guide](../../docs/HERMES-INTEGRATION.md) for discovery, policy scope and recovery.

Vercel's skills CLI supports Hermes, but its per-skill copy/link contract does not preserve this collection's complete pack-resource and policy transaction.

## Acceptance and evidence limits

Publication requires current both-engine builds, exact inventories, source and archive validation, mutation controls, installer journeys, reproducibility and full-corpus terminology checks.

Require independent review and a fresh non-builder integrated judge. Require current PR and merged-main CI before tagging.

Record executed checks and public-download hashes in the release evidence. Historical audit results alone do not prove this integrated release.

Discovery and fixture checks do not prove universal model obedience or intended-user accessibility. No formal standards conformance is claimed.

## Recovery

Keep the previous release and the installer's persona backup. Stop Hermes before removing a trial installation.

Remove only the printed pack directory and its marked policy block. Restore a persona backup only when no later edits need preservation.

Do not overwrite existing release tags or public assets. Any public correction requires a new reviewed release.
