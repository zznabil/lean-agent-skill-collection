---
name: guard-owasp-samm
description: "Scope SAMM to an explicitly authorised organisation."
---
# OWASP SAMM

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If it loads, its policy governs this skill; skill-specific rules refine the kernel. Without it, you MUST apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate instructions, reference and explanation. Explain difficult mechanisms from simple foundations.
- Use other domain standards only when the task requires them. This kernel transfers no legal or organisational authority from other frameworks.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery when useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
