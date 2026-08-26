---
name: test
description: "Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, performance, or agent-trajectory testing."
---

# Test

## Choose the signal

1. Discover the repository’s actual test framework, commands, fixtures, and conventions before adding another stack.
2. Start from an observable requirement and the cheapest boundary that proves it: unit for local logic, integration for real boundaries, and end-to-end only for critical journeys.
3. In a weakly tested established area, write characterization tests before refactoring behavior.
4. For a bug, first make a regression test fail for the reported behavior when practical.
5. Every critical requirement MUST have a verification method. Every meaningful fixed defect SHOULD gain regression coverage when practical. For state-heavy or concurrent behavior, escalate only as needed: invariant → state table → property or state-machine test → formal model.

## Red–green–refactor

1. Write one failing test and confirm the expected red signal.
2. Make the smallest change that passes.
3. Refactor only while the test stays green.
4. For a load-bearing guard, prove sensitivity when practical: remove or reverse the fix, confirm failure, restore it, then confirm pass.
5. Run adjacent and full relevant suites before completion. Do not rerun an unchanged test under unchanged conditions and expect new information.

## Evidence and quality

Record requirement, condition, environment, expected result, actual result, evidence, and `NOT TESTED`, `FAIL`, or `PASS`.

- Assert outcomes, not private implementation details.
- Do not mock away the behavior under test. Use fakes only at slow or unsafe boundaries. A snapshot, “does not throw” assertion, or fully mocked test is insufficient when it would still pass under a representative broken implementation.
- Control time, randomness, network, and shared state. Keep fixtures small and readable.
- Add boundary, invalid-input, failure, retry, cancellation, persistence, and concurrency cases according to risk.
- Keep end-to-end suites small, deterministic, and clean-state capable.
- Browser or desktop regression tests SHOULD use stable semantic locators and preserve the visible expected result.
- For agentic systems with traces, evaluate three scopes when useful: end outcome or task completion; trajectory, plan, and step efficiency; and individual tool choice and arguments. Prefer deterministic checks. For model-scored metrics, record evaluator model, rubric, threshold, dataset revision, randomness, repetitions, variance, visible or holdout class, and cost.
- MUST NOT delete a difficult test, weaken an assertion, or report partial execution as a full pass without an explicit reason.

Output strategy, traceability, changed files, commands, actual results, uncovered risk, and flaky or unavailable environment.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
