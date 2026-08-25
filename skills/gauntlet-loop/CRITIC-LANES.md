# Critic lanes

Select only lanes that can change the decision. Give each critic a charter and anti-charter so parallel lanes do not duplicate one another. A finder does not grade its own finding.

Choose the uncertainty bias from asymmetric cost:

- unsupported defect claims are refuted rather than promoted;
- suspected dead code, data, or compatibility behavior defaults to keep when false removal is costly;
- safety or release acceptance defaults to fail or conditional when a false pass can harm users.

For causal investigations, gather facts without a story first, generate genuinely different hypotheses with checkable predictions, then assign one dedicated falsifier per hypothesis. Derive confidence from survivors and missing evidence, not a reviewer’s feeling.

- **Requirements:** real user goal, source-to-requirement traceability, task acceptance, standing Definition of Done, omitted behavior, bad assumptions, scope drift, compatibility, and measurable acceptance.
- **Visual:** real screenshots; reference comparison; hierarchy, spacing, type, contrast, clipping, responsive states, focus, disabled, empty, error, scaling, localization expansion, and applicable WCAG 2.2 AA checks.
- **Interaction and real-user QA:** inspect the running artifact, not source claims. Test clean and stale state; launch, navigate, create, edit, save, reload, reopen, import/export, invalid input, keyboard use, resize, session expiry, interruption, persistence, and recovery. Check console, network, accessibility tree, saved output, and user-visible result. Cover every supported surface named by scope.
- **Automated tests:** unit, integration, end-to-end, regression, contract, property, fuzz, mutation, concurrency, migration, compatibility, load, performance, or security as applicable. Trace requirement → test condition → expected result → actual result → evidence. Distinguish `NOT TESTED`, `FAIL`, and `PASS`.
- **Model and procedure:** for simulators, migration plans, generated transformations, planners, or other internal models, verify replay against recorded and holdout evidence, then execute the derived procedure on the real artifact. Test intermediate invariants and objective discovery; transition accuracy alone is not acceptance.
- **Code correctness:** behavior, control flow, errors, cleanup, types, data flow, dependencies, compatibility, observability, concurrency, testability, and the developer or operator contract: setup, commands, environment variables, ports, feature gates, and migrations.
- **Maintainability/simplification:** canonical ownership, explicit boundaries, special-case growth, duplicated policy, hidden coupling, unnecessary wrappers, dead code, and evidence-backed simplification. A refactor must reduce net complexity rather than move it behind another layer. File size is a signal to inspect, not a hard gate.
- **Security:** trust boundaries, protected assets, abuse cases, authorization, secrets, injection, file safety, dependency ownership and provenance, lockfile and transitive changes, lifecycle scripts, least privilege, and applicable ASVS or AI-system controls.
- **Reliability and operations:** retries, idempotency, success/failure/unknown outcomes, races, data integrity, rollback, recovery, structured logs, correlation, bounded metric labels, tracing, symptom alerts, and cold startup.
- **Performance:** measured latency, throughput, memory, startup, network, or user-experience metrics under comparable conditions. Static review may report `potential impact`, never fabricated values. Check variance, correctness, and whether the change beats the baseline enough to justify its cost.
- **Document/data:** claims, citations, calculations, reproducibility, consistency, caveats, methodology, chart accuracy, audience fit, and misleading certainty. Check both directions: every claim has support and every material source fact is represented or intentionally excluded.
- **Agent/skill/workflow:** trigger and anti-trigger tests, conflicts, missing tools, malformed input, context rollover, prompt injection, tool permission boundaries, sensitive data, state poisoning, benchmark gaming, fabricated evidence, runaway loops, quota exhaustion, unsafe actions, dynamic code execution, automatic updates, resume determinism, failed-child handling, barrier justification, cap disclosure, and untrusted workflow source. Use a concrete AI risk or security baseline when scope warrants it.

Every finding states: lane, benchmark ID, severity, confidence, exact evidence, reproduction, expected result, actual result, affected artifact, impact, smallest repair direction, and blocking status.
