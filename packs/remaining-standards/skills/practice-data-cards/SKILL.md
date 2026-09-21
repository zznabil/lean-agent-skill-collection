---
name: practice-data-cards
description: "Document dataset decisions throughout its lifecycle."
---
# Data Cards

## Task and boundary
- Create or review a Data Card for a named dataset and its intended applications.
- Do not invent provenance, stakeholder consultation or collection decisions to fill a template.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt template. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset, version, accountable parties, intended applications and prohibited or unsuitable uses.
2. Describe where the data came from and the decisions that shaped collection and inclusion.
3. Record composition, features, labels, sampling, missingness and relevant population or subgroup information.
4. Explain preprocessing, annotation, transformations and their assumptions or known effects.
5. State access, licensing, privacy, retention and distribution constraints supported by evidence.
6. Record known quality issues, evaluation limits and gaps that a downstream user must understand.
7. Use the Data Card to make decisions and trade-offs visible, not merely to repeat a schema.
8. Link evidence and responsible owners while protecting restricted information.
9. Review the card with relevant contributors or users where the task requires it, and distinguish planned from completed review.
10. Version the card with the dataset and record update/maintenance responsibilities.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A dataset description lists columns but omits that one population was excluded during collection.
- **Expected:** Document the exclusion and its implications for intended use; a column list is not a sufficient Data Card.
- **Missing-evidence case:** Collection or transformation decisions have no reliable record.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
