---
name: standard-conventional-commits
description: "Describe a verified change in Conventional Commits form."
---
# Conventional Commits

## Task and boundary
- Draft or validate commit messages where the project adopts Conventional Commits 1.0.0.
- Do not rewrite historical commits, create commits or trigger releases without the relevant authorization.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing project-adopted practice. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. Read the actual change and repository conventions before choosing the commit type.
2. Use the shape type(optional-scope)!: description, with the exclamation mark only when indicating a breaking change.
3. Use fix for a bug fix and feat for new functionality; other types are permitted under project conventions.
4. Describe the change accurately and concisely rather than claiming tests or outcomes not observed.
5. Put an optional body after a blank line and optional trailers after the body as the specification defines.
6. Mark a breaking change with ! or a BREAKING CHANGE footer and explain its actual compatibility impact.
7. Do not infer that a docs, chore or refactor type prevents a breaking change.
8. Split unrelated changes when appropriate and authorised, rather than hiding multiple intents under one misleading message.
9. Validate the message with the project's tooling and check the full diff for consistency.
10. Return the message and any material classification uncertainty; this writing step does not authorize a commit or release.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A refactor removes a public option while its message says only refactor: simplify code.
- **Expected:** Flag and document the breaking change regardless of the refactor type.
- **Missing-evidence case:** The actual diff or repository commit convention is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
