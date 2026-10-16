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
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
