---
name: standard-iso-5259
description: "Manage data quality for a specified analytics use."
---
# ISO/IEC 5259 series

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Do not claim root activation without evidence. Without that root policy, you MUST apply this kernel; skill-specific rules refine it.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations.
- These are communication patterns, not formal standards conformance or transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep each requirement's force, actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Contrast noncompliant and compliant code or configuration when useful. Report observed results. Missing or stale evidence is not success.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Apply the relevant ISO/IEC 5259 part to data for analytics or machine learning.
- Do not infer that a link to one part supplies every normative requirement of the series.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- The collection did not obtain the full licensed text. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the dataset, version, intended analytical use, users and consequences of poor data quality.
2. Select the applicable 5259 parts and editions. Record which full sources are actually available.
3. Identify data-quality needs across acquisition, preparation, labelling, use, maintenance and change.
4. Map each need to a measurable criterion, owner and evidence source appropriate to the use case.
5. Examine representativeness, provenance, missingness, consistency and transformations where they affect the analytical result.
6. Keep source data, labels, derived features and evaluation partitions separate. Make quality findings traceable.
7. Record data-quality problems, corrective actions and their effects on downstream models or decisions.
8. Validate improvements with the selected measures. Do not assume that more data is better data.
9. Preserve unresolved limitations. Trigger reassessment after material dataset or intended-use changes.
10. Use licensed part-specific requirements for formal assessment. The historical register URL points to Part 4, not the whole series.

## Verify and recover
- **Worked check (illustrative, not executed):** A model's aggregate accuracy improves after adding data from only the dominant user group.
- **Expected:** Assess use-specific representation and subgroup effects. Do not infer that overall data quality improved.
- **If blocked:** If the relevant series part, dataset provenance or evaluation partition is missing, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
