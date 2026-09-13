---
name: practice-chaos-engineering
description: "Test one resilience hypothesis within authorised limits."
---
# Principles of Chaos Engineering

## Task and boundary
- Design or conduct a bounded resilience experiment with explicit permission and recovery controls.
- Do not inject faults into production or third-party systems merely because the principles discuss real-world conditions.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local reliability technique. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. State the user-visible steady-state behaviour using measurements that represent the actual service.
2. Form a falsifiable hypothesis about how that behaviour will change under a specified disturbance.
3. Identify the environment, authorised fault, exposure limits, timebox and affected dependencies.
4. Set abort conditions and a tested recovery path before beginning the experiment.
5. Use a control or baseline that can distinguish the effect of the disturbance from unrelated variation.
6. Start with the smallest blast radius that can answer the question; broader trials require their own justification and permission.
7. Observe the defined measures during the experiment and stop when an abort condition occurs.
8. Verify recovery and check for delayed or residual effects before declaring the experiment finished.
9. Record actual results, confounders, unmet assumptions and corrective actions.
10. Do not turn a successful scenario into a claim of general resilience or leave temporary fault machinery active.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A proposed database-failure experiment has no tested recovery path.
- **Expected:** Do not inject the fault; complete safe preparation and resolve recovery and authority first.
- **Missing-evidence case:** The experiment cannot observe the steady-state measure or safely abort.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
