---
name: standard-cvss4
description: "Score vulnerability severity with a traceable vector."
---
# CVSS

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
- Assign or review a CVSS v4.0 score for a specified vulnerability and context.
- Do not treat severity as exploit probability, complete business risk or an automatic remediation deadline.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Project-local input only. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the vulnerable system, affected behaviour and evidence supporting each metric choice.
2. Use the official v4.0 definitions; do not import v3.x metric meanings or formulas.
3. Assess Base exploitability and vulnerable/subsequent-system impacts under the defined attack assumptions.
4. Add Threat and Environmental values when the relevant current evidence and deployment context are available.
5. Keep Supplemental metrics separate from the score; they provide additional context rather than silently changing severity.
6. Use a validated official-compatible calculator instead of guessing the score from labels.
7. Publish the vector string with the score and indicate which metric groups were used.
8. Distinguish default/unknown values from observed facts, and record assumptions that could change the result.
9. Recheck the vector when exploitation evidence or deployment controls materially change.
10. Provide FIRST attribution and separate the severity result from the organisation's prioritisation and risk decision.

## Verify and recover
- **Worked check (illustrative, not executed):** A report publishes a numeric CVSS score but omits its vector and metric evidence.
- **Expected:** Request or reconstruct the justified vector before treating the number as reproducible severity evidence.
- **If blocked:** The actual attack prerequisites or impact evidence are insufficient to select a metric. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
