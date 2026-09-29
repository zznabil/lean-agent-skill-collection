---
name: standard-iso-5259
description: "Manage data quality for a specified analytics use."
---
# ISO/IEC 5259 series

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
- Apply the relevant ISO/IEC 5259 part to data used by analytics or machine learning.
- Do not infer that a link to one part supplies every normative requirement of the series.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the dataset, version, intended analytical use, users and consequences of poor data quality.
2. Select the applicable 5259 parts and editions; record which full sources are actually available.
3. Identify data-quality needs across acquisition, preparation, labelling, use, maintenance and change.
4. Map each need to a measurable criterion, owner and evidence source appropriate to the use case.
5. Examine representativeness, provenance, missingness, consistency and transformations where they affect the analytical result.
6. Separate source data, labels, derived features and evaluation partitions so quality findings can be traced.
7. Record data-quality problems, corrective actions and their effects on downstream models or decisions.
8. Validate improvements with the selected measures rather than assuming that more data is better data.
9. Preserve unresolved limitations and trigger reassessment after material dataset or intended-use changes.
10. Use licensed part-specific requirements for formal assessment; the historical register URL points to Part 4, not the whole
    series.

## Verify and recover
- **Worked check (illustrative, not executed):** A model's aggregate accuracy improves after adding data from only the dominant user group.
- **Expected:** Assess use-specific representation and subgroup effects instead of inferring that overall data quality improved.
- **If blocked:** The relevant series part, dataset provenance or evaluation partition is missing. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
