---
name: practice-gqm
description: "Derive useful measurements from a goal and questions."
---
# Goal–Question–Metric

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
- Design a measurement plan for a defined engineering improvement or decision.
- Do not collect convenient metrics first and invent a goal afterwards.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the object to study, purpose, quality focus, viewpoint and operating context.
2. Convert the goal into questions whose answers could change the engineering decision.
3. For each question, identify the smallest set of measures that can answer it.
4. Define each measure's unit, denominator, collection method, observation window and source.
5. Specify how results will be interpreted before collecting data; record confounders and missing-data handling.
6. Trace every metric to a question and every question to the goal. Remove orphan measures that have no decision use.
7. Keep baseline and candidate conditions comparable where a comparison is intended.
8. Validate collection using known examples; check that the data pipeline can detect a relevant change.
9. Interpret results in their context and report uncertainty; do not confuse a proxy metric with the goal itself.
10. Record the resulting decision and whether new questions or measures are needed.

## Verify and recover
- **Worked check (illustrative, not executed):** The goal is easier onboarding, but the only proposed metric is documentation word count.
- **Expected:** Ask whether users complete onboarding and where they need help; measure those outcomes rather than assuming fewer
  words is better.
- **If blocked:** The measurement has no valid denominator or does not observe the question. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
