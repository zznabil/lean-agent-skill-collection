---
name: practice-tla-plus
description: "Model a risky state machine and check stated properties."
---
# TLA+

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Use TLA+ for a bounded state, concurrency or protocol question when its risk justifies formal modelling.
- Do not require a formal model for every edit. Do not claim that a finite model proves implementation correctness.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
