---
name: practice-sre-error-budgets
description: "Use an agreed SLO and error budget for release decisions."
---
# Google SRE SLO and error-budget practice

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root policy loads, it governs this skill; otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits intact.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations. Compare noncompliant and compliant code or configuration when useful.
- These are prose and control patterns, not transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep their force unchanged. Identify one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery path.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Define or apply a service reliability decision with an agreed SLO and error-budget policy.
- Do not invent a universal uptime target. Do not freeze every release because of an unverified alert.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the user-visible service, critical journey and reliability decision that the work must support.
2. Define the SLI, valid-event population, good-event criterion and measurement window.
3. Agree the SLO with the responsible stakeholders. Distinguish that target from an external contractual SLA.
4. Calculate the error budget with the agreed objective and valid-event denominator.
5. Validate telemetry and exclusions. Do not let missing measurements appear as healthy service.
6. Apply the project's documented policy for budget consumption, release holds, exceptions and recovery.
7. Inspect trends and failure causes before recommending action. A single alert does not explain budget exhaustion.
8. State security fixes, emergency changes and other policy exceptions explicitly. Do not add blanket release bans.
9. Record the owner, decision, evidence and conditions for resuming normal change activity.
10. Report calculations and uncertainty. Do not replace the actual policy with this example routine.

## Verify and recover
- **Worked check (illustrative, not executed):** For 100,000 valid requests and a 99.9% success SLO, the allowed bad-event budget is 100 requests.
- **Expected:** Use that stated denominator and policy window; do not transfer the example target to another service automatically.
- **If blocked:** If the valid-event denominator, SLO or exception policy is unapproved or unreliable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
