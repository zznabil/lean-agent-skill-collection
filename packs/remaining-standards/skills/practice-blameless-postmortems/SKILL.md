---
name: practice-blameless-postmortems
description: "Turn an incident into evidence-backed systemic learning."
---
# Google SRE blameless postmortems

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not a claim of formal standards conformance.

## Conditional execution rules
- For normative requirements, use uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify the actual state. When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. These execution rules do not transfer legal or organisational authority from external frameworks. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Write or review a postmortem when a real incident meets the project's review criteria.
- Do not blame individuals. Do not invent a single root cause or use a retrospective to silently change production.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change; lineage. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the incident scope, impact, detection and duration. State the evidence that supports the timeline.
2. Distinguish confirmed events from recollections, estimates and unresolved hypotheses.
3. Describe the conditions, information and constraints under which people and systems acted.
4. Analyse contributing technical and organisational factors. Do not stop at human error.
5. Record what went well, what failed and where luck limited the outcome.
6. Link proposed actions to specific observed failure modes or missing safeguards.
7. Assign each action an owner, a verification method and an appropriate priority or due condition.
8. Review the draft with relevant participants. Retain unresolved disagreements.
9. Track whether corrective actions changed the system or process. Publication alone does not close the risk.
10. Share with the authorised audience. Protect sensitive information and retain the purpose of blameless learning.

## Verify and recover
- **Worked check (illustrative, not executed):** A report concludes that an operator should have been more careful.
- **Expected:** Investigate the system conditions and safeguards that made the error consequential. Then define a verifiable improvement.
- **If blocked:** If available evidence does not support the timeline or a claimed contributing cause, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
