---
name: test
description: "Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, performance, or agent-trajectory testing."
---
# Test
For testing tasks, apply **ISO/IEC/IEEE 29119-inspired verification traceability**: requirement → test condition → expected result → actual result → evidence.
- Use **TDD** and the practical **test pyramid** in proportion to the task. Escalate from invariants and state tables to property/state-machine tests or **TLA+** only when state-space risk justifies it.
- Seek minimum sufficient evidence. Use the fewest non-redundant checks that fully observe the claim and its material failure paths.
## Choose the signal
1. Find the repository’s actual test framework, commands, fixtures, and conventions before you add another stack.
2. Start with an observable requirement. Choose the cheapest boundary that proves it: unit for local logic, integration for real boundaries, and end-to-end only for critical journeys.
   - Use one decisive check when it proves the whole claim. Combine equivalent checks instead of collecting green output that adds no evidence.
3. In an established area with weak test coverage, write characterization tests before you refactor behavior.
4. For a bug, first make a regression test fail for the reported behavior when practical.
5. Every critical requirement MUST have a verification method.
   - Every meaningful fixed defect SHOULD gain regression coverage when practical.
   - Do not add a framework, fixture layer, or broad suite for a tiny change unless the current repository and risk justify it.
   - Public contracts, shared state, persistence, concurrency, authentication, security, migration, compatibility, and release boundaries normally need broader evidence.
   - For state-heavy or concurrent behavior, escalate only as needed: invariant → state table → property or state-machine test → formal model.
## Red–green–refactor
1. Write one failing test. Confirm the expected red signal.
2. Make the smallest change that passes.
3. Refactor only while the test stays green.
4. For a guard that the result depends on, prove sensitivity when practical. Remove or reverse the fix, confirm failure, restore the fix, then confirm pass.
5. Run adjacent and full relevant suites before completion. Do not rerun an unchanged test under unchanged conditions and expect new information.
## Calibrate the verifier
- Make the verifier read the artifact, service, or measurement that the requirement names. State the expected result and failure sign. If you cannot observe the result, report the evidence gap rather than a pass. A command that only prints its own expected token is not proof.
- When you match output, require a zero exit and a success-only marker printed after every assertion passes. Weak words such as `ok`, `done`, or `pass` are insufficient when failure output can also contain them.
- Before you trust a negative or absence check, run the same logic against a known positive fixture. Confirm that it detects the positive case. A missing file, wrong path, empty input, or malformed pattern can otherwise appear to prove absence.
- Calculate supplied numbers from source data. Do not copy a requested count or threshold into the expected output and call the agreement a measurement.
- For a verifier that acceptance depends on, test sensitivity with a representative broken implementation or reversed condition when practical. If the verifier still passes, repair it before you use it as acceptance evidence.
- Treat stored status and earlier evidence as historical. Rerun after the tested artifact, verifier, relevant inputs, dependency, environment, entrypoint, or required toolchain changes.
## Evidence and quality
Record the requirement, condition, environment, expected result, actual result, evidence, and `NOT TESTED`, `FAIL`, or `PASS`. A relevant artifact, revision, input, verifier, dependency, or environment change makes a result stale. Rerun before you treat it as a current pass.
- Assert outcomes, not private implementation details.
- Do not mock away the behavior under test. Use fakes only at slow or unsafe boundaries. A snapshot, “does not throw” assertion, or fully mocked test is insufficient if it would still pass under a representative broken implementation.
- Control time, randomness, network, and shared state. Keep fixtures small and readable.
- Add boundary, invalid-input, failure, retry, cancellation, persistence, and concurrency cases according to risk.
- Keep end-to-end suites small and deterministic. Make them capable of running from a clean state.
- Browser or desktop regression tests SHOULD use stable semantic locators and preserve the visible expected result.
- For agentic systems with traces, evaluate three scopes when useful: end outcome or task completion; trajectory, plan, and step efficiency; and individual tool choice and arguments.
  - Prefer deterministic checks.
  - For model-scored metrics, record evaluator model, rubric, threshold, dataset revision, randomness, repetitions, variance, visible or holdout class, and cost.
- MUST NOT delete a difficult test, weaken an assertion, or report partial execution as a full pass without an explicit reason.
Report the strategy, traceability, changed files, commands, actual results, uncovered risk, and any flaky or unavailable environment.
## Communication kernel
- If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use ASD-STE100-inspired short active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are style guides, not a claim of formal standards conformance.
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not replay routine tool steps or add routine praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. Own actual agent errors and state the correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
- Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Add a hold point and a safe-state check where needed. State the expected result, failure sign, and recovery. When a mechanism is difficult, explain it simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress based on processed items. Round down and keep progress separate from the verdict. Otherwise, report phase and evidence without a bar. Processed does not mean passed.
- Avoid surprise scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
