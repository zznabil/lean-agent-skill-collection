# Program-scale orchestration

Use this only when the task has several meaningful stages or genuinely independent packets and coordination costs less than sequential work. Stay direct when the task is small, tightly coupled, or proved by one check.

## Modes

- **Direct:** one bounded task, no orchestration artifacts unless they add evidence.
- **Staged:** several dependent phases executed sequentially with durable state and explicit checkpoints.
- **Delegated:** independent packets use native agents or a trusted workflow runtime; the parent keeps the critical path, integration, and final verification.

## Roles

- **Coordinator:** owns goal, revisioned contract inventory, coverage, budget, state, assignments, launch waves, barriers, and stop rules.
- **Worker:** owns one bounded packet and its local evidence. It does not approve the integrated result.
- **Verifier:** read-only and criterion-specific. It re-executes or independently inspects instead of trusting stored status.
- **Integrator:** owns merge order, conflicts, branch-level checks, regressions, and the final artifact. This MAY be the coordinator.

## States and contract inventory

Use leaf states `WAITING`, `READY`, `IN-FLIGHT`, `VERIFIED`, or `ABANDONED`. Use branch states `OPEN`, `VERIFIED`, or `ABANDONED`. A returned worker is still `IN-FLIGHT` until parent re-verification and required manual review pass. `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` are visible handoff states, not completion.

Before fan-out, inventory every independently omittable required outcome and every acceptance-changing constraint. Give each a stable ID, current revision, owner, observing gate or manual review, and disposition. Reread the current request before fan-out and root completion; reconcile amendments rather than silently dropping earlier requirements.

## Protocol

1. Discover serially before decomposition. Inspect scope, interfaces, data shape, likely overlap, current verifier commands, and the parent critical path.
2. Place checks where their evidence lives. A leaf gate reads only that leaf's owned artifact. Interface compatibility, end-to-end behavior, joined-state invariants, and cross-leaf regressions belong in the branch or integration gate and run once there.
3. Choose the smallest contract: `none` for a trivial packet, `inline` for ordinary separate scopes, or `full` only for shared public surfaces, migrations, auth, data contracts, or overlapping writers. If no consumer, surface, check, deliverable, or blocker can be named, keep it inline or skip it.
4. Write one shallow manifest: qualified packet ID, charter, anti-charter, exact scope, owned paths, input, structured output, owner, dependencies, shared surfaces, local gate, integration gate, verification tier, and integration point. Prove that the manifest and contract inventory cover the target with no gap, duplicate, or hidden remainder.
5. Give one owner to every shared file or coupled subsystem. Before concurrent launch, verify one complete and disjoint owned-path set per packet and record its exclusive ownership claim. If overlap is inherent, use one sequential owner or actual isolation. A claim coordinates cooperating workers; it is not a filesystem or security sandbox.
6. Make briefs self-contained. Workers MUST NOT coordinate through hidden shared state, overwrite siblings, or spawn nested coordinator trees. A handoff includes status, changed artifacts, structured result, verifier command, evidence, assumptions, risks, confidence, and next dependency.
7. Pipeline an item through its own dependent stages. Add a global barrier only when the next step truly needs all prior results, such as cross-item deduplication, ranking, a join, a convergence decision, or a judge.
8. Give parallel workers distinct charters and anti-charters. Identical prompts with different labels are decorative fan-out.
9. For each independent `READY` set, launch every native worker and capture a distinct host handle before the first wait, join, result read, or return acceptance. If the host cannot expose safe nonblocking starts and handles, use the declared sequential fallback and do not claim parallel execution.
10. Treat every worker return as a claim. `null`, timeout, skipped work, failed child, abandoned child, stale output, or missing handle remains an explicit non-success state; never synthesize a missing result from expectation.
11. Re-execute each returned packet's runnable verifier on the current artifact and required environment. A status read, checkbox, worker transcript, or historical evidence record is not re-verification. Review consequential manual gates and attempt at least one refutation before marking the packet `VERIFIED`.
12. Release that packet's exact ownership claim only after parent verification records the result. Then promote newly unblocked packets and launch the next ready wave without waiting for unrelated in-flight work.
13. Integrate in dependency order. Reverify the children, then run branch-level interface, end-to-end, joined-state, and regression checks. Reject or rebase stale work after the baseline, contract, or owned files change.
14. Carry only concise verified findings forward. Use `verified`, `single-source`, or `unverified` labels and retain dissent when it can change the decision.
15. Use bounded waves. A normal delegated run SHOULD start with two to four useful sidecars and MUST NOT exceed five without explicit approval. Reserve a material share of budget for verification and integration. Disclose every cap and unprocessed remainder.
16. If every item in a wave fails for the same reason, abort the wave and fix the shared contract, environment, verifier, or instructions. Extend only when the previous wave added verified state progress.
17. Prefer host-native delegation or a declarative DAG. Imperative workflow scripts are executable code: pin source and revision, inspect statically before running, disable unattended updates, restrict tools or sandbox when possible, and never execute untrusted workflow source merely to inspect or diagram it.
18. When the host lacks safe delegation, execute the same manifest sequentially. Do not claim parallel or background execution, and do not require a provider SDK, hosted service, API key, or Unlazy runtime.

Progress means a packet, gate, contract row, defect, or dispatch wave changed resolved state. Comments, timestamps, formatting, repeated status reads, and other metadata-only changes do not reset no-progress detection.
