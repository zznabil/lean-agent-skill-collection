---
name: practice-test-pyramid
description: "Choose test boundaries by risk, speed and fidelity."
---
# Practical test pyramid

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
- Review a test suite or decide where a specific behavioural check belongs.
- Do not enforce a universal unit/integration/end-to-end percentage or replace boundary tests with mocks to fit a shape.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** An API integration test replaces the authorization middleware with a stub that always permits access.
- **Expected:** It cannot establish the real authorization boundary; add or retain a check using the actual enforcement path.
- **If blocked:** No available test environment can observe the relevant integration behaviour. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
