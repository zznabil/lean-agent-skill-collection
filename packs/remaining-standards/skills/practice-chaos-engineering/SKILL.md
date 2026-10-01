---
name: practice-chaos-engineering
description: "Test one resilience hypothesis within authorised limits."
---
# Principles of Chaos Engineering

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Put the main point first and use familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate procedures, reference and explanation when useful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These patterns do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them.

## Execution controls
- When stating normative requirements, retain BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY with unchanged force. Specify one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- When explaining difficult mechanisms, start from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Design or run a resilience experiment within defined limits. Require explicit permission and recovery controls.
- The principles discuss real-world conditions. That discussion does not permit fault injection into production or third-party systems.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Before making a source-specific finding, check the relevant source sections. This routine cannot replace missing requirements or prove conformance.
- Historical adoption decision: Project-local reliability technique. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Define user-visible steady-state behaviour. Use measurements that represent the actual service.
2. Define a falsifiable hypothesis for how a specified disturbance will change that behaviour.
3. Specify the environment, authorised fault, exposure limits, timebox and affected dependencies.
4. Before the experiment starts, define abort conditions and establish a tested recovery path.
5. Select a control or baseline that separates the disturbance's effect from unrelated variation.
6. Begin with the smallest blast radius that can answer the question. Each broader trial needs its own justification and permission.
7. Monitor the defined measures during the experiment. Stop when an abort condition occurs.
8. Before declaring the experiment finished, verify recovery and check for delayed or residual effects.
9. Record the actual results, confounders, unmet assumptions and corrective actions.
10. Do not claim general resilience from one successful scenario. Do not leave temporary fault machinery active.

## Verify and recover
- **Worked check (illustrative, not executed):** A proposed database-failure experiment has no tested recovery path.
- **Expected:** Do not inject the fault; complete safe preparation and resolve recovery and authority first.
- **If blocked:** If the experiment cannot observe the steady-state measure or safely abort, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Do not treat missing or stale evidence as a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Select the smallest check that can detect the relevant defect. A schema, linter or inventory alone cannot prove task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Perform one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
