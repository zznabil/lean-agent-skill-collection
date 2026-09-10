# Get It Done state schema

Keep one human-readable file. Replace it atomically when possible.

- **Goal:** observable outcome, source requirements, primary verifier, and proof threshold.
- **Scope:** included work, non-goals, constraints, permissions, irreversible gates, and the standing Definition of Done when one exists.
- **Baseline:** current behavior, failures, artifact fingerprint, environment, unrelated local work, and load-bearing safety facts.
- **Evidence layers:** raw append-only or immutable records; a compact playbook of `VERIFIED`, `ASSUMED`, `REFUTED`, and `UNKNOWN` claims with provenance and revisit conditions; and a temporary scratchpad for current work.
- **Execution:** direct, staged, or delegated mode; trusted runtime or host capability; source revision or digest when executable workflow code is used.
- **Acceptance ledger:** requirement ID, source, observable outcome, verifier or oracle, expected result, actual result, environment, status, evidence path, confidence, calibration result, and current or stale state.
- **Contract:** `none`, `inline`, or `full`; current revision; every independently omittable required outcome or acceptance-changing constraint; stable ID, owner, observing gate or manual review, disposition, consumers, shared surfaces, deliverables, blocking conditions, and version.
- **Plan:** vital few tasks, riskiest unknown, next cheapest separating test, relevant quality attributes, dependencies, owners, and budget.
- **Coverage manifest:** qualified packet or journey ID, charter, anti-charter, exact scope, owned paths, ownership claim and release state, owner, dependencies, planned launch wave, host handle when available, `WAITING`/`READY`/`IN-FLIGHT`/`VERIFIED`/`ABANDONED` status, local verifier, integration verifier, handoff path, total target count, processed count, and disclosed remainder.
- **Progress:** completed waves with semantic gate, contract, packet, defect, or dispatch-state changes; changed artifacts; expected and actual results for consequential actions; fresh evidence; mismatches; refutations; skipped work; and stale results. Metadata-only edits, repeated status reads, timestamps, and tool calls are not progress. For every user-facing bar, store the track name, denominator definition, planned, processed, passed, failed, blocked, skipped, and not-tested counts. Progress is not acceptance.
- **Decision log:** append compact rows such as `time | decision or check | evidence | result | next action`. Record decisions and checkpoints, not a transcript.
- **Open:** defects, blockers, risks, approvals, unverified or untested assumptions, and intentionally deferred areas with one durable sink, owner or revisit trigger, and acceptance status.
- **Human effort:** avoidable questions resolved, safe follow-through completed, bundled decisions, teammate-pass result, and final user action as `NONE`, `DECISION NEEDED`, or `OPTIONAL FOLLOW-UP`.
- **Resume:** current phase, last stable checkpoint, workspace drift, stop trigger (`dry`, `cap`, `budget`, `approval`, `unstable`, or external blocker), and one exact next action or separating test.
- **Result:** terminal state, task-gate status, standing completion status, numeric claims re-measured, operations evidence, rollback, and unprocessed remainder.

Store conclusions and evidence, not hidden reasoning or secrets. One coordinator writes this file. Reconcile workspace drift before resuming.
