---
name: standard-semver
description: "Choose a version from actual public-API compatibility."
---
# Semantic Versioning

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization: separate how-to, reference and explanation when useful. For difficult mechanisms, explain simple foundations first. Contrast noncompliant and compliant code or configuration when useful.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them; they are not default communication drivers.

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
