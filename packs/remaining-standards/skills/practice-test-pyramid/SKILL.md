---
name: practice-test-pyramid
description: "Choose test boundaries by risk, speed and fidelity."
---
# Practical test pyramid

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Review a test suite or select the location for a specific behavioural check.
- Do not enforce a universal unit/integration/end-to-end percentage. Do not replace boundary tests with mocks to fit a shape.
- Limit work to the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the behaviour, likely defect and cheapest test boundary that can observe it.
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
- **Worked check (illustrative, not executed):** An API integration test replaces the authorisation middleware with a stub that always permits access.
- **Expected:** It cannot establish the real authorisation boundary; add or retain a check using the actual enforcement path.
- **If blocked:** If no available test environment can observe the relevant integration behaviour, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
