---
name: practice-chaos-engineering
description: "Test one resilience hypothesis within authorised limits."
---
# Principles of Chaos Engineering

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
- Design or conduct a bounded resilience experiment with explicit permission and recovery controls.
- Do not inject faults into production or third-party systems merely because the principles discuss real-world conditions.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A proposed database-failure experiment has no tested recovery path.
- **Expected:** Do not inject the fault; complete safe preparation and resolve recovery and authority first.
- **If blocked:** The experiment cannot observe the steady-state measure or safely abort. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
