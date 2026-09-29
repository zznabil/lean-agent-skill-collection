---
name: architecture
description: "Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost."
---

# Architecture

Use **ISO/IEC/IEEE 42010** to frame stakeholders, concerns, and viewpoints; a small **ATAM** scenario review for consequential quality trade-offs; and **ADR/MADR** for durable decisions. Use **OpenAPI**, **JSON Schema**, **RFC 9457**, **RFC 9413**, **AsyncAPI**, or **CloudEvents** only where the interface requires them.

1. **Outcome and constraints.** State the design decision and its next consumer first. Name only constraints that can change it: users, scale, latency, availability, consistency, security, budget, team capability, compatibility, and migration.
2. **Current system.** Inspect the current system, callers, data ownership, interfaces, deployment, tests, incidents, and pain before proposing change.
3. **Quality and abuse cases.** Name the dominant quality attributes. For a consequential trade-off, record stakeholder, scenario, required response, measure, and what worsens. When authority or untrusted data crosses a boundary, map the boundary, protected assets, and realistic abuse cases.
4. **Domain model.** Model established domain terms, scenarios, invariants, and ownership. Design small stable interfaces that hide substantial implementation.
5. **Shared action.** When one domain action appears through UI, HTTP, CLI, MCP, jobs, or other surfaces, define it once behind typed input, output, policy, and errors. Keep surfaces thin; authorization, validation, idempotency, and observability remain consistent.
6. **Unknown mutation outcome.** For a consequential retryable mutation, define `success`, `failure`, and `unknown`; record intent; bind any idempotency key to the exact intent; claim it atomically; retain it across the retry horizon; and reconcile state before retrying an unknown outcome.
7. **External contracts.** At external boundaries, accept documented variants, normalize once, reject ambiguity, and emit canonical errors. Use problem details for HTTP errors when applicable; use versioned OpenAPI or JSON Schema, or AsyncAPI or CloudEvents for consequential event contracts.
8. **Alternatives and existing safeguards.** Compare the current design, a minimal change, and one credible alternative. Before removing a rule, adapter, dependency, or workaround, establish why it exists and what depends on it.
9. **Migration order.** For wide data or interface changes, prefer `expand → backfill or dual-write → switch reads → verify zero old use → contract`. Ship destructive steps last and separately.
10. **Operator questions.** Define two to four operator questions for critical production paths, then the minimum logs, metrics, traces, and alerts needed to answer them.
11. **Decision record.** Record consequential choices as short decision records: context, options, decision, consequences, evidence, and revisit trigger.
12. **Counterexamples and scope.** Run inversion and a pre-mortem. Remove speculative services, layers, abstractions, and dependencies.

Deliver boundaries and data flow, key interfaces, decision table, migration, verification, operations, rollback, risks, and unresolved decisions. Do not refactor unrelated working code for aesthetic uniformity.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
