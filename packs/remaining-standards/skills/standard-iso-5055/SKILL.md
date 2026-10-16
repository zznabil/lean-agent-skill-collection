---
name: standard-iso-5055
description: "Scope automated source-quality measurements honestly."
---
# ISO/IEC 5055 source-code quality measures

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep each requirement's force, actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Contrast noncompliant and compliant code or configuration when useful. Report observed results. Missing or stale evidence is not success.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Evaluate a source-code quality measurement with an explicitly selected ISO 5055 tool or method.
- Do not classify a generic linter count or maintainability score as an ISO 5055 measurement.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Project-local benchmark. Keep this boundary unless an authorised decision explicitly changes it.
- The collection did not obtain the full licensed text. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the software boundary, languages, source revision and quality question.
2. Identify the standard-defined measures that the selected tool implements and the languages it supports.
3. Record exclusions, generated code, dependency coverage and incomplete analysis paths.
4. Run the tool with a reproducible configuration. Retain its raw evidence.
5. Inspect representative findings and false positives. Do not accept aggregate numbers without inspection.
6. Distinguish detected structural weaknesses from demonstrated runtime failures or exploitability.
7. Compare results only when definitions, scope, tool versions and configurations are compatible.
8. Trace proposed fixes to actual risk. After a change, verify the affected behavior.
9. Report missing coverage and tool limitations with the scores.
10. Obtain the licensed measure definitions before asserting standard conformity. Public scope alone is insufficient.

## Verify and recover
- **Worked check (illustrative, not executed):** A file-length linter is described as an ISO 5055 security assessment.
- **Expected:** Reject the unsupported equivalence. State exactly what the linter measured.
- **If blocked:** If the tool does not disclose measure definitions or supported analysis coverage, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
