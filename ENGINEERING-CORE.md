# Engineering core

Use this only for material engineering work. It distils practical rules from recognized standards and practices. It does not claim formal compliance or certification.

## Standards source map

- **Communication:** ASD-STE100, ISO 24495-1 plain language, W3C COGA, Diátaxis, the Feynman method, and BCP 14.
- **Requirements and risk:** ISO/IEC/IEEE 29148, EARS, ISO 31000, IEC 31010, and ISO/IEC/IEEE 16085.
- **Quality and testing:** ISO/IEC 25010 and the ISO/IEC/IEEE 29119 series.
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

## Decision discipline

- Separate facts, constraints, assumptions, and desired outcome. Find the vital few causes or the bottleneck before broad work.
- Use inversion or a pre-mortem for consequential change. Before removing an existing rule, workaround, or boundary, establish its purpose and dependencies.
- Prefer reversible, boring, low-regret choices with the fewest assumptions and moving parts that satisfy the evidence. Do not add speculative generality.

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
