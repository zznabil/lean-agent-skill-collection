---
name: standard-json-schema
description: "Validate JSON with an explicit schema dialect."
---
# JSON Schema

## Task and boundary
- Author, review or test a JSON Schema contract for a specified JSON instance family.
- Do not treat schema validation as authorization, data truth or a complete business-rule check.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing conditional contract. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Identify the intended instances, dialect and validator support; declare $schema where the contract requires it.
2. Resolve $id and references against their actual base URIs. Control external resolution rather than fetching arbitrary locations.
3. Describe types, required properties, numeric/string limits and array constraints from the real requirement.
4. Do not confuse a missing property with a property whose value is null.
5. Use the 2020-12 array and reference semantics when that dialect is selected; do not silently mix older-draft keywords.
6. Check additionalProperties and unevaluatedProperties in the context of composed schemas, not as interchangeable slogans.
7. Treat default and other annotations separately from validation or value insertion.
8. Verify whether the validator treats format as annotation or assertion under the chosen vocabulary and configuration.
9. Test valid, invalid, boundary, missing, null and composition cases that can distinguish the intended constraint.
10. Report unsupported vocabularies, reference failures and unchecked business rules; a parser accepting the schema is not enough.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A property appears under properties but is omitted from required.
- **Expected:** Do not claim the schema requires it; test an instance where that property is absent.
- **Missing-evidence case:** The validator silently ignores an unsupported vocabulary or cannot resolve a required reference.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
