# Get It Done state schema

Maintain one human-readable file. Replace the file atomically when possible.

- **Goal:** Record the observable outcome, source requirements, primary verifier, and proof threshold.
- **Scope:** Record included work, non-goals, constraints, permissions, irreversible gates, and the standing Definition of Done when one exists.
- **Baseline:** Record current behavior, failures, artifact fingerprint, environment, unrelated local work, and safety facts that the work depends on.
- **Evidence layers:** Keep raw append-only or immutable records. Keep a compact playbook of `VERIFIED`, `ASSUMED`, `REFUTED`, and `UNKNOWN` claims with provenance and revisit conditions. Keep a temporary scratchpad for current work.
- **Execution:** Record direct, staged, or delegated mode and the trusted runtime or host capability. Record the source revision or digest when execution uses workflow code.
- **Acceptance ledger:** Record requirement ID, source, observable outcome, verifier or oracle, expected result, actual result, environment, status, evidence path, confidence, calibration result, and current or stale state.
- **Contract:** Record `none`, `inline`, or `full` and the current revision. Record every independently omittable required outcome or acceptance-changing constraint. Include stable ID, owner, observing gate or manual review, disposition, consumers, shared surfaces, deliverables, blocking conditions, and version.
- **Plan:** Record the few critical tasks, riskiest unknown, next cheapest separating test, relevant quality attributes, dependencies, owners, and budget.
- **Coverage manifest:** Record qualified packet or journey ID, charter, anti-charter, exact scope, owned paths, ownership claim and release state, owner, dependencies, planned launch wave, and host handle when available. Include `WAITING`/`READY`/`IN-FLIGHT`/`VERIFIED`/`ABANDONED` status, local verifier, integration verifier, handoff path, total target count, processed count, and disclosed remainder.
- **Progress:** Record completed waves that change semantic gates, contracts, packets, defects, or dispatch states. Record changed artifacts; expected and actual results for consequential actions; fresh evidence; mismatches; refutations; skipped work; and stale results. Do not count metadata-only edits, repeated status reads, timestamps, or tool calls as progress. For every user-facing bar, store the track name, denominator definition, planned, processed, passed, failed, blocked, skipped, and not-tested counts. Progress is not acceptance.
- **Decision log:** Append compact rows such as `time | decision or check | evidence | result | next action`. Record decisions and checkpoints. Do not record a transcript.
- **Open:** Record defects, blockers, risks, approvals, unverified or untested assumptions, and intentionally deferred areas. Include one durable sink, owner or revisit trigger, and acceptance status.
- **Human effort:** Record avoidable questions resolved, safe follow-through completed, bundled decisions, teammate-pass result, and final user action as `NONE`, `DECISION NEEDED`, or `OPTIONAL FOLLOW-UP`.
- **Resume:** Record current phase, last stable checkpoint, workspace drift, stop trigger (`dry`, `cap`, `budget`, `approval`, `unstable`, or external blocker), and one exact next action or separating test.
- **Result:** Record terminal state, task-gate status, standing completion status, re-measured numeric claims, operations evidence, rollback, and unprocessed remainder.

Store conclusions and evidence. Do not store hidden reasoning or secrets. One coordinator writes this file. Reconcile workspace drift before you resume.
