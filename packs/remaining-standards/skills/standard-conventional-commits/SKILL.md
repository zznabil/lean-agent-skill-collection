---
name: standard-conventional-commits
description: "Describe a verified change in Conventional Commits form."
---
# Conventional Commits

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
