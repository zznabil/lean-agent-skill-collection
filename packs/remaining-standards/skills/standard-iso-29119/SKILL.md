---
name: standard-iso-29119
description: "Plan and trace testing with the applicable 29119 part."
---
# ISO/IEC/IEEE 29119 series
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
## Task and boundary
- Plan, specify or review software testing when the project selects the 29119 series.
- Do not treat the series as one document. Do not require every test technique for every change.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.
## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Preserve this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.
## Procedure
1. Identify the tested item, revision, risk, test level, environment and project test obligations.
2. Explicitly select the applicable series parts and editions. Concepts, processes, documentation and techniques are distinct sources.
3. Read the selected part before assigning a clause number or asserting its requirements.
4. Link each test condition to a requirement or risk. Define inputs, expected results and a credible oracle.
5. Choose techniques that address the named risk. Do not choose a method only to populate a checklist.
6. Specify test data, environment, execution order, entry/exit conditions and incident handling for the scope.
7. Record actual results, deviations, defects and reproducible evidence separately from planned cases.
8. Preserve traceability when the tested item, test or environment changes. Rerun affected checks.
9. Report passed, failed, blocked and unrun cases separately. An unexecuted case is not test evidence.
10. For formal process/documentation conformance, assess the licensed applicable parts, not this compact routine.
## Verify and recover
- **Worked check (illustrative, not executed):** A test plan contains expected results but no executions.
- **Expected:** Report a completed plan and unrun tests, not a passed test campaign.
- **If blocked:** If the applicable series part, oracle or test environment is unavailable, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Keep planned work, actual evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.
## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
