---
name: test
description: "Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, or performance testing."
---

# Test

## Choose the signal

1. Discover the repository’s actual test framework, commands, fixtures, and conventions before adding another stack.
2. Start from an observable requirement and the cheapest boundary that proves it: unit for local logic, integration for real boundaries, and end-to-end only for critical journeys.
3. In a weakly tested established area, write characterization tests before refactoring behavior.
4. For a bug, first make a regression test fail for the reported behavior when practical.
5. Every critical requirement MUST have a verification method. Every meaningful fixed defect SHOULD gain regression coverage when practical.

## Red–green–refactor

1. Write one failing test and confirm the expected red signal.
2. Make the smallest change that passes.
3. Refactor only while the test stays green.
4. For a load-bearing guard, prove sensitivity when practical: remove or reverse the fix, confirm failure, restore it, then confirm pass.
5. Run adjacent and full relevant suites before completion. Do not rerun an unchanged test under unchanged conditions and expect new information.

## Evidence and quality

Record requirement, condition, environment, expected result, actual result, evidence, and `NOT TESTED`, `FAIL`, or `PASS`.

- Assert outcomes, not private implementation details.
- Do not mock away the behavior under test. Use fakes only at slow or unsafe boundaries.
- Control time, randomness, network, and shared state. Keep fixtures small and readable.
- Add boundary, invalid-input, failure, retry, cancellation, persistence, and concurrency cases according to risk.
- Keep end-to-end suites small, deterministic, and clean-state capable.
- Browser or desktop regression tests SHOULD use stable semantic locators and preserve the visible expected result.
- MUST NOT delete a difficult test, weaken an assertion, or report partial execution as a full pass without an explicit reason.

Output strategy, traceability, changed files, commands, actual results, uncovered risk, and flaky or unavailable environment.
