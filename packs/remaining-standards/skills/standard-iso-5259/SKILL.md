---
name: standard-iso-5259
description: "Manage data quality for a specified analytics use."
---
# ISO/IEC 5259 series

## Task and boundary
- Apply the relevant ISO/IEC 5259 part to data used by analytics or machine learning.
- Do not infer that a link to one part supplies every normative requirement of the series.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the dataset, version, intended analytical use, users and consequences of poor data quality.
2. Select the applicable 5259 parts and editions; record which full sources are actually available.
3. Identify data-quality needs across acquisition, preparation, labelling, use, maintenance and change.
4. Map each need to a measurable criterion, owner and evidence source appropriate to the use case.
5. Examine representativeness, provenance, missingness, consistency and transformations where they affect the analytical result.
6. Separate source data, labels, derived features and evaluation partitions so quality findings can be traced.
7. Record data-quality problems, corrective actions and their effects on downstream models or decisions.
8. Validate improvements with the selected measures rather than assuming that more data is better data.
9. Preserve unresolved limitations and trigger reassessment after material dataset or intended-use changes.
10. Use licensed part-specific requirements for formal assessment; the historical register URL points to Part 4, not the whole
    series.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A model's aggregate accuracy improves after adding data from only the dominant user group.
- **Expected:** Assess use-specific representation and subgroup effects instead of inferring that overall data quality improved.
- **Missing-evidence case:** The relevant series part, dataset provenance or evaluation partition is missing.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
