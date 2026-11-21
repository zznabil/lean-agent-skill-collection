---
name: architecture
description: "Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost."
---
# Architecture
Use **ISO/IEC/IEEE 42010** to frame stakeholders, concerns and viewpoints. For consequential quality trade-offs, use a small **ATAM** scenario review. Use **ADR/MADR** to record durable decisions. Use **OpenAPI**, **JSON Schema**, **RFC 9457**, **RFC 9413**, **AsyncAPI** or **CloudEvents** only where the interface requires them.
1. **Decision and constraints.** Name the decision and its next consumer. Record constraints that can change it: users, scale, latency, availability, consistency, security, budget, team capability, compatibility and migration.
2. **Current system.** Inspect callers, data ownership, interfaces, deployment, tests, incidents and observed pain before proposing changes.
3. **Quality and abuse cases.** Select the dominant quality attributes. For consequential trade-offs, record stakeholder, scenario, required response, measure and downside. Map authority and untrusted-data boundaries, protected assets and realistic abuse cases.
4. **Domain model.** Model established domain terms, scenarios, invariants and ownership. Design small, stable interfaces that hide substantial implementation.
5. **Shared action.** When one domain action appears through UI, HTTP, CLI, MCP, jobs or other surfaces, define it once behind typed input, output, policy and errors. Keep surfaces thin. Keep authorization, validation, idempotency and observability consistent.
6. **Unknown mutation outcome.** For a consequential retryable mutation, define `success`, `failure` and `unknown`. Record intent. Bind any idempotency key to the exact intent. Claim it atomically and retain it across the retry horizon. Reconcile state before retrying an unknown outcome.
7. **External contracts.** At external boundaries, accept documented variants, normalize once, reject ambiguity and emit canonical errors. Use problem details for HTTP errors when applicable. Use versioned OpenAPI or JSON Schema, or AsyncAPI or CloudEvents for consequential event contracts.
8. **Alternatives and existing safeguards.** Compare the current design, a minimal change and one credible alternative. Before removing a rule, adapter, dependency or workaround, establish why it exists and what depends on it.
9. **Migration order.** For wide data or interface changes, prefer `expand → backfill or dual-write → switch reads → verify zero old use → contract`. Ship destructive steps last and separately.
10. **Operator questions.** For critical production paths, define two to four operator questions. Then define the minimum logs, metrics, traces and alerts needed to answer them.
11. **Decision record.** Record consequential choices in short decision records. Include context, options, decision, consequences, evidence and a revisit trigger.
12. **Counterexamples and scope.** Run inversion and a pre-mortem. Remove speculative services, layers, abstractions and dependencies.
Deliver the requested design. Include boundaries, data flow, interfaces, choices and trade-offs, migration, verification, operations, rollback, risks and open decisions where they affect use or acceptance. Do not refactor unrelated code for aesthetics.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive or consequential external actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
