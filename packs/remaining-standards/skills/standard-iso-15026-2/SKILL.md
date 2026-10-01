---
name: standard-iso-15026-2
description: "Build an assurance argument tied to current evidence."
---
# ISO/IEC/IEEE 15026-2 assurance cases

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate how-to instructions, reference material and explanation.
- These three approaches are the default communication drivers, not formal standards conformance. Use other domain standards only when the task requires them. Communication patterns do not transfer legal or organisational authority.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Identify one actor, action and observable verification target for each requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When explaining a difficult mechanism, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Structure or review a consequential assurance claim for a named system or artifact.
- Do not replace testing, independent review or domain approval with a persuasive narrative.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. State the top-level claim, system boundary, operating assumptions and intended decision.
2. Distinguish the claim, its supporting argument and the evidence offered for that argument.
3. Divide the claim into subclaims only where this clarifies a real reasoning obligation.
4. Identify the source, revision, environment, scope and limitations of each evidence item.
5. Explain why the evidence supports the claim. A test result label alone is not an argument.
6. Identify assumptions, contrary evidence, plausible defeaters and unresolved gaps.
7. Check that the argument stays within what its evidence observes. Include deployment and authentication boundaries in this check.
8. Record changes that invalidate evidence. Record the required re-verification.
9. Do not mark a required assurance claim established while a material gap remains. Seek an authorised scope decision if needed.
10. Use the licensed edition and qualified domain process for a formal assurance-case assessment.

## Verify and recover
- **Worked check (illustrative, not executed):** A staging test is used to claim that all production failure modes are safe.
- **Expected:** Limit the supported claim to the tested setting and identify the missing production-equivalence evidence.
- **If blocked:** If a supporting test cannot be reproduced or its artifact revision is unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
