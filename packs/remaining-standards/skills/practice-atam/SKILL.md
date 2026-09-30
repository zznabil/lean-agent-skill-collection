---
name: practice-atam
description: "Expose architectural risks with quality scenarios."
---
# ATAM

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
- Perform an explicitly lightweight ATAM-informed trade-off review within a defined scope.
- Do not present a short solo review as the complete facilitated ATAM method.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb mini form. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Agree on the decision, stakeholders, business drivers, system boundary and review timebox.
2. Present the architecture as understood. Include significant assumptions and architectural approaches.
3. Elicit concrete quality-attribute scenarios. Do not substitute vague goals such as fast or flexible.
4. Prioritise scenarios by stakeholder importance and architectural difficulty or risk.
5. Trace each priority scenario through the architecture. Identify mechanisms that support its required response.
6. Identify sensitivity points: architectural parameters whose changes substantially affect a quality response.
7. Identify trade-off points: choices that affect more than one quality attribute.
8. Record risks, evidence-supported non-risks, unresolved assumptions and broader risk themes as separate categories.
9. Compare realistic alternatives. Record the evidence or experiment needed to resolve high-impact assumptions.
10. Report the lightweight scope, participants and omissions. Do not imply a full ATAM evaluation or certification.

## Verify and recover
- **Worked check (illustrative, not executed):** Increasing a cache lifetime reduces latency but increases stale-data exposure.
- **Expected:** Record a trade-off point, the relevant scenarios and the decision owner. Do not claim that both attributes improved without measurements.
- **If blocked:** If a claimed architectural response depends on an untested assumption, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
