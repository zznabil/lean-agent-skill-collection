---
name: practice-versioned-verification-requirements
description: "Track versioned requirements to evidence and result."
---
# Versioned verification requirements

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine to trace requirements across reviews, automation and source-version changes. Qualify external identifiers by source and exact version. A scanner score cannot verify every requirement. This pattern is not a complete ASVS assessment.

## Verification record
For each selected requirement, record source/version, identifier, text reference, applicability and reason, component, trust boundary and verification method. Include evidence revision, environment, result (`VERIFIED`, `FAILED`, `UNRUN` or `NOT APPLICABLE`), verifier/date and needed remediation/recheck.

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
Check version-qualified evidence for every claimed result. Hold claims until unknown source version, target boundary or verifier is resolved. Report the requirement-evidence map with separate result counts. Never turn FAILED or UNRUN into VERIFIED by omission.

For source details and access limits, see [SOURCES.md](SOURCES.md).
