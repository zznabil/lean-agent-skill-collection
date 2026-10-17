---
name: standard-conventional-commits
description: "Describe a verified change in Conventional Commits form."
---
# Conventional Commits

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Draft or validate commit messages when the project adopts Conventional Commits 1.0.0.
- Do not rewrite historical commits, create commits or trigger releases without the relevant authorisation.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

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
10. Return the message and any material uncertainty about classification. This writing step does not authorise a commit or release.

## Verify and recover
- **Worked check (illustrative, not executed):** A refactor removes a public option while its message says only refactor: simplify code.
- **Expected:** Flag and document the breaking change regardless of the refactor type.
- **If blocked:** If the actual diff or repository commit convention is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
