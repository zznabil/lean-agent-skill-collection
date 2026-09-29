---
name: standard-iso-15026-2
description: "Build an assurance argument tied to current evidence."
---
# ISO/IEC/IEEE 15026-2 assurance cases

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
- Structure or review a consequential assurance claim for a named system or artifact.
- Do not replace testing, independent review or domain approval with a persuasive narrative.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. State the top-level claim, system boundary, operating assumptions and intended decision.
2. Separate the claim from the argument that supports it and the evidence offered for that argument.
3. Break the claim into subclaims only where that clarifies a real reasoning obligation.
4. For each evidence item, identify its source, revision, environment, scope and limitations.
5. Explain why the evidence supports the claim; a test result label is not an argument by itself.
6. Identify assumptions, contrary evidence, plausible defeaters and unresolved gaps.
7. Check that the argument does not claim more than its evidence observes, including deployment and authentication boundaries.
8. Record changes that invalidate evidence and the required re-verification.
9. Do not mark a required assurance claim established while a material gap remains; seek an authorised scope decision if needed.
10. Use the licensed edition and qualified domain process for a formal assurance-case assessment.

## Verify and recover
- **Worked check (illustrative, not executed):** A staging test is used to claim that all production failure modes are safe.
- **Expected:** Limit the supported claim to the tested setting and identify the missing production-equivalence evidence.
- **If blocked:** A supporting test cannot be reproduced or its artifact revision is unknown. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
