---
name: practice-tla-plus
description: "Model a risky state machine and check stated properties."
---
# TLA+

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
- Use TLA+ for a bounded state, concurrency or protocol question whose risk justifies formal modelling.
- Do not require a formal model for every edit or claim that a finite model proves the implementation correct.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A model checks a queue with two workers but the report claims safety for any number of workers.
- **Expected:** Limit the claim to the checked model unless an additional argument or proof establishes the unbounded case.
- **If blocked:** The model does not represent the failure or scheduling behaviour needed for the claim. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
