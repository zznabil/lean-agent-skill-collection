---
name: standard-cvss4
description: "Score vulnerability severity with a traceable vector."
---
# CVSS

## Task and boundary
- Assign or review a CVSS v4.0 score for a specified vulnerability and context.
- Do not treat severity as exploit probability, complete business risk or an automatic remediation deadline.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local input only. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the vulnerable system, affected behaviour and evidence supporting each metric choice.
2. Use the official v4.0 definitions; do not import v3.x metric meanings or formulas.
3. Assess Base exploitability and vulnerable/subsequent-system impacts under the defined attack assumptions.
4. Add Threat and Environmental values when the relevant current evidence and deployment context are available.
5. Keep Supplemental metrics separate from the score; they provide additional context rather than silently changing severity.
6. Use a validated official-compatible calculator instead of guessing the score from labels.
7. Publish the vector string with the score and indicate which metric groups were used.
8. Distinguish default/unknown values from observed facts, and record assumptions that could change the result.
9. Recheck the vector when exploitation evidence or deployment controls materially change.
10. Provide FIRST attribution and separate the severity result from the organisation's prioritisation and risk decision.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A report publishes a numeric CVSS score but omits its vector and metric evidence.
- **Expected:** Request or reconstruct the justified vector before treating the number as reproducible severity evidence.
- **Missing-evidence case:** The actual attack prerequisites or impact evidence are insufficient to select a metric.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
