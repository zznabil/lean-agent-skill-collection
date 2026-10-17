---
name: practice-chaos-engineering
description: "Test one resilience hypothesis within authorised limits."
---
# Principles of Chaos Engineering

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
- Design or run a resilience experiment within defined limits. Require explicit permission and recovery controls.
- The principles discuss real-world conditions. That discussion does not permit fault injection into production or third-party systems.
- Limit work to the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
