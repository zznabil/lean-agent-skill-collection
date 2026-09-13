---
name: standard-iso-25012
description: "Assess data quality against its intended use."
---
# ISO/IEC 25012 data quality model

## Task and boundary
- Create a data-quality profile for a named dataset and use context.
- Do not equate a complete row count with accurate, suitable or accessible data.
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
1. Identify the dataset version, consumers, tasks and operational constraints.
2. Use the selected data-quality model to choose characteristics relevant to those tasks.
3. Distinguish properties inherent in the data from properties dependent on the supporting system.
4. Define the quality question and acceptance evidence for each selected characteristic.
5. Check accuracy against an appropriate reference, not merely consistency between duplicated values.
6. Assess completeness relative to required entities and attributes, not an arbitrary percentage alone.
7. Evaluate consistency, credibility, currency and other applicable characteristics without treating them as substitutes.
8. Record known defects, provenance, sampling limits and the data or system owner responsible for correction.
9. Verify corrections and assess whether changed data or use conditions invalidate earlier conclusions.
10. Use the full licensed model for complete coverage or conformance; this is a use-specific Lean application.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Every field is populated, but values come from an outdated source.
- **Expected:** Separate completeness from currency and accuracy; populated data is not automatically suitable.
- **Missing-evidence case:** No reference source or intended-use criterion exists for the claimed quality.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
