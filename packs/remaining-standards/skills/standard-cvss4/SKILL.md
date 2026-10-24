---
name: standard-cvss4
description: "Score vulnerability severity with a traceable vector."
---
# CVSS

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
- Assign or review a CVSS v4.0 score for a specified vulnerability and context.
- Do not treat severity as exploit probability, complete business risk or an automatic remediation deadline.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local input only. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the vulnerable system, affected behaviour and evidence supporting each metric choice.
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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
