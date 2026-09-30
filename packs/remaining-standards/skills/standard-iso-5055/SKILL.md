---
name: standard-iso-5055
description: "Scope automated source-quality measurements honestly."
---
# ISO/IEC 5055 source-code quality measures

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Do not claim root activation without evidence. Without that root policy, you MUST apply this kernel; skill-specific rules refine it.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations.
- These are communication patterns, not formal standards conformance or transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep each requirement's force, actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Contrast noncompliant and compliant code or configuration when useful. Report observed results. Missing or stale evidence is not success.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
