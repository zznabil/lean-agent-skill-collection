---
name: standard-conventional-commits
description: "Describe a verified change in Conventional Commits form."
---
# Conventional Commits

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization: separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For normative requirements, preserve force and use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them; they are not default communication drivers.

## Task and boundary
- Draft or validate commit messages when the project adopts Conventional Commits 1.0.0.
- Do not rewrite historical commits, create commits or trigger releases without the relevant authorization.
- Work only on the selected artifact or assessment. This routine does not authorize attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Existing project-adopted practice. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the actual change and repository conventions before you select the commit type.
2. Use the shape type(optional-scope)!: description. Use the exclamation mark only to indicate a breaking change.
3. Use fix for a bug fix and feat for new functionality. Project conventions permit other types.
4. Describe the change accurately and concisely. Do not claim tests or outcomes that you did not observe.
5. Place an optional body after a blank line. Place optional trailers after the body as the specification defines.
6. Mark a breaking change with ! or a BREAKING CHANGE footer. Explain its actual compatibility impact.
7. Do not infer that a docs, chore or refactor type prevents a breaking change.
8. When appropriate and authorised, split unrelated changes. Do not hide multiple intents in one misleading message.
9. Validate the message with the project's tooling. Check the full diff for consistency.
10. Return the message and any material uncertainty about classification. This writing step does not authorize a commit or release.

## Verify and recover
- **Worked check (illustrative, not executed):** A refactor removes a public option while its message says only refactor: simplify code.
- **Expected:** Flag and document the breaking change regardless of the refactor type.
- **If blocked:** If the actual diff or repository commit convention is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
