---
name: standard-cyclonedx
description: "Validate a scoped CycloneDX bill of materials."
---
# CycloneDX

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

## Task and boundary
- Create or review a CycloneDX BOM using the project-selected format and version.
- Do not treat a valid BOM as proof of complete dependency discovery or application security.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CycloneDX specification version, serialization, generator and consumer.
2. Define the system/artifact boundary, data sources, exclusions and inventory timestamp or revision.
3. Represent the root component and relevant components, services and relationships from actual evidence.
4. Give bom-ref values unique identities within the BOM and verify that relationships reference existing objects.
5. Record versions, hashes, licenses and external references only when supported by evidence.
6. Distinguish direct and transitive dependency observations, and make incomplete discovery explicit.
7. Add vulnerability or VEX information only with justified status, context and evidence; not-affected is not an empty default.
8. Validate against the exact versioned schema and test the actual downstream consumer.
9. Compare representative entries and dependencies with the artifact, lockfiles and build sources.
10. Report the validated scope and unresolved inventory, licensing or vulnerability information separately.

## Verify and recover
- **Worked check (illustrative, not executed):** Two components share a bom-ref and dependencies point ambiguously to them.
- **Expected:** Reject the identity collision and repair references before accepting the BOM.
- **If blocked:** The generator cannot discover dynamic or vendored dependencies in the requested scope. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
