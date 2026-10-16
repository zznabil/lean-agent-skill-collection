---
name: guard-owasp-samm
description: "Scope SAMM to an explicitly authorised organisation."
---
# OWASP SAMM

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
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery when useful. Add contrast or TL;DR only when helpful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Check whether the requested SAMM activity belongs to an authorised organisation-level programme.
- Do not score SAMM maturity for a single agent, small code change or ordinary repository task.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.
- OFF-DEFAULT GUARD: use this routine only for the stated selection or review request. Do not install it as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject globally. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the historical adoption decision. It rejects SAMM as a global Lean workflow.
2. Identify the requesting organisation, programme owner, scope and explicit authority for a maturity assessment.
3. If that programme does not exist, retain the exclusion. Complete the ordinary task under its actual requirements.
4. If the assessment is authorised, obtain the selected SAMM model and assessment guidance before you design the activity.
5. Keep business functions, security practices, objectives and maturity evidence at the organisation/process level.
6. Do not treat a repository checkbox or agent prompt as organisational maturity evidence.
7. Use the approved assessment method to record interviews, artifacts, observations and uncertainty.
8. Keep current evidence, target maturity and the prioritised improvement roadmap separate.
9. Use an organisation-specific process and owner for implementation. Do not add global runtime hooks or gates.
10. Report the scope decision and evidence limits. Do not change the register's global rejection.

## Verify and recover
- **Worked check (illustrative, not executed):** A single bug-fix task asks the agent to assign itself a SAMM maturity level.
- **Expected:** Reject that unit of assessment as invalid. Retain the organisation-only boundary.
- **If blocked:** If no programme owner or authority exists for organisational assessment, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
