---
name: standard-semver
description: "Choose a version from actual public-API compatibility."
---
# Semantic Versioning

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Select or review a release version in a project that adopts Semantic Versioning 2.0.0.
- Do not impose SemVer on date-based versions or infer compatibility from a commit type alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A one-line patch removes a documented request parameter.
- **Expected:** Classify the public-API break by its behaviour, not as a patch merely because the diff is small.
- **If blocked:** The project has not defined which interface is public. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
