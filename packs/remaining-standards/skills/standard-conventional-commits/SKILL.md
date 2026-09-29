---
name: standard-conventional-commits
description: "Describe a verified change in Conventional Commits form."
---
# Conventional Commits

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
- Draft or validate commit messages where the project adopts Conventional Commits 1.0.0.
- Do not rewrite historical commits, create commits or trigger releases without the relevant authorization.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A refactor removes a public option while its message says only refactor: simplify code.
- **Expected:** Flag and document the breaking change regardless of the refactor type.
- **If blocked:** The actual diff or repository commit convention is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
