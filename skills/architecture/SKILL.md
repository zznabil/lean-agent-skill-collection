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
Deliver boundaries and data flow, key interfaces, a decision table, migration, verification, operations, rollback, risks and unresolved decisions. Do not refactor unrelated working code for aesthetic uniformity.
## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use the architecture frameworks above only for their stated tasks.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Do not claim formal standards conformance from stylistic guidance.
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not turn advice into mandates.
- Before risky or failure-prone work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when useful.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
