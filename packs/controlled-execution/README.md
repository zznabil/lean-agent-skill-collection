# Controlled-execution mechanism skills

This optional review pack provides 13 narrow skills for instructions whose execution must be controlled and observable. It does not alter canonical skills, release profiles, version, installation or runtime; it is not a release input without later authorisation.

When trusted root `AGENTS.md` is loaded, its communication policy governs the selected skill. A standalone installation uses the self-contained lean kernel fallback in that skill's `SKILL.md`. Neither path proves host activation.

## Choose and apply
1. Identify the task and the failure it could cause. Select only its needed mechanism from [CATALOG.md](CATALOG.md), not the full pack. Combine independent mechanisms only when both apply (for example, use-error controls and state verification).
2. Read the selected `SKILL.md` and its `SOURCES.md` before applying it. Check source status, access rights and the task's actual authority. A source analogy does not transfer a legal or organisational mandate.
3. Prefer prevention (restricted capability, redesign or interlock), then detection and containment (state verification, hold point, stop and recovery), then explanation (requirement, warning or example). [CONTROL-MODEL.md](CONTROL-MODEL.md) gives the shared record; it is not another routed skill.
4. Put warnings before the affected action. Verify state before risky work, pause before irreversible progression, and define expected result, failure sign and recovery when failure is plausible. Report only observed evidence.

The narrower ASVS and SSDF traceability mechanisms do not replace the broader routines in the separate remaining-standards pack. UI rendering profiles follow technical correctness; they do not invent product behavior.

## Review and package
- [SOURCE-MANIFEST.json](SOURCE-MANIFEST.json) records the exact skill/source inventory; [VALIDATION.json](VALIDATION.json) declares what was and was not evaluated. `audit/acceptance-cases.json` contains authored cases, not live-model results.
- Before using a review ZIP, run `python audit/validate_pack.py` and `python audit/test_validate_pack.py` from this directory. Build with `python audit/build_zip.py <output.zip>`, with output outside the pack. A failed validation stops packaging; correct the source or reject the package rather than rehashing an unreviewed edit.
- `SOURCE-BASELINE.sha256` pins every pack file except `CHECKSUMS.sha256`, itself and `audit/validate_pack.py`. `CHECKSUMS.sha256` covers all other pack files. An authorised source revision must refresh the manifest, baseline, validator's baseline pin and checksums together; the validator alone cannot authenticate its own replacement.

This extracted pack is not self-authenticating. Its validator alone cannot prove root integration: check the current root pin for `CHECKSUMS.sha256` and rerun the applicable root checks on the final revision before reporting integration as passed.

## Evidence and rights
Structural checks cover inventories, source baselines, links, text format, rejection controls and deterministic ZIP contents. They do not prove selection, instruction understanding, task success, comprehension, formal conformity or local installation. No publisher file is bundled; follow each `SOURCES.md` and [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) for access and redistribution limits.
