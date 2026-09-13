---
name: standard-iso-25010
description: "Turn product-quality claims into testable scenarios."
---
# ISO/IEC 25010

## Task and boundary
- Define or assess relevant product-quality attributes for a specified product.
- Do not turn the quality model into an arbitrary universal score or equal-weight checklist.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the product boundary, users, lifecycle stage and the decision the assessment must support.
2. Use the selected edition's product-quality model; do not substitute an older edition's characteristic list.
3. Select relevant characteristics from actual stakeholder needs, contractual constraints and risks.
4. For each selected concern, name the environment, stimulus, expected response and an agreed observable measure.
5. Separate functional correctness from other quality concerns; passing unit tests does not measure every characteristic.
6. Capture conflicts between qualities, such as performance versus resource use, without hiding the stakeholder trade-off.
7. Specify representative workloads, failure conditions and supported environments before measuring.
8. Tie each assessment to the exact product revision and evidence. Record unmeasured attributes as unmeasured.
9. Use the project's decision criteria; do not invent acceptance thresholds or infer quality from a standards name.
10. Obtain the full edition and its definitions before claiming complete model coverage or conformance.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A review calls a product reliable because its unit tests pass.
- **Expected:** Identify the reliability scenario and missing failure/recovery evidence instead of awarding a reliability score.
- **Missing-evidence case:** The product boundary or agreed quality criteria are missing.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
