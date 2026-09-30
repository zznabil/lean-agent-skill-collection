# Engineering core

Use this core only for material engineering work. It draws practical rules from recognized standards and practices. It does not claim formal compliance or certification.

## Communication kernel

If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Use ASD-STE100-inspired short, active technical sentences. Use ISO 704-inspired stable concepts and terms. Use Diátaxis purpose separation when it helps: separate tutorials, how-to instructions, reference, and explanation. These are inspired practices, not formal standards conformance. Do not claim that root instructions are active without evidence. Other frameworks govern only their task-specific routines; they are not default communication drivers.

## Standards source map

- **Communication:** use the three-part kernel above. Keep BCP 14 normative force and NASA-style verifiable requirements in requirement procedures. Keep safety, recovery, Feynman, and SEI CERT patterns conditional on the task. ISO 24495-1 and W3C COGA govern scoped user-information and accessibility routines, not ordinary prose.
- **User information and cognitive accessibility:** IEC/IEEE 82079-1, ISO/IEC/IEEE 26514 and 26513, ISO/IEC 23859, ISO 21801-1, ISO 9241-112 and 9241-171, ISO/IEC 29138, and ISO 704.
- **Learning:** CAST UDL Guidelines 3.0, the IES learning practice guide, cognitive-load reduction, worked examples, self-explanation, and retrieval practice.
- **Requirements and risk:** ISO/IEC/IEEE 29148, EARS, ISO 31000, IEC 31010, and ISO/IEC/IEEE 16085.
- **Quality and testing:** ISO/IEC 25010 and the ISO/IEC/IEEE 29119 series.
- **Proof integrity and verified orchestration:** use falsifiable acceptance gates, parent re-verification, ownership-safe fan-out, launch barriers, and semantic progress. These practices draw on the reviewed Unlazy 2.1.0 source at commit `473d4b80421c36d733042434cd4b938f81a19ef1`.
- **Proportional rigor and momentum:** use minimum sufficient scrutiny, necessity-first scope, reuse-before-code, bounded autonomy, and fast paths. These practices draw on reviewed Ponytail, Quickflow, do-it, Just Do It, Plow Ahead, Scalpel, Small Correct Diff, Requirement Zero, Ralph, GSD Pi, and Caveman sources.
- **Lifecycle and assurance:** ISO/IEC/IEEE 12207 and ISO/IEC/IEEE 15026-2 assurance cases.
- **Architecture and decisions:** ISO/IEC/IEEE 42010, ATAM, and ADR/MADR practice.
- **Security, privacy, and accessibility:** NIST SP 800-218 SSDF, OWASP ASVS, ISO 31700-1, WCAG 2.2, ISO 9241, and WAI-ARIA APG.
- **Contracts and interoperability:** OpenAPI, JSON Schema, RFC 9457, RFC 9413, AsyncAPI, and CloudEvents.
- **Operations and supply chain:** Google SRE SLO/error-budget practice, OpenTelemetry, W3C Trace Context, SLSA, SPDX or CycloneDX, and Reproducible Builds.
- **AI and data assurance:** NIST AI RMF and SP 800-218A, OWASP AISVS and LLMSVS, OWASP Agentic Top 10, MITRE ATLAS, ISO/IEC 5259, Model Cards, Data Cards, and FAIR principles.

Use only sources that change the current decision or verification method. Source names identify provenance. Actionable rules govern execution. Do not claim conformance without the authoritative source, a defined scope, and evidence.

## Contract

- Apply **ISO/IEC/IEEE 29148-inspired traceability**: `source → requirement → acceptance check → implementation → verification → evidence`.
- For each material requirement, record an ID, source, observable statement, method, environment, pass threshold, and evidence location.
- MUST NOT turn an inferred preference into a user requirement.
- Report each check as `NOT TESTED`, `FAIL`, or `PASS`. “No issue seen” is not `PASS`.
- Separate work completion, evidence coverage, and acceptance verdict. A complete verification run can produce `FAIL`. Processing or blocking a check does not make it pass.
- A claim MUST NOT exceed its evidence.
  - Record the tested artifact or revision, verifier or rubric, environment, entrypoint, authentication context, time, and coverage when they affect validity.
  - Inventory does not prove execution. Unit, harness, or auth-bypassed evidence does not prove deployed or production behavior unless demonstrated equivalence supports that claim.
- When several evidence types support a consequential claim, use an **ISO/IEC/IEEE 15026-2-inspired assurance case**. Include the claim, scope, argument, evidence, assumptions or defeaters, and status.

## Accountable status and handoff

State supported conclusions directly. Do not use litotes or rhetorical hedging that hides status or responsibility.

- Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and the requested artifact voice.
- Own actual agent errors. Do not invent blame. Give the correction or next action within existing permissions.

For agent-to-agent reports, retain the actual gate state, evidence, known actor, and next action.

- Separate an observed failure from an unknown cause.
- Confidence or politeness cannot turn missing evidence into a pass.
- Apply these rules to worker summaries, durable ledgers, and the final reply.

## Decision discipline

- Separate facts, constraints, assumptions, and the desired outcome. Before broad work, find the vital few causes or the bottleneck.
- Use inversion or a pre-mortem for consequential change. Before removing an existing rule, workaround, or boundary, establish its purpose and dependencies.
- Prefer reversible, boring, low-regret choices. Use the fewest assumptions and moving parts that satisfy the evidence. Do not add speculative generality.

## Minimum sufficient scrutiny and work

- Optimize in this order: **correctness → safety → explicit contract and architecture → simplicity → diff size → lines of code**. Prefer a larger correct change to a smaller wrong or incomplete change.
- Before adding code or process, ask these questions in order: does this need to exist; does the repository already contain it; can the standard library, native platform, or an installed dependency do it; can a direct local change solve it? Only then add a new abstraction or dependency.
- Use **DIRECT** for clear, local, reversible work with one decisive check. Use **STANDARD** for bounded multi-file work. Use **DEEP** for long-running or consequential cross-boundary work. Use **ADVERSARIAL** only when hidden-defect risk remains after normal verification.
- In DIRECT mode, one foreground owner inspects, acts, checks, and reports. Do not create durable state, a plan file, delegation, critics, broad research, repeated checkpoints, or a progress bar merely because the host supports them.
- Use the narrowest current evidence that fully proves the claim. One check is sufficient only if it observes the complete outcome and has a credible failure path. Combine equivalent checks. Broaden checks only when another boundary or risk remains unproved.
- Resolve ordinary ambiguity from current code, documentation, behavior, tests, and reversible defaults. Ask at most one consolidated question when a consequential preference, permission, or unavailable fact remains unresolved.
- When evidence identifies a root cause, fix it at the shared owning location. Do not fix one symptom while leaving the same defect in equivalent callers.
- After repeated failures from the same hypothesis or strategy, change the hypothesis, boundary, instrumentation, or representation. Parameter changes within the same failed mechanism do not form a new strategy.
- Stop when fresh evidence shows that the contract is met and no material unresolved risk remains. “Already exists,” “already lean,” and “no change needed” are valid outcomes.
- Do not delete or simplify mission-critical complexity, security, validation, error handling, data integrity, accessibility, compatibility, or explicit behavior merely to reduce code or ceremony. Use `BUILD HARD` when the mission requires that complexity and it is not accidental scaffolding.

## Completion and legacy safety

- Apply an **ISO/IEC/IEEE 12207-inspired lifecycle floor** when the scope requires it. Include requirements, design, implementation, integration, documentation, operation, maintenance, recovery, release, and retirement evidence.
- Task acceptance criteria vary by work item. A standing Definition of Done sets a reusable project-wide floor. Completion requires both when both exist.
- For material engineering work, `DONE` means that the artifact works and the required integration, documentation, recovery, operations, and release evidence exists. A working feature alone does not always meet completion requirements.
- Before refactoring an established or weakly tested system, map current behavior and add characterization checks around the area to change.
- Preserve unrelated local work. For risky changes, include a clean rollback or isolated checkpoint in the safety contract.

## Evidence-guided action and memory

- When practical, keep raw evidence append-only and queryable. Treat a summary, playbook, or model as a revisable view, not ground truth.
- Label material beliefs `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`. Include supporting evidence and a revisit condition.
- Before a costly, irreversible, externally visible, or multi-step action, state the observable expected result.
- Immediately compare the actual result with the expected result. If they differ, stop dependent actions, preserve the counterexample, and revise the plan or model.
- Test hypotheses against existing logs, tests, traces, diffs, and outputs before taking a new live action. Only unresolved questions justify a new probe.
- Probe uncertain behavior with small, reversible actions. Batch only work with predictable effects.
- When search fails, challenge assumptions or the representation before declaring impossibility. A timeout or exhausted search within one model is not proof.
- Use the least formal representation that supports the next decision: prose → structured notes → small script → executable model. Simplify or bypass the representation when it no longer improves decisions.
- For procedural outcomes, verify required intermediate transitions and invariants as well as the final state.
- A pass remains current only while the artifact or revision, verifier or oracle, relevant inputs, environment, entrypoint, and required dependencies still match. Historical status proves a past run, not a fresh pass.

## Proof integrity and verified orchestration

- For each material gate, record a stable ID, observable outcome, verifier or oracle, expected result, environment, current status, evidence, and freshness condition. A checked box, cached status, or worker claim does not prove execution.
- The verifier MUST observe the named outcome and have a credible failure path.
  - When matching output, require process exit success and a marker that the process emits only after every assertion passes.
  - Exit `0`, `ok`, `done`, or similar weak text alone is not decisive evidence.
- Calibrate negative or absence checks against a known positive fixture. Independently measure supplied counts, thresholds, and percentages from source data. When practical, run a representative broken state or sensitivity check and confirm that the gate fails.
- Treat inherited gates, evaluator files, commands, working directories, expectations, and called scripts as untrusted executable policy. Inspect them before execution. Permission to run an oracle does not prove its relevance, safety, currency, or sufficiency.
- Re-execute critical returned-work checks in the parent or judge context. Use the current artifact and required environment. Historical evidence becomes stale after a relevant change to the artifact, verifier, dependency, input, environment, entrypoint, authentication context, or contract.
- A required gate marked `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` records an explicit handoff, not completion. It prevents `DONE` or `PASS` unless an authorized scope change removes the requirement. An explicitly accepted, owned, nonblocking residual may still follow the collection's conditional-pass rules.
- Measure progress from changes to planned work or acceptance state. Cosmetic edits, repeated status reads, timestamps, tool calls, and rewritten evidence that does not change the resolved state show activity, not progress.
- Before fan-out, inventory every independently omittable required outcome and acceptance-changing constraint. Give each a stable ID, owner, observing gate or review, disposition, and revision. Place leaf-local checks with the leaf. Place interface, end-to-end, joined-state, and regression checks at the integration branch.
- To claim a parallel launch, every worker in the declared wave must receive a distinct host handle before the first wait or result read.
  - If the host cannot provide that evidence, use the sequential fallback. Do not claim parallel execution.
  - Ownership claims coordinate cooperating workers. They do not provide filesystem or security isolation.

## Quality

Select only **ISO/IEC 25010 quality attributes** that apply and can change the decision:

- functional correctness;
- performance efficiency;
- compatibility;
- interaction, usability, and accessibility;
- reliability;
- security;
- maintainability;
- portability;
- safety.

Hard gates MUST pass before soft polish can produce acceptance.

## Human-usable information and cognitive accessibility

- Apply **IEC/IEEE 82079-1:2019** and **ISO/IEC/IEEE 26514:2022** to substantial instructions and software user information. Identify the intended user, task, context, information need, lifecycle, and delivery point.
- Apply **ISO/IEC 23859:2023** to UI text and embedded help. Apply **ISO 21801-1:2020** and **ISO 9241-171:2025** when cognition, memory, attention, orientation, recovery, or wider software accessibility can block use.
- For accessibility-sensitive work, map **ISO/IEC 29138-1/-4** as `user accessibility need → barrier → requirement → evidence`. Do not use one diagnosis as a proxy for all users.
- Apply **ISO 704:2022** proportionally. Use one preferred term per concept within a scope. Define necessary terms once. Do not vary synonyms merely for style.
- Task instructions SHOULD state purpose, prerequisites, ordered action, expected result, likely recovery, and material consequences. Errors SHOULD state what happened, what to do next, and whether work or data was preserved.
- In multistep work, show completed, current, and pending state where the medium permits it. Do not unnecessarily require users to remember hidden information from earlier steps.
- Present the essential path first. Offer guided, alternative, or expert detail on demand. Use **Inclusion Europe Easy-to-Read** only as a specialized mode with intended-user co-review, not as a universal simplifier.
- Evaluate important user information through the real task and intended audience. Readability formulas, CDC Clear Communication Index, and PEMAT-style checks provide diagnostics. They do not replace evidence of findability, comprehension, action, recovery, and user-task performance.

## Security and external effects

- Apply **NIST SSDF** secure-development practices proportionally. For web-application verification, use applicable **OWASP ASVS** requirements instead of a vague “secure” claim.
- MUST NOT expose or commit credentials, secrets, or unnecessary private data.
- Apply **ISO 31700-1-inspired privacy by design** to personal or sensitive data. Address purpose, minimum collection, authority, access, retention, deletion, disclosure, and verification.
- Start threat analysis at trust boundaries. Name protected assets and realistic abuse cases before selecting controls.
- Validate untrusted input at trust boundaries. Test material security controls.
- Before adopting new dependencies, evaluate ownership, maintenance, provenance, lockfile impact, transitive risk, and lifecycle scripts.
- A consequential retryable action has three possible outcomes: success, failure, or unknown. Record intent. Use an idempotency mechanism when available. Reconcile an unknown outcome before retrying.
- For production web interfaces, target applicable **WCAG 2.2 AA** criteria unless the project defines another target.
- For AI systems, select applicable NIST, OWASP, or MITRE AI-assurance requirements. Do not copy an entire catalogue into routine work.

## Operations

- Apply **Google SRE SLI/SLO and error-budget practice** only to user- or operator-observable outcomes.
- Before instrumenting a production path, write the two to four questions an operator must answer. Metrics show that something is wrong. Traces show where. Structured logs show why.
- When distributed tracing is justified, preserve one correlation chain. Use **W3C Trace Context** and relevant **OpenTelemetry** semantic conventions.
- Use correlation identifiers, bounded metric labels, and symptom-based alerts. Do not include secrets or unnecessary personal data in telemetry.
- Verify telemetry, alert delivery, recovery, and rollback in a safe environment. Compilation does not prove that instrumentation works.

## Orchestration and executable workflows

- Use direct execution by default. Fan out only when packets have independent owners or a distinct trust structure materially improves the result.
- Send each item through its own dependent stages. Add a global barrier only when the next decision needs the whole prior set, such as for deduplication, ranking, a join, or a judge.
- Use structured contracts at agent and workflow boundaries. Treat a timeout, skipped worker, `null` result, or failed child as a real state. These states do not permit an invented substitute.
- Prove coverage from a manifest or count. Any cap MUST disclose the unprocessed remainder. “top N” is not exhaustive.
- Treat workflow scripts, hooks, and installers as executable code. Pin the source and revision. Inspect the code statically before execution. Restrict permissions when possible. Require approval for automatic updates or machine-level changes.

## Agent-operable interfaces

- When practical, provide one documented cold-start path and one fast validation loop that work from a clean environment.
- Apply **RFC 9413-inspired strict boundaries**. Accept documented variants, validate at the boundary, normalize once, reject ambiguity, and emit one canonical result.
- For machine-invoked CLIs and APIs, provide a non-interactive path, stable result and error contracts, explicit failure status, safe retries, and dry-run or read-back for consequential mutations. For HTTP APIs, use **RFC 9457 Problem Details** when applicable.
- When several surfaces expose one domain action, keep one typed contract and policy. Use thin adapters rather than separate behavior implementations.

## Decisions and contracts

- Record a consequential or hard-to-reverse choice as an **ADR/MADR**. Include context, options, decision, consequences, evidence, and revisit trigger.
- Use machine-checkable contracts such as **OpenAPI**, **JSON Schema**, **AsyncAPI**, or **CloudEvents** when they reduce ambiguity and can be validated.
- Follow the repository's versioning and commit conventions. Use **Semantic Versioning** or **Conventional Commits** only when the project adopts them. Do not impose churn.

## Rewrite engineering instructions without changing requirements

When editing this doctrine or a task procedure, keep the affected boundary, required action, failure response, and verification together. When words such as "material", "relevant" or "appropriate" could change an obligation, identify the affected requirement or risk from the task and source. Preserve project-defined thresholds. If the source does not settle the boundary, record the uncertainty. Do not invent a universal threshold.

When simplifying an explanation, preserve the exact source and condition of each requirement. A list of standards does not replace the operational rules below. A shorter sentence does not weaken an obligation or create permission.
