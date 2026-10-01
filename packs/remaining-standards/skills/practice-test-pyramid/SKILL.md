---
name: practice-test-pyramid
description: "Choose test boundaries by risk, speed and fidelity."
---
# Practical test pyramid

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root policy loads, it governs this skill; otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits intact.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations. Compare noncompliant and compliant code or configuration when useful.
- These are prose and control patterns, not transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Keep their force unchanged. Identify one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery path.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Review a test suite or select the location for a specific behavioural check.
- Do not enforce a universal unit/integration/end-to-end percentage. Do not replace boundary tests with mocks to fit a shape.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the behaviour, likely defect and cheapest test boundary that can actually observe the defect.
2. Use focused fast tests for logic that needs no wider environment.
3. Use integration and contract tests for component interactions and interfaces that isolated tests cannot establish.
4. Retain a justified set of end-to-end tests for critical user journeys and deployment wiring.
5. Avoid duplicate coverage that adds maintenance but detects no different defect.
6. Do not mock the boundary that the test must prove correct.
7. Check that the assertions would fail for a representative broken implementation.
8. Track slow, flaky and hard-to-diagnose tests. Improve their design instead of simply deleting valuable coverage.
9. Measure feedback time and escaped defects. Use those measurements to guide changes to the test mix.
10. Report the rationale and uncovered risks. The pyramid is a design heuristic; it does not prove that a suite is sufficient.

## Verify and recover
- **Worked check (illustrative, not executed):** An API integration test replaces the authorization middleware with a stub that always permits access.
- **Expected:** It cannot establish the real authorization boundary; add or retain a check using the actual enforcement path.
- **If blocked:** If no available test environment can observe the relevant integration behaviour, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
