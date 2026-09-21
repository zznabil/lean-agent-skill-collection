# Controlled-execution mechanism skills

This optional review pack adds 13 narrow skills for instructions that must produce controlled, observable and demonstrable execution.

The pack complements the existing Lean communication and task skills. It does not change the canonical `skills/` directory, release profiles, version, installation or runtime. It is not a release input unless a later authorised change makes it one.

## Core model

Understanding is necessary but not sufficient for risky execution. Prefer controls in this order:

1. Prevent the error through restricted capability, redesign or an interlock.
2. Detect and contain the error through verification, a hold point, a stop condition and recovery.
3. Explain the error through a requirement, prohibition, warning, rationale or example.

Read [CONTROL-MODEL.md](CONTROL-MODEL.md) for the shared record. It is a reference model, not a fourteenth routed skill.

## Contents

- [CATALOG.md](CATALOG.md): exact 13-skill inventory and selection boundary.
- `skills/<name>/SKILL.md`: bounded application procedure.
- `skills/<name>/SOURCES.md`: official access, version decision, rights and adaptation limits.
- [SOURCE-MANIFEST.json](SOURCE-MANIFEST.json): machine-readable source and skill inventory.
- [VALIDATION.json](VALIDATION.json): declared evidence scope and explicit limits.
- `audit/`: structural validator, rejection controls, authored cases and deterministic review-ZIP builder.

## Selection

Select one mechanism because the task needs it. Do not load every skill for every instruction.

Typical combinations are:
- normative precision plus verifiable requirements;
- use-error controls plus state verification;
- a safe technical procedure plus a transition checklist;
- a UI rendering profile after the technical procedure is correct.

The broader OWASP ASVS and NIST SSDF routines remain in the separate remaining-standards pack. This pack extracts narrower traceability mechanisms under different identifiers.

## Integrity boundary

`SOURCE-BASELINE.sha256` records the expected bytes for every pack file except `CHECKSUMS.sha256`, `SOURCE-BASELINE.sha256` and `audit/validate_pack.py`. Refreshing `CHECKSUMS.sha256` cannot silently author a changed skill, catalog, rights record, builder, test or added root/audit file.

This extracted pack is not self-authenticating: `audit/validate_pack.py` still requires an external/root trust pin. V8.9 root validation pins this pack’s `CHECKSUMS.sha256` through `UPSTREAM-CHECKSUMS.sha256`. The pack remains optional review-only material and does not claim installation, formal conformity or live-model evidence.

## Evidence limits

The checks verify source structure, immutable authored baselines, links, inventories, text format, rejection controls and deterministic packaging. The authored cases are not live-model evaluations. No formal conformity, task-success gain, comprehension rate or local installation is claimed.
