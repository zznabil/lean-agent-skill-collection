---
name: practice-datasheets
description: "Answer dataset lifecycle questions with evidence."
---
# Datasheets for Datasets

## Task and boundary
- Prepare a datasheet for a dataset using the Datasheets for Datasets question framework.
- Do not force unsupported answers or infer ethical clearance from a completed datasheet.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset version, accountable owner and intended downstream users.
2. Describe motivation: why the dataset was created, by whom and with what support.
3. Describe composition: instances, populations, labels, relationships, missingness and sensitive content where relevant.
4. Describe collection: sources, sampling, procedures, people involved and applicable consent or notice evidence.
5. Describe preprocessing, cleaning, labelling and any transformations that affect interpretation.
6. Describe prior and intended uses, unsuitable uses and limitations evidenced by the dataset's history.
7. Describe distribution, access restrictions, licences and third-party dependencies without inventing permission.
8. Describe maintenance, update plans, error reporting and responsible parties.
9. Mark unanswered or inapplicable questions with reasons; do not treat no documentation as proof that no issue exists.
10. Review answers for consistency and preserve links to evidence while protecting sensitive data.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A datasheet says no personal data is present because nobody documented a privacy review.
- **Expected:** Mark the privacy question unresolved and seek evidence rather than equating missing review with no personal data.
- **Missing-evidence case:** Consent, distribution rights or maintenance ownership cannot be confirmed.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
