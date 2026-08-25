# Program-scale orchestration

Use this only when the task has several meaningful stages or genuinely independent packets and coordination costs less than sequential work. Stay direct when the task is small, tightly coupled, or proved by one check.

## Modes

- **Direct:** one bounded task, no orchestration artifacts unless they add evidence.
- **Staged:** several dependent phases executed sequentially with durable state and explicit checkpoints.
- **Delegated:** independent packets use native agents or a trusted workflow runtime; the parent keeps the critical path, integration, and final verification.

## Roles

- **Coordinator:** owns goal, contract, coverage, budget, state, assignments, barriers, and stop rules.
- **Worker:** owns one bounded packet and its local evidence. It does not approve the integrated result.
- **Verifier:** read-only and criterion-specific. It tries to falsify the packet claim.
- **Integrator:** owns merge order, conflicts, regression checks, and the final artifact. This MAY be the coordinator.

## Protocol

1. Discover serially before decomposition. Inspect scope, interfaces, data shape, likely overlap, and the parent critical path.
2. Choose the smallest contract: `none` for a trivial packet, `inline` for ordinary separate scopes, or `full` only for shared public surfaces, migrations, auth, data contracts, or overlapping writers. If no consumer, surface, check, deliverable, or blocker can be named, keep it inline or skip it.
3. Write a shallow manifest: packet ID, charter, anti-charter, exact scope, input, structured output, owner, dependencies, shared surfaces, acceptance check, verification tier, and integration point. Prove that the manifest covers the target with no gap, duplicate, or hidden remainder.
4. Give one owner to every shared file or coupled subsystem. Use disjoint files or modules before paying for worktree isolation; use isolation when overlapping edits are inherent.
5. Make briefs self-contained. Workers MUST NOT coordinate through hidden shared state, overwrite siblings, or spawn nested coordinator trees. A handoff includes status, changed artifacts, structured result, evidence, assumptions, risks, confidence, and next dependency.
6. Pipeline an item through its own dependent stages. Add a global barrier only when the next step truly needs all prior results, such as cross-item deduplication, ranking, a join, a convergence decision, or a judge.
7. Give parallel workers distinct charters and anti-charters. Identical prompts with different labels are decorative fan-out.
8. Treat worker success as a claim. `null`, timeout, skipped work, failed child, or stale output remains an explicit failure state; never synthesize the missing result from expectation.
9. Verify each packet before integration. Choose the uncertainty bias from asymmetric cost: preserve code or data when false deletion is costly; block or condition acceptance when a false pass can harm users; reject an unsupported defect claim rather than promoting it as fact.
10. Carry only concise verified findings forward. Use `verified`, `single-source`, or `unverified` labels and retain dissent when it can change the decision.
11. Use bounded waves. A normal delegated run SHOULD start with two to four useful sidecars and MUST NOT exceed five without explicit approval. Reserve a material share of budget for verification and integration. Disclose every cap and unprocessed remainder.
12. If every item in a wave fails for the same reason, abort the wave and fix the shared contract, environment, or instructions. Extend only when the previous wave added verified progress.
13. Prefer host-native delegation or a declarative DAG. Imperative workflow scripts are executable code: pin source and revision, inspect statically before running, disable unattended updates, restrict tools or sandbox when possible, and never execute untrusted workflow source merely to inspect or diagram it.
14. Reject or rebase stale work after the baseline, contract, or owned files change. Integrate in dependency order, run affected checks after each merge, then run the full required verifier.
15. When the host lacks safe delegation, execute the same manifest sequentially. Do not claim parallel or background execution, and do not require a provider SDK, hosted service, or API key.
