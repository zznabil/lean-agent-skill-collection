---
name: practice-gqm
description: "Derive useful measurements from a goal and questions."
---
# Goal–Question–Metric

## Task and boundary
- Design a measurement plan for a defined engineering improvement or decision.
- Do not collect convenient metrics first and invent a goal afterwards.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the object to study, purpose, quality focus, viewpoint and operating context.
2. Convert the goal into questions whose answers could change the engineering decision.
3. For each question, identify the smallest set of measures that can answer it.
4. Define each measure's unit, denominator, collection method, observation window and source.
5. Specify how results will be interpreted before collecting data; record confounders and missing-data handling.
6. Trace every metric to a question and every question to the goal. Remove orphan measures that have no decision use.
7. Keep baseline and candidate conditions comparable where a comparison is intended.
8. Validate collection using known examples; check that the data pipeline can detect a relevant change.
9. Interpret results in their context and report uncertainty; do not confuse a proxy metric with the goal itself.
10. Record the resulting decision and whether new questions or measures are needed.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** The goal is easier onboarding, but the only proposed metric is documentation word count.
- **Expected:** Ask whether users complete onboarding and where they need help; measure those outcomes rather than assuming fewer
  words is better.
- **Missing-evidence case:** The measurement has no valid denominator or does not observe the question.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
