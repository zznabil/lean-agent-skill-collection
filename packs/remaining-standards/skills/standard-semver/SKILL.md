---
name: standard-semver
description: "Choose a version from actual public-API compatibility."
---
# Semantic Versioning

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task and boundary
- Select or review a release version for a project that adopts Semantic Versioning 2.0.0.
- Do not impose SemVer on date-based versions. Do not infer compatibility from a commit type alone.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing project-adopted practice. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the project's declared public API and current version before you classify a change.
2. Compare actual externally observable contracts. Do not rely only on file diffs or implementation size.
3. For versions at or above 1.0.0, increment the major version for incompatible public-API changes.
4. Increment the minor version for backward-compatible new functionality. Increment the patch version for backward-compatible fixes.
5. Treat documented deprecation as a minor-version concern under SemVer. Explain future removal separately.
6. Account for initial development under 0.y.z. Do not promise stable compatibility that the project has not declared.
7. Apply the defined precedence rules to prerelease identifiers. Order numeric identifiers numerically; they must not have leading zeroes.
8. Exclude build metadata from precedence comparisons.
9. Never modify the contents of an already released version. Prepare a new version when a correction is needed.
10. Report the proposed version, API evidence, compatibility implications and migration notes. Do not tag or publish unless authorised.

## Verify and recover
- **Worked check (illustrative, not executed):** A one-line patch removes a documented request parameter.
- **Expected:** Classify the public-API break by its behaviour, not as a patch merely because the diff is small.
- **If blocked:** If the project has not defined which interface is public, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
