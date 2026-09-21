---
name: standard-iso-25024
description: "Define reproducible measures for a data-quality claim."
---
# ISO/IEC 25024 data quality measures

## Task and boundary
- Specify or review data-quality measurements for a named dataset and use.
- Do not present an undefined quality score or a sampling estimate as a complete population measurement.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. State the data-quality characteristic, decision and dataset boundary being measured.
2. Select a measure from the authorised source or clearly label a project-defined measure.
3. Define the measured entities, numerator, denominator, units, sampling and collection method.
4. Identify the data-quality measure elements and how they combine into the reported result.
5. Record missing, invalid and excluded observations instead of dropping them silently.
6. Test the measurement with known good and defective examples.
7. Calculate independently where a supplied figure determines acceptance.
8. Assess sampling error and sensitivity to definitions or reference data.
9. Compare results only when measure definitions and population boundaries are compatible.
10. Report actual values, uncertainty and limitations; use the full licensed standard before calling the measure ISO-conformant.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A data-quality score divides valid rows by only the rows that could be parsed.
- **Expected:** Expose parse failures in the denominator or exclusions and prevent a misleading completeness claim.
- **Missing-evidence case:** The population, denominator or definition of a valid observation is unspecified.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
