---
name: standard-iso-25024
description: "Define reproducible measures for a data-quality claim."
---
# ISO/IEC 25024 data quality measures

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If it loads, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- Use other domain standards only when the task requires them. These execution rules do not transfer legal or organisational authority from other frameworks.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Specify or review data-quality measurements for a named dataset and use.
- Do not present an undefined quality score or sampling estimate as a complete population measurement.
- Limit work to the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Retain this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. State the data-quality characteristic, decision and dataset boundary to measure.
2. Select a measure from the authorised source. Otherwise, clearly label the measure as project-defined.
3. Define the measured entities, numerator, denominator, units, sampling and collection method.
4. Identify the data-quality measure elements. Explain how they combine into the reported result.
5. Record missing, invalid and excluded observations. Do not silently omit them.
6. Test the measurement with known good and defective examples.
7. Calculate independently when a supplied figure determines acceptance.
8. Assess sampling error and sensitivity to definitions or reference data.
9. Compare results only if measure definitions and population boundaries are compatible.
10. Report actual values, uncertainty and limitations. Use the full licensed standard before calling the measure ISO-conformant.

## Verify and recover
- **Worked check (illustrative, not executed):** A data-quality score divides valid rows by only the rows that could be parsed.
- **Expected:** Show parse failures in the denominator or exclusions. Prevent a misleading completeness claim.
- **If blocked:** If the population, denominator or valid-observation definition is unspecified, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, supporting evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
