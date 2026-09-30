---
name: standard-cvss4
description: "Score vulnerability severity with a traceable vector."
---
# CVSS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization: separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For normative requirements, preserve force and use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them; they are not default communication drivers.

## Task and boundary
- Assign or review a CVSS v4.0 score for a specified vulnerability and context.
- Do not treat severity as exploit probability, complete business risk or an automatic remediation deadline.
- Work only on the selected artifact or assessment. This routine does not authorize attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local input only. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the vulnerable system and affected behaviour. Identify the evidence that supports each metric choice.
2. Use the official v4.0 definitions. Do not import v3.x metric meanings or formulas.
3. Assess Base exploitability and vulnerable/subsequent-system impacts under the defined attack assumptions.
4. Add Threat and Environmental values when relevant current evidence and deployment context are available.
5. Keep Supplemental metrics separate from the score. They provide additional context; they do not silently change severity.
6. Use a validated official-compatible calculator. Do not guess the score from labels.
7. Publish the vector string with the score. Identify the metric groups used.
8. Distinguish default/unknown values from observed facts. Record assumptions that could change the result.
9. Recheck the vector when exploitation evidence or deployment controls materially change.
10. Provide FIRST attribution. Keep the severity result separate from the organisation's prioritisation and risk decision.

## Verify and recover
- **Worked check (illustrative, not executed):** A report publishes a numeric CVSS score but omits its vector and metric evidence.
- **Expected:** Request or reconstruct the justified vector before treating the number as reproducible severity evidence.
- **If blocked:** If actual attack prerequisites or impact evidence do not support metric selection, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
