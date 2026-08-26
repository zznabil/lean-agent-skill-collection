---
name: repo-map
description: "Explain or map a repository’s verified architecture, runtime flows, data ownership, interfaces, or recent change using source-linked text and optional diagrams. Use for orientation, not speculative redesign."
---

# Repo Map

Choose **explain** for understanding and **map** for a durable orientation artifact.

1. Define the question the explanation or map must answer and the smallest relevant scope.
2. Inspect entry points, modules, interfaces, data stores, configuration, tests, deployment, and recent changes that affect that scope.
3. Trace at least one real runtime or data flow from input to outcome.
4. Distinguish observed facts, inferred links, and unknowns. Link claims to paths and symbols.
5. For a simple question, stay single-pass. For a broad repository, first create a subsystem or file manifest, then assign disjoint read-only scopes. Prove coverage by count and disclose any capped or unprocessed remainder.
6. Give explorers distinct charters and anti-charters. Verify their digests before synthesis; a missing or failed explorer leaves an explicit gap.
7. Explain how the system works before criticizing it. Route a requested critique to `review` after the explanation is grounded.
8. Draw only diagrams that reduce confusion: context, container/module, sequence, state, data flow, or dependency graph. Parse untrusted workflow or code source statically for a diagram; do not execute it merely to inspect structure.
9. Keep the result current and small. Do not reproduce the whole tree or create a diagram for information a simple list explains better.

**Explain output:** overview, key concepts, how the flow works, where it lives, important gotchas, and evidence gaps.

**Map output:** purpose, system shape, key paths and symbols, runtime flow, ownership boundaries, coverage count, risks, unknowns, and optional diagram source.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
