---
name: practice-property-based-testing
description: "Generate cases from a meaningful behavioural property."
---
# Property-based testing

## Task and boundary
- Test a specified invariant or relation over a meaningful range of generated inputs.
- Do not use a property that restates the implementation, suppresses failures or filters away the difficult cases.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: No major change. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State a property from the requirement, algebraic relation, independent oracle or metamorphic behaviour.
2. Define the valid input domain and important invalid or boundary cases.
3. Create generators that exercise that domain, including constrained structures and edge values.
4. Use assumptions and filtering sparingly; record when generation discards too many cases.
5. Run with the supported framework and retain reproducibility data for failures.
6. Inspect shrunk counterexamples to understand the smallest failing condition without losing the original context.
7. For stateful systems, model operations, preconditions and invariants across sequences, not just isolated calls.
8. Separate a generator defect from a product defect and verify any independent oracle.
9. Add useful discovered counterexamples to regression coverage when appropriate.
10. Report the property, generated domain, run configuration, failures and limits; random sampling is not a proof over every
    possible input.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A sorting property checks only that output length equals input length.
- **Expected:** Add meaningful order and element-preservation properties; equal length alone does not establish sorting.
- **Missing-evidence case:** The generator excludes the failing boundary or the oracle uses the same flawed algorithm.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
