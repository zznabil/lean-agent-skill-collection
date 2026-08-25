---
name: architecture
description: "Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost."
---

# Architecture

1. Define the outcome and only the constraints that can change the design: users, scale, latency, availability, consistency, security, budget, team capability, compatibility, and migration.
2. Inspect the current system, callers, data ownership, interfaces, deployment, tests, incidents, and pain before proposing change.
3. Name the dominant quality attributes. When authority or untrusted data crosses a boundary, map the boundary, protected assets, and realistic abuse cases.
4. Model established domain terms, scenarios, invariants, and ownership. Design small stable interfaces that hide substantial implementation.
5. When one domain action appears through UI, HTTP, CLI, MCP, jobs, or other surfaces, define it once behind typed input, output, policy, and errors. Keep surfaces thin; authorization, validation, idempotency, and observability remain consistent.
6. For a consequential retryable mutation, define `success`, `failure`, and `unknown`; record intent; bind any idempotency key to the exact intent; claim it atomically; retain it across the retry horizon; and reconcile state before retrying an unknown outcome.
7. Use a versioned machine-checkable contract and compatibility tests for stable external interfaces when they reduce ambiguity.
8. Compare the current design, a minimal change, and one credible alternative. Before removing a rule, adapter, dependency, or workaround, establish why it exists and what depends on it.
9. For wide data or interface changes, prefer `expand → backfill or dual-write → switch reads → verify zero old use → contract`. Ship destructive steps last and separately.
10. Define two to four operator questions for critical production paths, then the minimum logs, metrics, traces, and alerts needed to answer them.
11. Record consequential choices as short decision records: context, options, decision, consequences, evidence, and revisit trigger.
12. Run inversion and a pre-mortem. Remove speculative services, layers, abstractions, and dependencies.

Deliver boundaries and data flow, key interfaces, decision table, migration, verification, operations, rollback, risks, and unresolved decisions. Do not refactor unrelated working code for aesthetic uniformity.
