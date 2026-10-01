---
name: practice-versioned-verification-requirements
description: "Track versioned requirements to evidence and result."
---
# Versioned verification requirements

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If it loads, its policy governs this skill. Otherwise, you MUST apply this kernel independently. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Keep simple replies short. These are the only default communication drivers, not a claim of formal standards conformance.
- When writing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, one action and one observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence does not establish success.
- These execution rules do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
