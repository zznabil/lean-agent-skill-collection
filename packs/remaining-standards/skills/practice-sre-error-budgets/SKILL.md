---
name: practice-sre-error-budgets
description: "Use an agreed SLO and error budget for release decisions."
---
# Google SRE SLO and error-budget practice

## Task and boundary
- Define or apply a service reliability decision using an agreed SLO and error-budget policy.
- Do not invent a universal uptime target or freeze every release from an unverified alert.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the user-visible service, critical journey and reliability decision to support.
2. Define the SLI, valid-event population, good-event criterion and measurement window.
3. Agree the SLO with the responsible stakeholders; distinguish the target from an external contractual SLA.
4. Calculate the error budget from the agreed objective and valid-event denominator.
5. Validate the telemetry and exclusions so missing measurements cannot appear as healthy service.
6. Use the project's documented policy for budget consumption, release holds, exceptions and recovery.
7. Inspect trends and failure causes before recommending action; a single alert does not explain budget exhaustion.
8. Keep security fixes, emergency changes and other policy exceptions explicit rather than adding blanket release bans.
9. Record the owner, decision, evidence and conditions for returning to normal change activity.
10. Report calculations and uncertainty without replacing the actual policy with this example routine.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** For 100,000 valid requests and a 99.9% success SLO, the allowed bad-event budget is 100 requests.
- **Expected:** Use that stated denominator and policy window; do not transfer the example target to another service automatically.
- **Missing-evidence case:** The valid-event denominator, SLO or exception policy is unapproved or unreliable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
