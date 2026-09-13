---
name: standard-semver
description: "Choose a version from actual public-API compatibility."
---
# Semantic Versioning

## Task and boundary
- Select or review a release version in a project that adopts Semantic Versioning 2.0.0.
- Do not impose SemVer on date-based versions or infer compatibility from a commit type alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing project-adopted practice. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. Identify the project's declared public API and current version before classifying a change.
2. Compare actual externally observable contracts, not only file diffs or implementation size.
3. For versions at or above 1.0.0, use a major increment for incompatible public-API changes.
4. Use a minor increment for backward-compatible new functionality and a patch increment for backward-compatible fixes.
5. Treat documented deprecation as a minor-version concern under SemVer and explain future removal separately.
6. Account for initial development under 0.y.z; do not promise stable compatibility that the project has not declared.
7. Use prerelease identifiers with the defined precedence rules; numeric identifiers have numeric ordering and no leading zeroes.
8. Keep build metadata out of precedence comparisons.
9. Never modify the contents of an already released version; prepare a new version when a correction is needed.
10. Report the proposed version, API evidence, compatibility implications and migration notes without tagging or publishing unless
    authorised.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A one-line patch removes a documented request parameter.
- **Expected:** Classify the public-API break by its behaviour, not as a patch merely because the diff is small.
- **Missing-evidence case:** The project has not defined which interface is public.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
