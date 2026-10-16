---
name: practice-sre-error-budgets
description: "Use an agreed SLO and error budget for release decisions."
---
# Google SRE SLO and error-budget practice

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
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep their force unchanged. Identify one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery path.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

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
