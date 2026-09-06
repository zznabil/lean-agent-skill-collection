---
name: architecture
description: "Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost."
---

# Architecture

Use **ISO/IEC/IEEE 42010** to frame stakeholders, concerns, and viewpoints; a small **ATAM** scenario review for consequential quality trade-offs; and **ADR/MADR** for durable decisions. Use **OpenAPI**, **JSON Schema**, **RFC 9457**, **RFC 9413**, **AsyncAPI**, or **CloudEvents** only where the interface requires them.

1. Define the outcome and only the constraints that can change the design: users, scale, latency, availability, consistency, security, budget, team capability, compatibility, and migration.
2. Inspect the current system, callers, data ownership, interfaces, deployment, tests, incidents, and pain before proposing change.
3. Name the dominant quality attributes. For a consequential trade-off, record stakeholder, scenario, required response, measure, and what worsens. When authority or untrusted data crosses a boundary, map the boundary, protected assets, and realistic abuse cases.
4. Model established domain terms, scenarios, invariants, and ownership. Design small stable interfaces that hide substantial implementation.
5. When one domain action appears through UI, HTTP, CLI, MCP, jobs, or other surfaces, define it once behind typed input, output, policy, and errors. Keep surfaces thin; authorization, validation, idempotency, and observability remain consistent.
6. For a consequential retryable mutation, define `success`, `failure`, and `unknown`; record intent; bind any idempotency key to the exact intent; claim it atomically; retain it across the retry horizon; and reconcile state before retrying an unknown outcome.
7. At external boundaries, accept documented variants, normalize once, reject ambiguity, and emit canonical errors. Use problem details for HTTP errors when applicable; use versioned OpenAPI or JSON Schema, or AsyncAPI or CloudEvents for consequential event contracts.
8. Compare the current design, a minimal change, and one credible alternative. Before removing a rule, adapter, dependency, or workaround, establish why it exists and what depends on it.
9. For wide data or interface changes, prefer `expand → backfill or dual-write → switch reads → verify zero old use → contract`. Ship destructive steps last and separately.
10. Define two to four operator questions for critical production paths, then the minimum logs, metrics, traces, and alerts needed to answer them.
11. Record consequential choices as short decision records: context, options, decision, consequences, evidence, and revisit trigger.
12. Run inversion and a pre-mortem. Remove speculative services, layers, abstractions, and dependencies.

Deliver boundaries and data flow, key interfaces, decision table, migration, verification, operations, rollback, risks, and unresolved decisions. Do not refactor unrelated working code for aesthetic uniformity.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
