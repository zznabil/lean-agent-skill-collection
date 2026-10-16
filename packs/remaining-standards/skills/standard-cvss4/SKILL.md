---
name: standard-cvss4
description: "Score vulnerability severity with a traceable vector."
---
# CVSS

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
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
