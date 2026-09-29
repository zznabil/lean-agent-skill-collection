---
name: practice-versioned-verification-requirements
description: "Track versioned requirements to evidence and result."
---
# Versioned verification requirements

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use when requirements must remain traceable across reviews, automation and source-version changes. Qualify external identifiers by source and exact version. A scanner score cannot verify every requirement; this traceability pattern is not a complete ASVS assessment.

## Verification record
For each selected requirement record source/version, identifier and text reference, applicability with reason, component and trust boundary, verification method, evidence revision and environment, result (`VERIFIED`, `FAILED`, `UNRUN` or `NOT APPLICABLE`), verifier/date, and remediation/recheck when needed.

## Steps
1. Freeze the source version before selecting requirement identifiers.
2. Map applicable requirements to evidence-producing checks. Justify `NOT APPLICABLE` from the actual architecture; missing evidence is not a reason.
3. Execute checks at the real trust boundary. Keep authentication, authorisation and data-boundary evidence separate where the requirements distinguish them.
4. Record failures and unrun checks without deleting them from the denominator. After remediation, recheck affected requirements and replace stale evidence.
5. On source upgrade, deliberately map old to new identifiers; retain historical results with the original version.

## Worked distinction
`ASVS-5.0.0-Vx.y.z` is linked to an API authorisation test, command, roles, environment and result.

“Security scanner passed” has no requirement-to-evidence mapping and cannot support the same claim.

## Verify and recover
Confirm version-qualified evidence for every claimed result. If source version, target boundary or verifier is unknown, hold the claim until resolved. Report the requirement-evidence map and separate result counts; never turn FAILED or UNRUN into VERIFIED by omission.

Source details and access limits: [SOURCES.md](SOURCES.md).
