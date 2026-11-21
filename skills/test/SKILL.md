---
name: test
description: "Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, performance, or agent-trajectory testing."
---
# Test
For testing tasks, apply **ISO/IEC/IEEE 29119-inspired verification traceability**: requirement → test condition → expected result → actual result → evidence.
- Use **TDD** and the practical **test pyramid** in proportion to the task. Escalate from invariants and state tables to property/state-machine tests or **TLA+** only when state-space risk justifies it.
- Seek minimum sufficient evidence. Use the fewest non-redundant checks that fully observe the claim and its material failure paths.
## Choose the signal
1. Inspect the repository's test framework, commands, fixtures and conventions before adding a stack.
2. Start with an observable requirement. Choose the cheapest proving boundary: unit for local logic, integration for real boundaries, end-to-end for critical journeys.
   - Use one decisive check when it proves the whole claim. Combine equivalent checks; extra green output is not extra evidence.
3. Characterise weakly tested established behaviour before refactoring.
4. Where practical, first reproduce a bug with a failing regression test.
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
Keep the requirement, condition, environment, expected and actual result, evidence, and `NOT TESTED`, `FAIL`, or `PASS` available. Use context and tool output unless acceptance, collaboration or recovery needs a record. Rerun before claiming a current pass after relevant artifact, revision, input, verifier, dependency or environment changes.
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
Report the result, decisive checks and material gaps, including flaky or unavailable environments. Add strategy, traceability, changed paths or replay commands when needed or requested.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive or consequential external actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; keep evidenced progress separate from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
