---
name: standard-cyclonedx
description: "Validate a scoped CycloneDX bill of materials."
---
# CycloneDX

## Task and boundary
- Create or review a CycloneDX BOM using the project-selected format and version.
- Do not treat a valid BOM as proof of complete dependency discovery or application security.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CycloneDX specification version, serialization, generator and consumer.
2. Define the system/artifact boundary, data sources, exclusions and inventory timestamp or revision.
3. Represent the root component and relevant components, services and relationships from actual evidence.
4. Give bom-ref values unique identities within the BOM and verify that relationships reference existing objects.
5. Record versions, hashes, licenses and external references only when supported by evidence.
6. Distinguish direct and transitive dependency observations, and make incomplete discovery explicit.
7. Add vulnerability or VEX information only with justified status, context and evidence; not-affected is not an empty default.
8. Validate against the exact versioned schema and test the actual downstream consumer.
9. Compare representative entries and dependencies with the artifact, lockfiles and build sources.
10. Report the validated scope and unresolved inventory, licensing or vulnerability information separately.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Two components share a bom-ref and dependencies point ambiguously to them.
- **Expected:** Reject the identity collision and repair references before accepting the BOM.
- **Missing-evidence case:** The generator cannot discover dynamic or vendored dependencies in the requested scope.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
