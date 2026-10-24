---
name: practice-sre-error-budgets
description: "Use an agreed SLO and error budget for release decisions."
---
# Google SRE SLO and error-budget practice

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Define or apply a service reliability decision with an agreed SLO and error-budget policy.
- Do not invent a universal uptime target. Do not freeze every release because of an unverified alert.
- Limit work to the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the user-visible service, critical journey and reliability decision to support.
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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
