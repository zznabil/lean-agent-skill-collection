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
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
