# Gauntlet state format

Record these fields:

- Record the mission, scope, non-goals, assumptions, permissions, and current phase.
- Record the benchmark version, task-gate status, and standing Definition of Done if one exists.
- Maintain an acceptance ledger. Include the requirement, observable outcome, verifier or oracle, expected result, actual result, environment, calibration or sensitivity evidence, evidence path, disposition, status, and current or stale state.
- Maintain a belief ledger. Include the `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN` state, provenance, counterexamples, and revisit condition.
- Record model-gate and reality-gate status when the scope includes simulated or model-derived work.
- Record the artifact map and current checkpoint.
- Maintain a coverage manifest. Include slices or journeys, charter, anti-charter, dependencies, owners, status, verification tier, total target count, processed count, cap, and remainder.
- Record completed, rejected, and reverted changes.
- Maintain a defect ledger. Include severity, acceptance disposition (`blocking` or `nonblocking`), repair state (`open`, `fixed`, `blocked`, or `deferred`), evidence, owner, refutation result, and regression check.
- Maintain an evidence index. Include the tested artifact or revision, command or rubric, verifier, environment, entrypoint, authentication context, coverage, result, artifact path, confidence, time, and current or stale state.
- Keep run state and artifact verdict in separate fields.
- Record the iteration count, used budget, remaining budget, semantic no-progress count, last resolved gate/contract/defect/coverage state change, and stop trigger.
- For every displayed progress bar, record the track name, denominator definition, planned, processed/adjudicated, passed, failed, blocked, skipped, and not-tested counts.
- Record critic reports, identity receipts, live-topology evidence, uncertainty bias, independence level, failed or skipped critics, and preserved dissent.
- Record known risks, the exact stop reason, rollback, and one exact next action.

Store evidence and decisions. Do not store hidden reasoning or secrets. One lead writes durable state. Reconcile artifact drift before you resume.
