---
name: practice-gqm
description: "Derive useful measurements from a goal and questions."
---
# Goal–Question–Metric

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These three principles are the default communication drivers, not formal standards conformance or transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, put warnings before hazards and hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Design a measurement plan for a defined engineering improvement or decision.
- Do not collect convenient metrics first and then invent a goal.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the study object, purpose, quality focus, viewpoint and operating context.
2. Derive questions from the goal. Their answers must be able to change the engineering decision.
3. For each question, select the smallest set of measures that can answer it.
4. Define each measure's unit, denominator, collection method, observation window and source.
5. Before collecting data, specify how to interpret results. Record confounders and how to handle missing data.
6. Trace each metric to a question and each question to the goal. Remove measures that have no decision use.
7. When comparing a baseline and candidate, keep their conditions comparable.
8. Validate collection with known examples. Check that the data pipeline can detect a relevant change.
9. Interpret results in context and report uncertainty. Do not treat a proxy metric as the goal itself.
10. Record the decision and whether you need new questions or measures.

## Verify and recover
- **Worked check (illustrative, not executed):** The goal is easier onboarding, but the only proposed metric is documentation word count.
- **Expected:** Ask whether users complete onboarding and where they need help; measure those outcomes rather than assuming fewer
  words is better.
- **If blocked:** If the measurement has no valid denominator or does not observe the question, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result within the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim that this routine proves formal conformance or improves model behaviour.
