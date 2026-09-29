---
name: practice-sre-error-budgets
description: "Use an agreed SLO and error budget for release decisions."
---
# Google SRE SLO and error-budget practice

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
- Define or apply a service reliability decision using an agreed SLO and error-budget policy.
- Do not invent a universal uptime target or freeze every release from an unverified alert.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** For 100,000 valid requests and a 99.9% success SLO, the allowed bad-event budget is 100 requests.
- **Expected:** Use that stated denominator and policy window; do not transfer the example target to another service automatically.
- **If blocked:** The valid-event denominator, SLO or exception policy is unapproved or unreliable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
