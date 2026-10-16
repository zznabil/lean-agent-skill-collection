---
name: practice-tla-plus
description: "Model a risky state machine and check stated properties."
---
# TLA+

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
- Use TLA+ for a bounded state, concurrency or protocol question when its risk justifies formal modelling.
- Do not require a formal model for every edit. Do not claim that a finite model proves implementation correctness.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local escalation. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the specific uncertainty in states, transitions, concurrency, recovery or protocol interaction.
2. Define the abstraction boundary. State which real-system behaviour the model intentionally omits.
3. Specify state variables, initial states and permitted next-state transitions.
4. State safety invariants separately from liveness requirements and fairness assumptions.
5. Use the project's supported TLA+ tools. Declare constants, bounds and the model-checking configuration.
6. Run the checker. Inspect complete counterexample traces, not only the last state.
7. Distinguish model errors from implementation defects. Compare the abstraction with the real contract.
8. After changing a model, rerun affected properties. Retain the model/configuration revision and tool result.
9. Convert useful findings into implementation requirements and tests. Verify the implementation separately.
10. Report checked properties, finite bounds, assumptions, omitted behaviour and remaining proof obligations.

## Verify and recover
- **Worked check (illustrative, not executed):** A model checks a queue with two workers but the report claims safety for any number of workers.
- **Expected:** Restrict the claim to the checked model unless an additional argument or proof establishes the unbounded case.
- **If blocked:** If the model omits failure or scheduling behaviour needed for the claim, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone cannot prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
