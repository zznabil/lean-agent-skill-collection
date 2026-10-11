# Program-scale orchestration

Use this procedure only when the task has several meaningful stages or genuinely independent packets, and coordination costs less than sequential work. Use direct execution for a small task, a tightly coupled task, or a task that one check can prove.

## Modes

- **Direct:** Assign one foreground owner to one bounded task with one decisive check. Do not add a manifest, durable state, subagent, branch tree, handoff, barrier, or orchestration artifact unless new evidence makes it necessary.
- **Staged:** Execute several dependent phases in sequence. Keep durable state and explicit checkpoints.
- **Delegated:** Use native agents or a trusted workflow runtime for independent packets. The parent retains the critical path, integration, and final verification.

## Roles

- **Coordinator:** Owns the goal, revisioned contract inventory, coverage, budget, state, assignments, launch waves, barriers, and stop rules.
- **Worker:** Owns one bounded packet and its local evidence. The worker does not approve the integrated result.
- **Verifier:** Has read-only access and checks specific criteria. The verifier re-executes checks or inspects independently. It does not trust stored status.
- **Integrator:** Owns merge order, conflicts, branch-level checks, regressions, and the final artifact. The coordinator MAY fill this role.

## States and contract inventory

Use leaf states `WAITING`, `READY`, `IN-FLIGHT`, `VERIFIED`, or `ABANDONED`. Use branch states `OPEN`, `VERIFIED`, or `ABANDONED`. Keep a returned worker `IN-FLIGHT` until parent re-verification and required manual review pass. Treat `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` as visible handoff states, not completion.

Before fan-out, inventory every required outcome that could be omitted independently. Include every constraint that changes acceptance. Assign each item a stable ID, current revision, owner, observing gate or manual review, and disposition. Reread the current request before fan-out and root completion. Reconcile amendments; do not silently drop earlier requirements.

## Protocol

1. Discover serially before you decompose the task. Inspect scope, interfaces, data shape, likely overlap, current verifier commands, and the parent critical path. Fan out only when the expected time, coverage, or independence benefit exceeds the cost of briefing, coordination, re-verification, and integration. Agent availability alone does not justify fan-out.
2. Place checks where their evidence lives. A leaf gate reads only the artifact that its leaf owns. Put interface compatibility, end-to-end behavior, joined-state invariants, and cross-leaf regressions in the branch or integration gate. Run those checks once there.
3. Choose the smallest contract. Use `none` for a trivial packet and `inline` for ordinary separate scopes. Use `full` only for shared public surfaces, migrations, auth, data contracts, or overlapping writers. If you cannot name a consumer, surface, check, deliverable, or blocker, keep the contract inline or skip it.
4. Write one shallow manifest. Include the qualified packet ID, charter, anti-charter, exact scope, owned paths, input, structured output, owner, dependencies, shared surfaces, local gate, integration gate, verification tier, and integration point. Prove that the manifest and contract inventory cover the target without a gap, duplicate, or hidden remainder.
5. Assign one owner to every shared file or coupled subsystem. Before concurrent launch, verify one complete, disjoint owned-path set per packet. Record its exclusive ownership claim. If overlap is inherent, use one sequential owner or actual isolation. An ownership claim coordinates cooperating workers. It is not a filesystem or security sandbox.
   - Before a writable worker's first edit, record the intended base revision and read the exact `HEAD` from that worker's checkout. Require equality. If they differ, hold dependent writes and reconcile the base before retrying.
   - Include hidden and indirect outputs in each write footprint: generated files, lockfiles, indexes, and shared test artifacts. Assign their ownership before concurrent writes.
   - Inspect and preserve unattributed changes during normal work and recovery. Reconcile their ownership before editing them; do not automatically assign or discard them.
   - Read-only workers do not require a new worktree. Keep direct tasks direct.
6. Write self-contained briefs. Workers MUST NOT coordinate through hidden shared state, overwrite siblings, or spawn nested coordinator trees. Include status, changed artifacts, structured result, verifier command, evidence, assumptions, risks, confidence, and next dependency in each handoff.
7. Pipeline each item through its own dependent stages. Add a global barrier only when the next step needs all prior results. Examples include cross-item deduplication, ranking, a join, a convergence decision, or a judge.
8. Assign distinct charters and anti-charters to parallel workers. Identical prompts with different labels do not provide meaningful fan-out.
9. For each independent `READY` set, launch every native worker and capture a distinct host handle before the first wait, join, result read, or return acceptance. If the host cannot expose safe nonblocking starts and handles, use the declared sequential fallback. Do not claim parallel execution.
10. Treat every worker return as a claim. Keep `null`, timeout, skipped work, failed child, abandoned child, stale output, or missing handle as an explicit non-success state. Never create a missing result from an expected result.
11. Re-execute each returned packet's runnable verifier on the current artifact in the required environment. A status read, checkbox, worker transcript, or historical evidence record does not constitute re-verification. Review consequential manual gates. Attempt at least one refutation before you mark the packet `VERIFIED`.
12. Release the packet's exact ownership claim only after parent verification records the result. Then promote newly unblocked packets. Launch the next ready wave without waiting for unrelated in-flight work.
13. Integrate in dependency order. Reverify the children. Then run branch-level interface, end-to-end, joined-state, and regression checks. Reject or rebase stale work after the baseline, contract, or owned files change.
14. Carry forward only concise verified findings. Use `verified`, `single-source`, or `unverified` labels. Retain dissent when it can change the decision.
15. Use bounded waves. A normal delegated run SHOULD start with two to four useful sidecars. It MUST NOT exceed five without explicit approval. Reserve a material share of the budget for verification and integration. Disclose every cap and unprocessed remainder.
16. If every item in a wave fails for the same reason, abort the wave. Fix the shared contract, environment, verifier, or instructions. Extend only when the previous wave added verified state progress.
17. Prefer host-native delegation or a declarative DAG. Treat imperative workflow scripts as executable code. Pin the source and revision. Inspect the code statically before running it. Disable unattended updates. Restrict tools or use a sandbox when possible. Never execute untrusted workflow source merely to inspect or diagram it.
18. If the host lacks safe delegation, execute the same manifest sequentially. Do not claim parallel or background execution. Do not require a provider SDK, hosted service, API key, or Unlazy runtime.

Count progress only when a packet, gate, contract row, defect, or dispatch wave changes resolved state. Comments, timestamps, formatting, repeated status reads, and other metadata-only changes do not reset no-progress detection.
