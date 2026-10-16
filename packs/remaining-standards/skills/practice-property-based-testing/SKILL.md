---
name: practice-property-based-testing
description: "Generate cases from a meaningful behavioural property."
---
# Property-based testing

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution controls
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- For difficult mechanisms, explain from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add a contrast or TL;DR only when helpful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Test the specified invariant or relation across a meaningful range of generated inputs.
- Do not select a property that restates the implementation, suppresses failures or filters out difficult cases.
- Limit work to the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Derive a property from the requirement, algebraic relation, independent oracle or metamorphic behaviour. State that property.
2. Specify the valid input domain and important invalid or boundary cases.
3. Create generators for that domain. Include constrained structures and edge values.
4. Limit assumptions and filtering. Record when generation discards too many cases.
5. Run tests with the supported framework. Keep failure reproducibility data.
6. Inspect shrunk counterexamples. Identify the smallest failing condition and retain the original context.
7. For stateful systems, model operations, preconditions and invariants across sequences. Do not model only isolated calls.
8. Distinguish generator defects from product defects. Verify any independent oracle.
9. When appropriate, add useful discovered counterexamples to regression coverage.
10. Report the property, generated domain, run configuration, failures and limits. Random sampling does not prove the property for every possible input.

## Verify and recover
- **Worked check (illustrative, not executed):** A sorting property checks only that output length equals input length.
- **Expected:** Add meaningful order and element-preservation properties; equal length alone does not establish sorting.
- **If blocked:** If the generator excludes the failing boundary or the oracle uses the same flawed algorithm, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
