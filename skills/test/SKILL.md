---
name: test
description: "Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, performance, or agent-trajectory testing."
---

# Test

Apply **ISO/IEC/IEEE 29119-inspired verification traceability**: requirement → test condition → expected result → actual result → evidence. Use **TDD** and the practical **test pyramid** proportionally; escalate from invariants and state tables to property/state-machine tests or **TLA+** only when state-space risk justifies it. Seek minimum sufficient evidence: the fewest non-redundant checks that fully observe the claim and its material failure paths.

## Choose the signal

1. Discover the repository’s actual test framework, commands, fixtures, and conventions before adding another stack.
2. Start from an observable requirement and the cheapest boundary that proves it: unit for local logic, integration for real boundaries, and end-to-end only for critical journeys. One decisive check is enough when it proves the whole claim; collapse equivalent checks instead of collecting ceremonial green output.
3. In a weakly tested established area, write characterization tests before refactoring behavior.
4. For a bug, first make a regression test fail for the reported behavior when practical.
5. Every critical requirement MUST have a verification method. Every meaningful fixed defect SHOULD gain regression coverage when practical. Do not add a framework, fixture layer, or broad suite for a tiny change unless the current repository and risk justify it. Public contracts, shared state, persistence, concurrency, authentication, security, migration, compatibility, and release boundaries normally require broader evidence. For state-heavy or concurrent behavior, escalate only as needed: invariant → state table → property or state-machine test → formal model.

## Red–green–refactor

1. Write one failing test and confirm the expected red signal.
2. Make the smallest change that passes.
3. Refactor only while the test stays green.
4. For a load-bearing guard, prove sensitivity when practical: remove or reverse the fix, confirm failure, restore it, then confirm pass.
5. Run adjacent and full relevant suites before completion. Do not rerun an unchanged test under unchanged conditions and expect new information.

## Calibrate the verifier

- Make the verifier read the artifact, service, or measurement named by the requirement. A command that merely prints its own expected token is not proof.
- When matching output, require a zero exit and a success-only marker printed after every assertion passes. Weak words such as `ok`, `done`, or `pass` are insufficient when failure output can contain them too.
- Before trusting a negative or absence check, run the same logic against a known positive fixture and confirm that it detects the positive case. A missing file, wrong path, empty input, or malformed pattern can otherwise look like valid absence.
- Calculate supplied numbers from source data. Do not copy a requested count or threshold into the expected output and call agreement a measurement.
- For a load-bearing verifier, test sensitivity with a representative broken implementation or reversed condition when practical. If the verifier still passes, repair the verifier before using it as acceptance evidence.
- Treat stored status and earlier evidence as historical. Re-run after the tested artifact, verifier, relevant inputs, dependency, environment, entrypoint, or required toolchain changes.

## Evidence and quality

Record requirement, condition, environment, expected result, actual result, evidence, and `NOT TESTED`, `FAIL`, or `PASS`. A result becomes stale after a relevant artifact, revision, input, verifier, dependency, or environment change; rerun before treating it as a current pass.

- Assert outcomes, not private implementation details.
- Do not mock away the behavior under test. Use fakes only at slow or unsafe boundaries. A snapshot, “does not throw” assertion, or fully mocked test is insufficient when it would still pass under a representative broken implementation.
- Control time, randomness, network, and shared state. Keep fixtures small and readable.
- Add boundary, invalid-input, failure, retry, cancellation, persistence, and concurrency cases according to risk.
- Keep end-to-end suites small, deterministic, and clean-state capable.
- Browser or desktop regression tests SHOULD use stable semantic locators and preserve the visible expected result.
- For agentic systems with traces, evaluate three scopes when useful: end outcome or task completion; trajectory, plan, and step efficiency; and individual tool choice and arguments. Prefer deterministic checks. For model-scored metrics, record evaluator model, rubric, threshold, dataset revision, randomness, repetitions, variance, visible or holdout class, and cost.
- MUST NOT delete a difficult test, weaken an assertion, or report partial execution as a full pass without an explicit reason.

Output strategy, traceability, changed files, commands, actual results, uncovered risk, and flaky or unavailable environment.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
