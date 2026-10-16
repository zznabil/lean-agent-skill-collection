---
name: practice-versioned-verification-requirements
description: "Track versioned requirements to evidence and result."
---
# Versioned verification requirements

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Purpose and boundary
Use this routine when requirements must remain traceable across reviews, automation and source-version changes. Qualify external identifiers with their source and exact version. A scanner score cannot verify every requirement. This traceability pattern does not provide a complete ASVS assessment.

## Verification record
For each selected requirement, record the source/version, identifier and text reference. Record applicability with its reason, the component and trust boundary, and the verification method. Record the evidence revision and environment, result (`VERIFIED`, `FAILED`, `UNRUN` or `NOT APPLICABLE`), and verifier/date. Record remediation/recheck when needed.

## Steps
1. Freeze the source version before you select requirement identifiers.
2. Map applicable requirements to checks that produce evidence. Justify `NOT APPLICABLE` from the actual architecture. Missing evidence does not justify that result.
3. Run checks at the real trust boundary. Keep authentication, authorisation and data-boundary evidence separate where the requirements distinguish them.
4. Record failures and unrun checks. Do not remove them from the denominator. After remediation, recheck affected requirements and replace stale evidence.
5. When upgrading the source, explicitly map old identifiers to new identifiers. Keep historical results with their original version.

## Worked distinction
`ASVS-5.0.0-Vx.y.z` is linked to an API authorisation test, command, roles, environment and result.

“Security scanner passed” has no requirement-to-evidence mapping and cannot support the same claim.

## Verify and recover
Confirm version-qualified evidence for each claimed result. If the source version, target boundary or verifier is unknown, hold the claim until you resolve the gap. Report the requirement-evidence map and separate result counts. Never convert FAILED or UNRUN to VERIFIED by omission.

For source details and access limits, see [SOURCES.md](SOURCES.md).
