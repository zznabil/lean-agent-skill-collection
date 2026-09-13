---
name: standard-spdx
description: "Describe scoped BOM facts with the selected SPDX model."
---
# SPDX

## Task and boundary
- Create or verify SPDX bill-of-materials data for a named artifact or system.
- Do not equate an SPDX document with a complete inventory, legal clearance or vulnerability absence.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Select the exact SPDX version, profiles, serialization and consumer capabilities; do not mix 2.x fields into a 3.x model.
2. Define the inventory boundary, creation method, source revision and what is not observed.
3. Identify elements, creators, creation information and relationships using the selected model's requirements.
4. Use stable element identities and artifact digests where available; do not invent package versions or suppliers.
5. Distinguish declared licensing, detected evidence and conclusions according to the chosen licensing profile.
6. Preserve unknowns and disagreements instead of converting them into a permissive license.
7. Describe dependencies and other relationships with the correct direction and semantics.
8. Validate the serialized document and exercise import into the actual consumer.
9. Check representative entries against the artifact and build inputs; schema validity alone does not establish completeness.
10. Report scope, version, profiles, license-evidence limits and unresolved elements; any legal conclusion needs appropriate review.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A generated BOM omits vendored code but claims complete coverage.
- **Expected:** Record the unobserved boundary and correct the completeness claim before acceptance.
- **Missing-evidence case:** The target tool supports SPDX 2.3 but the document uses 3.0.1 profiles.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
