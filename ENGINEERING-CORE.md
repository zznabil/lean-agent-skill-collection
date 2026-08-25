# Engineering core

Use this only for material engineering work. It distills practical rules from recognized standards. It does not claim formal compliance or certification.

## Contract

- Trace each material need through: `source → requirement → acceptance check → implementation → verification → evidence`.
- A material requirement records an ID, source, observable statement, method, environment, pass threshold, and evidence location.
- MUST NOT promote an inferred preference into a user requirement.
- Report each check as `NOT TESTED`, `FAIL`, or `PASS`. “No issue seen” is not `PASS`.

## Completion and legacy safety

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

## Quality

Select only attributes that can change the decision:

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

- MUST NOT expose or commit credentials, secrets, or unnecessary private data.
- Start threat analysis at trust boundaries. Name protected assets and realistic abuse cases before selecting controls.
- Validate untrusted input at trust boundaries and test material security controls.
- Evaluate new dependencies before adoption, including ownership, maintenance, provenance, lockfile impact, transitive risk, and lifecycle scripts.
- A consequential retryable action has three possible outcomes: success, failure, or unknown. Record intent, use an idempotency mechanism when available, and reconcile an unknown outcome before retrying.
- For web applications, use concrete application-security requirements, such as applicable ASVS controls, instead of a generic “secure” claim.
- For production web interfaces, target applicable WCAG 2.2 AA criteria unless the project defines another target.
- For AI systems, test prompt injection, tool permissions, sensitive data, output validation, durable-state poisoning, fabricated evidence, and false completion when relevant.

## Operations

- Before instrumenting a production path, write the two to four questions an operator must answer. Metrics show that something is wrong, traces show where, and structured logs show why.
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
- For machine-invoked CLIs and APIs, provide a non-interactive path, stable result and error contracts, explicit failure status, safe retry behavior, and a dry-run or read-back mechanism for consequential mutations when practical.
- When one domain action is exposed through several surfaces, keep one typed contract and policy with thin adapters instead of reimplementing the behavior.

## Decisions and contracts

- Record a consequential or hard-to-reverse choice as a short ADR: context, options, decision, consequences, evidence, and revisit trigger.
- Use machine-checkable interface contracts, such as OpenAPI or JSON Schema, when they reduce ambiguity and can be validated.
- Follow the repository’s versioning and commit conventions. Use SemVer or Conventional Commits only when the project adopts them; do not impose churn.

## Sources distilled

ASD-STE100 is enforced by `wait-what`. Requirement strength follows BCP 14 semantics. The remaining rules are inspired by ISO/IEC/IEEE 29148, ISO/IEC 25010, ISO/IEC/IEEE 29119, ISO/IEC/IEEE 12207, NIST SSDF, OWASP ASVS, WCAG, ADR practice, OpenAPI, JSON Schema, SemVer, Conventional Commits, NIST AI RMF, and OWASP LLMSVS.
