---
name: standard-iso-25010
description: "Turn product-quality claims into testable scenarios."
---
# ISO/IEC 25010

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first in familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep actors, actions and observable verification targets clear.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not formal standards conformance.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Do not change requirement force.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When mechanisms are difficult, explain them from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules confer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.

## Task and boundary
- Define or assess relevant product-quality attributes for a specified product.
- Do not convert the quality model into an arbitrary universal score or equal-weight checklist.
- Limit work to the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check the source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Retain this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the product boundary, users, lifecycle stage and decision that the assessment must support.
2. Use the selected edition's product-quality model. Do not replace its characteristic list with an older edition's list.
3. Select relevant characteristics from actual stakeholder needs, contractual constraints and risks.
4. For each selected concern, specify the environment, stimulus, expected response and agreed observable measure.
5. Separate functional correctness from other quality concerns. Passing unit tests does not measure every characteristic.
6. Record conflicts between qualities, such as performance versus resource use. Do not hide the stakeholder trade-off.
7. Specify representative workloads, failure conditions and supported environments before taking measurements.
8. Link each assessment to the exact product revision and evidence. Mark unmeasured attributes as unmeasured.
9. Apply the project's decision criteria. Do not invent acceptance thresholds or infer quality from a standards name.
10. Obtain the full edition and its definitions before claiming complete model coverage or conformance.

## Verify and recover
- **Worked check (illustrative, not executed):** A review calls a product reliable because its unit tests pass.
- **Expected:** Identify the reliability scenario and missing failure/recovery evidence. Do not award a reliability score.
- **If blocked:** If the product boundary or agreed quality criteria are missing, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
