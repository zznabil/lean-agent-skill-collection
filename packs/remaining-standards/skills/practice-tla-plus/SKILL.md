---
name: practice-tla-plus
description: "Model a risky state machine and check stated properties."
---
# TLA+

## Task and boundary
- Use TLA+ for a bounded state, concurrency or protocol question whose risk justifies formal modelling.
- Do not require a formal model for every edit or claim that a finite model proves the implementation correct.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local escalation. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the specific uncertainty: states, transitions, concurrency, recovery or protocol interaction.
2. Define the abstraction boundary and what real-system behaviour the model intentionally omits.
3. Specify state variables, initial states and allowed next-state transitions.
4. State safety invariants separately from liveness requirements and any fairness assumptions.
5. Use the project's supported TLA+ tools and declare constants, bounds and model-checking configuration.
6. Run the checker and inspect complete counterexample traces rather than only the last state.
7. Distinguish a model error from an implementation defect; compare the abstraction with the real contract.
8. After a model change, rerun affected properties and retain the model/configuration revision and tool result.
9. Translate useful findings into implementation requirements and tests, then verify the implementation separately.
10. Report checked properties, finite bounds, assumptions, omitted behaviour and remaining proof obligations.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A model checks a queue with two workers but the report claims safety for any number of workers.
- **Expected:** Limit the claim to the checked model unless an additional argument or proof establishes the unbounded case.
- **Missing-evidence case:** The model does not represent the failure or scheduling behaviour needed for the claim.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
