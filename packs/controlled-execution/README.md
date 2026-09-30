# Controlled-execution mechanism skills

This optional review pack provides 13 narrow skills. Use them for instructions that need controlled execution and observable results. The pack does not change canonical skills, release profiles, version, installation or runtime. It is not a release input without later authorisation.

When trusted root `AGENTS.md` is loaded, its communication policy governs the selected skill. Each `SKILL.md` contains a self-contained communication kernel for standalone use. The kernel uses ASD-STE100-inspired short active technical sentences, ISO 704-inspired stable concepts and terms, and Diátaxis purpose separation when useful. Neither loading path proves host activation. Do not claim root activation without evidence.

## Choose and apply
1. Identify the task and the failure it could cause. Select only the mechanism it needs from [CATALOG.md](CATALOG.md). Do not select the full pack. Combine independent mechanisms only when both apply. For example, combine use-error controls and state verification when both apply.
2. Read the selected `SKILL.md` and its `SOURCES.md` before use. Check source status, access rights and the task's actual authority. A source analogy does not transfer a legal or organisational mandate.
3. Prefer prevention first: restrict capability, redesign the workflow or add an interlock. Next, use detection and containment: verify state, set a hold point, stop and recover. Then use explanation: give a requirement, warning or example. Use [CONTROL-MODEL.md](CONTROL-MODEL.md) for the shared record. It is not another routed skill.
4. Put warnings before the affected action. Verify state before risky work. Pause before irreversible progression. When failure is plausible, define the expected result, failure sign and recovery. Report only observed evidence.

The narrower ASVS and SSDF traceability mechanisms do not replace the broader routines in the separate remaining-standards pack. Apply UI rendering profiles after you establish technical correctness. These profiles do not invent product behavior.

## Review and package
- [SOURCE-MANIFEST.json](SOURCE-MANIFEST.json) records the exact skill/source inventory. [VALIDATION.json](VALIDATION.json) states what was evaluated and what was not. `audit/acceptance-cases.json` contains authored cases. It does not contain live-model results.
- Before you use a review ZIP, run `python audit/validate_pack.py` and `python audit/test_validate_pack.py` from this directory. Build with `python audit/build_zip.py <output.zip>`. Put the output outside the pack. Stop packaging if validation fails. Correct the source or reject the package. Do not rehash an unreviewed edit instead.
- `SOURCE-BASELINE.sha256` pins every pack file except `CHECKSUMS.sha256`, itself and `audit/validate_pack.py`. `CHECKSUMS.sha256` covers all other pack files. For an authorised source revision, refresh the manifest, baseline, validator's baseline pin and checksums together. The validator alone cannot authenticate its own replacement.

This extracted pack cannot authenticate itself. Its validator alone cannot prove root integration. Check the current root pin for `CHECKSUMS.sha256`. Rerun the applicable root checks on the final revision before you report that integration passed.

## Evidence and rights
Structural checks cover inventories, source baselines, links, text format, rejection controls and deterministic ZIP contents. They do not prove selection, instruction understanding, task success, comprehension, formal conformity or local installation. This pack bundles no publisher file. Follow each `SOURCES.md` and [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) for access and redistribution limits.
