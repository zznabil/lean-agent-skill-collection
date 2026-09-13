---
name: practice-test-pyramid
description: "Choose test boundaries by risk, speed and fidelity."
---
# Practical test pyramid

## Task and boundary
- Review a test suite or decide where a specific behavioural check belongs.
- Do not enforce a universal unit/integration/end-to-end percentage or replace boundary tests with mocks to fit a shape.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: No major change. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the behaviour, likely defect and cheapest test boundary that can actually observe it.
2. Use focused fast tests for logic that does not require a wider environment.
3. Use integration and contract tests for component interactions and interfaces that isolated tests cannot establish.
4. Keep a justified set of end-to-end tests for critical user journeys and deployment wiring.
5. Avoid redundant coverage that adds maintenance without detecting a different defect.
6. Do not mock the very boundary whose correctness the test is meant to prove.
7. Check that assertions would fail for a representative broken implementation.
8. Track slow, flaky and hard-to-diagnose tests and improve their design rather than simply deleting valuable coverage.
9. Use measured feedback time and escaped defects to guide changes to the mix.
10. Report the rationale and uncovered risks; the pyramid is a design heuristic, not proof that a suite is sufficient.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An API integration test replaces the authorization middleware with a stub that always permits access.
- **Expected:** It cannot establish the real authorization boundary; add or retain a check using the actual enforcement path.
- **Missing-evidence case:** No available test environment can observe the relevant integration behaviour.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
