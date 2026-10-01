---
name: standard-iso-20741
description: "Evaluate a tool against a real engineering need."
---
# ISO/IEC 20741 tool evaluation

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first in familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. For normative requirements, state one actor, one action and an observable verification target.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not formal standards conformance.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Do not change requirement force.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When mechanisms are difficult, explain them from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules confer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.

## Task and boundary
- Compare or select software engineering tools for a defined project need.
- Do not select a tool from popularity, a feature checklist or one favourable demo alone.
- Limit work to the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check the source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb one rule. Retain this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the engineering task, users, environment, constraints and mandatory capabilities.
2. Separate mandatory selection criteria from desirable features and preferences.
3. Include the current tool or no-new-tool option if it can meet the need.
4. Select representative project tasks and data for a small, reproducible trial.
5. Record installation, integration, interoperability, maintainability and support constraints that affect use.
6. Test failures and recovery, not just the successful demonstration.
7. Compare outcome quality, user effort, recurring cost and migration consequences under comparable conditions.
8. Record missing evidence and vendor claims that the trial did not verify.
9. Base any tool recommendation only on the stated criteria. Include limitations and a revisit trigger.
10. Use the full licensed edition for a formal evaluation process. This routine retains Lean's evidence-before-adoption principle.

## Verify and recover
- **Worked check (illustrative, not executed):** A benchmark winner cannot process the project's actual file format.
- **Expected:** Treat the missing mandatory format as decisive. Do not offset it with unrelated benchmark points.
- **If blocked:** If a mandatory integration or representative task cannot be tested, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
