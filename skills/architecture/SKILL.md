---
name: architecture
description: "Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost."
---
# Architecture
Use **ISO/IEC/IEEE 42010** to frame stakeholders, concerns and viewpoints. For consequential quality trade-offs, use a small **ATAM** scenario review. Use **ADR/MADR** to record durable decisions. Use **OpenAPI**, **JSON Schema**, **RFC 9457**, **RFC 9413**, **AsyncAPI** or **CloudEvents** only where the interface requires them.
1. **Outcome and constraints.** First state the design decision and its next consumer. Name only constraints that can change the decision: users, scale, latency, availability, consistency, security, budget, team capability, compatibility and migration.
2. **Current system.** Before proposing a change, inspect the current system, callers, data ownership, interfaces, deployment, tests, incidents and pain points.
3. **Quality and abuse cases.** Name the dominant quality attributes. For a consequential trade-off, record the stakeholder, scenario, required response, measure and what worsens. When authority or untrusted data crosses a boundary, map that boundary, protected assets and realistic abuse cases.
4. **Domain model.** Model established domain terms, scenarios, invariants and ownership. Design small, stable interfaces that hide substantial implementation.
5. **Shared action.** When one domain action appears through UI, HTTP, CLI, MCP, jobs or other surfaces, define it once behind typed input, output, policy and errors. Keep surfaces thin. Keep authorization, validation, idempotency and observability consistent.
6. **Unknown mutation outcome.** For a consequential retryable mutation, define `success`, `failure` and `unknown`. Record intent. Bind any idempotency key to the exact intent. Claim it atomically and retain it across the retry horizon. Reconcile state before retrying an unknown outcome.
7. **External contracts.** At external boundaries, accept documented variants, normalize once, reject ambiguity and emit canonical errors. Use problem details for HTTP errors when applicable. Use versioned OpenAPI or JSON Schema, or AsyncAPI or CloudEvents for consequential event contracts.
8. **Alternatives and existing safeguards.** Compare the current design, a minimal change and one credible alternative. Before removing a rule, adapter, dependency or workaround, establish why it exists and what depends on it.
9. **Migration order.** For wide data or interface changes, prefer `expand → backfill or dual-write → switch reads → verify zero old use → contract`. Ship destructive steps last and separately.
10. **Operator questions.** For critical production paths, define two to four operator questions. Then define the minimum logs, metrics, traces and alerts needed to answer them.
11. **Decision record.** Record consequential choices in short decision records. Include context, options, decision, consequences, evidence and a revisit trigger.
12. **Counterexamples and scope.** Run inversion and a pre-mortem. Remove speculative services, layers, abstractions and dependencies.
Deliver boundaries and data flow, key interfaces, a decision table, migration, verification, operations, rollback, risks and unresolved decisions. Do not refactor unrelated working code for aesthetic uniformity.
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use the architecture frameworks above only for their stated tasks.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Do not claim formal standards conformance from stylistic guidance.
- Lead with the supported result, next action or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty and remaining user action. Do not report routine tool narration or praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. Own actual agent errors and provide a correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice and machine or artifact formats.
- Use BCP 14 only for normative force. For important requirements, name one actor, one action and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, put a warning before the action. Add a hold point and a safe-state check where needed. Then state the expected result, failure sign and recovery. Explain difficult mechanisms simply. Contrast noncompliant and compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show a truthful named 20-cell ASCII progress bar from processed items. Round the percentage down and keep progress separate from the verdict. Otherwise, report the phase and evidence without a bar. Processed does not mean passed.
- Avoid surprise scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
