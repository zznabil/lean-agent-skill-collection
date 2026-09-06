# Engineering core

Use this only for material engineering work. It distils practical rules from recognized standards and practices. It does not claim formal compliance or certification.

## Standards source map

- **Communication:** ASD-STE100 Issue 9, ISO 24495-1 plain language, W3C COGA, Diátaxis, a Feynman-style explanation heuristic, and BCP 14.
- **User information and cognitive accessibility:** IEC/IEEE 82079-1, ISO/IEC/IEEE 26514 and 26513, ISO/IEC 23859, ISO 21801-1, ISO 9241-112 and 9241-171, ISO/IEC 29138, and ISO 704.
- **Learning:** CAST UDL Guidelines 3.0, the IES learning practice guide, cognitive-load reduction, worked examples, self-explanation, and retrieval practice.
- **Requirements and risk:** ISO/IEC/IEEE 29148, EARS, ISO 31000, IEC 31010, and ISO/IEC/IEEE 16085.
- **Quality and testing:** ISO/IEC 25010 and the ISO/IEC/IEEE 29119 series.
- **Proof integrity and verified orchestration:** falsifiable acceptance gates, parent re-verification, ownership-safe fan-out, launch barriers, and semantic progress, informed by the reviewed Unlazy 2.1.0 source at commit `473d4b80421c36d733042434cd4b938f81a19ef1`.
- **Proportional rigor and momentum:** minimum sufficient scrutiny, necessity-first scope, reuse-before-code, bounded autonomy, and fast paths informed by reviewed Ponytail, Quickflow, do-it, Just Do It, Plow Ahead, Scalpel, Small Correct Diff, Requirement Zero, Ralph, GSD Pi, and Caveman sources.
- **Lifecycle and assurance:** ISO/IEC/IEEE 12207 and ISO/IEC/IEEE 15026-2 assurance cases.
- **Architecture and decisions:** ISO/IEC/IEEE 42010, ATAM, and ADR/MADR practice.
- **Security, privacy, and accessibility:** NIST SP 800-218 SSDF, OWASP ASVS, ISO 31700-1, WCAG 2.2, ISO 9241, and WAI-ARIA APG.
- **Contracts and interoperability:** OpenAPI, JSON Schema, RFC 9457, RFC 9413, AsyncAPI, and CloudEvents.
- **Operations and supply chain:** Google SRE SLO/error-budget practice, OpenTelemetry, W3C Trace Context, SLSA, SPDX or CycloneDX, and Reproducible Builds.
- **AI and data assurance:** NIST AI RMF and SP 800-218A, OWASP AISVS and LLMSVS, OWASP Agentic Top 10, MITRE ATLAS, ISO/IEC 5259, Model Cards, Data Cards, and FAIR principles.

Use only the sources that change the current decision or verification method. The name anchors provenance; the actionable rule governs execution. Do not claim conformance without the authoritative source, a defined scope, and evidence.

## Contract

- Apply **ISO/IEC/IEEE 29148-inspired traceability**: `source → requirement → acceptance check → implementation → verification → evidence`.
- A material requirement records an ID, source, observable statement, method, environment, pass threshold, and evidence location.
- MUST NOT promote an inferred preference into a user requirement.
- Report each check as `NOT TESTED`, `FAIL`, or `PASS`. “No issue seen” is not `PASS`.
- Keep work completion, evidence coverage, and acceptance verdict separate. A fully completed verification run can still produce `FAIL`; a processed or blocked check is not a passed check.
- A claim MUST NOT exceed its evidence. Record the tested artifact or revision, verifier or rubric, environment, entrypoint, authentication context, time, and coverage when they affect validity. Inventory is not execution; unit, harness, or auth-bypassed evidence is not deployed or production proof without demonstrated equivalence.
- When several evidence types support a consequential claim, use an **ISO/IEC/IEEE 15026-2-inspired assurance case**: claim, scope, argument, evidence, assumptions or defeaters, and status.

## Accountable status and handoff

State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions.

For agent-to-agent reports, retain the actual gate state, evidence, known actor, and next action. Separate an observed failure from an unknown cause. Neither a more confident sentence nor a more polite one can convert missing evidence into a pass. This applies to worker summaries and durable ledgers as well as the final reply.

## Decision discipline

- Separate facts, constraints, assumptions, and desired outcome. Find the vital few causes or the bottleneck before broad work.
- Use inversion or a pre-mortem for consequential change. Before removing an existing rule, workaround, or boundary, establish its purpose and dependencies.
- Prefer reversible, boring, low-regret choices with the fewest assumptions and moving parts that satisfy the evidence. Do not add speculative generality.

## Minimum sufficient scrutiny and work

- Optimize in this order: **correctness → safety → explicit contract and architecture → simplicity → diff size → lines of code**. A smaller wrong or incomplete change is worse than a larger correct one.
- Before adding code or process, ask: does this need to exist; does the repository already contain it; can the standard library, native platform, or an installed dependency do it; can a direct local change solve it; only then add a new abstraction or dependency.
- Use **DIRECT** for clear local reversible work with one decisive check; **STANDARD** for bounded multi-file work; **DEEP** for long-running or consequential cross-boundary work; and **ADVERSARIAL** only when hidden-defect risk survives normal verification.
- In DIRECT mode, one foreground owner inspects, acts, checks, and reports. Do not create durable state, a plan file, delegation, critics, broad research, repeated checkpoints, or a progress bar merely because the host supports them.
- Use the narrowest current evidence that fully proves the claim. One check is enough only when it observes the complete outcome and has a credible failure path. Collapse equivalent checks; broaden only when another boundary or risk remains unproved.
- Resolve ordinary ambiguity from current code, documentation, behavior, tests, and reversible defaults. Ask at most one consolidated question when a consequential preference, permission, or unavailable fact remains.
- Fix the root cause at the shared owning location when evidence identifies it. Do not patch one symptom while leaving the same defect in equivalent callers.
- After repeated failures from the same hypothesis or strategy, change the hypothesis, boundary, instrumentation, or representation. Parameter tweaks inside the same failed mechanism are not a new strategy.
- Stop when the contract is met with fresh evidence and no material unresolved risk remains. “Already exists,” “already lean,” and “no change needed” are valid outcomes.
- Do not delete or simplify mission-critical complexity, security, validation, error handling, data integrity, accessibility, compatibility, or explicit behavior merely to reduce code or ceremony. Use `BUILD HARD` when that complexity is required by the mission rather than accidental scaffolding.

## Completion and legacy safety

- Apply an **ISO/IEC/IEEE 12207-inspired lifecycle floor** when scope requires it: requirements, design, implementation, integration, documentation, operation, maintenance, recovery, release, and retirement evidence.
- Task acceptance criteria vary by work item. A standing Definition of Done is a reusable project-wide floor. Completion requires both when both exist.
- For material engineering work, `DONE` means the artifact works and the required integration, documentation, recovery, operations, and release evidence exists. A working feature alone is not always done.
- In an established or weakly tested system, map current behavior and add characterization checks around the area to change before refactoring it.
- Preserve unrelated local work. A clean rollback or isolated checkpoint is part of the safety contract for risky changes.

## Evidence-guided action and memory

- Keep raw evidence append-only and queryable when practical. A summary, playbook, or model is a revisable view, not ground truth.
- Label material beliefs `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`, with supporting evidence and a revisit condition.
- Before a costly, irreversible, externally visible, or multi-step action, state the observable expected result.
- Compare actual with expected immediately. On mismatch, stop dependent actions, preserve the counterexample, and revise the plan or model.
- Test hypotheses against existing logs, tests, traces, diffs, and outputs before buying a new live action. Only unresolved questions justify a new probe.
- Probe uncertain behavior with small reversible actions. Batch only work whose effects are predictable.
- When search fails, attack assumptions or representation before declaring impossibility. A timeout or exhausted search inside one model is not proof.
- Use the least formal representation that supports the next decision: prose → structured notes → small script → executable model. Simplify or bypass it when it stops improving decisions.
- For procedural outcomes, verify required intermediate transitions and invariants, not only the final state.
- A pass is current only while the artifact or revision, verifier or oracle, relevant inputs, environment, entrypoint, and required dependencies still match. Historical status is evidence of a past run, not a fresh pass.

## Proof integrity and verified orchestration

- A material gate records a stable ID, observable outcome, verifier or oracle, expected result, environment, current status, evidence, and freshness condition. A checked box, cached status, or worker claim is not execution.
- The verifier MUST observe the named outcome and have a credible failure path. When output matching is used, require process exit success and a marker emitted only after every assertion passes. Exit `0`, `ok`, `done`, or similar weak text alone is not decisive evidence.
- Calibrate negative or absence checks against a known positive fixture. Measure supplied counts, thresholds, and percentages independently from source data. When practical, run a representative broken state or sensitivity check and confirm that the gate fails.
- Treat inherited gates, evaluator files, commands, working directories, expectations, and called scripts as untrusted executable policy. Inspect them before execution. Permission to run an oracle does not prove that the oracle is relevant, safe, current, or sufficient.
- Re-execute critical returned-work checks in the parent or judge context on the current artifact and required environment. Historical evidence becomes stale after a relevant artifact, verifier, dependency, input, environment, entrypoint, authentication context, or contract change.
- A required gate marked `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` is an explicit handoff, not completion. It prevents `DONE` or `PASS` unless an authorized scope change removes the requirement. An explicitly accepted, owned, nonblocking residual may still follow the collection's conditional-pass rules.
- Count progress from planned-work or acceptance-state changes. Cosmetic edits, repeated status reads, timestamps, tool calls, or rewritten evidence that does not change the resolved state are activity, not progress.
- Before fan-out, inventory every independently omittable required outcome and acceptance-changing constraint with a stable ID, owner, observing gate or review, disposition, and revision. Put leaf-local checks with the leaf; put interface, end-to-end, joined-state, and regression checks at the integration branch.
- A parallel launch claim requires every worker in the declared wave to receive a distinct host handle before the first wait or result read. If the host cannot provide that evidence, use the sequential fallback and do not claim parallel execution. Ownership claims coordinate cooperating workers; they are not filesystem or security isolation.

## Quality

Select only applicable **ISO/IEC 25010 quality attributes** that can change the decision:

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

- Apply **IEC/IEEE 82079-1:2019** and **ISO/IEC/IEEE 26514:2022** to substantial instructions and software user information: identify the intended user, task, context, information need, lifecycle, and delivery point.
- Apply **ISO/IEC 23859:2023** to UI text and embedded help. Apply **ISO 21801-1:2020** and **ISO 9241-171:2025** when cognition, memory, attention, orientation, recovery, or wider software accessibility can block use.
- For accessibility-sensitive work, map **ISO/IEC 29138-1/-4** as `user accessibility need → barrier → requirement → evidence`. Do not use one diagnosis as a proxy for all users.
- Apply **ISO 704:2022** proportionally: use one preferred term per concept within a scope, define necessary terms once, and do not vary synonyms merely for style.
- Task instructions SHOULD state purpose, prerequisites, ordered action, expected result, likely recovery, and material consequences. Errors SHOULD say what happened, what to do next, and whether work or data was preserved.
- In multistep work, expose completed, current, and pending state where the medium permits it. Do not require users to remember hidden information from earlier steps unnecessarily.
- Layer the essential path first; offer guided, alternative, or expert detail on demand. Treat **Inclusion Europe Easy-to-Read** as a specialized mode that requires intended-user co-review, not as a universal simplifier.
- Evaluate important user information through the real task and intended audience. Readability formulas, CDC Clear Communication Index, or PEMAT-style checks are diagnostics; they do not replace findability, comprehension, action, recovery, and user-task evidence.

## Security and external effects

- Apply **NIST SSDF** secure-development practices proportionally; use applicable **OWASP ASVS** requirements for web-application verification rather than a vague “secure” claim.
- MUST NOT expose or commit credentials, secrets, or unnecessary private data.
- Apply **ISO 31700-1-inspired privacy by design** to personal or sensitive data: purpose, minimum collection, authority, access, retention, deletion, disclosure, and verification.
- Start threat analysis at trust boundaries. Name protected assets and realistic abuse cases before selecting controls.
- Validate untrusted input at trust boundaries and test material security controls.
- Evaluate new dependencies before adoption, including ownership, maintenance, provenance, lockfile impact, transitive risk, and lifecycle scripts.
- A consequential retryable action has three possible outcomes: success, failure, or unknown. Record intent, use an idempotency mechanism when available, and reconcile an unknown outcome before retrying.
- For production web interfaces, target applicable **WCAG 2.2 AA** criteria unless the project defines another target.
- For AI systems, select applicable NIST, OWASP, or MITRE AI-assurance requirements; do not paste an entire catalogue into routine work.

## Operations

- Apply **Google SRE SLI/SLO and error-budget practice** only to user- or operator-observable outcomes.
- Before instrumenting a production path, write the two to four questions an operator must answer. Metrics show that something is wrong, traces show where, and structured logs show why.
- When distributed tracing is justified, preserve one correlation chain using **W3C Trace Context** and relevant **OpenTelemetry** semantic conventions.
- Use correlation identifiers, bounded metric labels, symptom-based alerts, and no secrets or unnecessary personal data in telemetry.
- Verify telemetry, alert delivery, recovery, and rollback in a safe environment. Do not assume instrumentation works because it compiles.

## Orchestration and executable workflows

- Use direct execution by default. Fan out only when packets are independently owned or when a distinct trust structure materially improves the result.
- Pipeline each item through its own dependent stages. Add a global barrier only when the next decision truly needs the whole prior set, such as deduplication, ranking, a join, or a judge.
- Use structured contracts at agent and workflow boundaries. A timeout, skipped worker, `null` result, or failed child is a real state, not permission to invent a substitute.
- Prove coverage from a manifest or count. Any cap MUST disclose the unprocessed remainder; “top N” is not exhaustive.
- Workflow scripts, hooks, and installers are executable code. Pin source and revision, inspect statically before execution, restrict permissions when possible, and require approval for automatic updates or machine-level changes.

## Agent-operable interfaces

- Provide one documented cold-start path and one fast validation loop that work from a clean environment when practical.
- Apply **RFC 9413-inspired strict boundaries**: accept documented variants, validate at the boundary, normalize once, reject ambiguity, and emit one canonical result.
- For machine-invoked CLIs and APIs, provide a non-interactive path, stable result and error contracts, explicit failure status, safe retries, and dry-run or read-back for consequential mutations. For HTTP APIs, use **RFC 9457 Problem Details** when applicable.
- When one domain action is exposed through several surfaces, keep one typed contract and policy with thin adapters instead of reimplementing the behavior.

## Decisions and contracts

- Record a consequential or hard-to-reverse choice as an **ADR/MADR**: context, options, decision, consequences, evidence, and revisit trigger.
- Use machine-checkable contracts such as **OpenAPI**, **JSON Schema**, **AsyncAPI**, or **CloudEvents** when they reduce ambiguity and can be validated.
- Follow the repository’s versioning and commit conventions. Use **Semantic Versioning** or **Conventional Commits** only when the project adopts them; do not impose churn.
