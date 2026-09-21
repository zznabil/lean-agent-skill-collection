---
name: practice-versioned-verification-requirements
description: "Track versioned requirements to evidence and result."
---
# Versioned verification requirements

## Use and boundary
- Use when requirements must remain traceable across reviews, automation and source-version changes.
- Qualify an external requirement identifier with its source and version.
- Do not treat an automated scanner score as verification of every requirement.
- This routine extracts a traceability pattern; it is not a complete ASVS assessment.

## Verification record
For each selected requirement, record:
- source and exact version;
- requirement identifier and text reference;
- applicability decision and reason;
- target component and trust boundary;
- verification method;
- evidence revision and environment;
- result: `VERIFIED`, `FAILED`, `UNRUN` or `NOT APPLICABLE`;
- verifier and date;
- remediation and recheck, when needed.

## Procedure
1. Freeze the source version before selecting identifiers.
2. Map each applicable requirement to one or more evidence-producing checks.
3. Justify `NOT APPLICABLE` from the actual architecture; missing evidence is not a justification.
4. Execute checks at the real trust boundary.
5. Keep authentication, authorisation and data-boundary evidence separate where the requirement distinguishes them.
6. Record failed and unrun requirements without deleting them from the denominator.
7. Recheck affected requirements after remediation.
8. On source upgrade, map old identifiers to new identifiers deliberately; do not assume numbering stability.
9. Preserve historical results with their original version.

## Worked distinction
`ASVS-5.0.0-Vx.y.z` is linked to an API authorisation test, its command, roles, environment and result.

“Security scanner passed” has no requirement-to-evidence mapping and cannot support the same claim.

## Finish and stop
- Confirm that every claimed result has version-qualified evidence.
- Stop if the selected source version, target boundary or verifier is unknown.
- Return the requirement-evidence map and separate result counts.

Source details and access limits: [SOURCES.md](SOURCES.md).
