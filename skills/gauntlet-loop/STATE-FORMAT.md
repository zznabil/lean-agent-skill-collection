# Gauntlet state format

Record:

- mission, scope, non-goals, assumptions, permissions, and current phase;
- benchmark version, task-gate status, and standing Definition of Done when one exists;
- acceptance ledger with requirement, observable outcome, verifier or oracle, expected result, actual result, environment, calibration or sensitivity evidence, evidence path, disposition, status, and current or stale state;
- belief ledger with `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN` state, provenance, counterexamples, and revisit condition;
- model-gate and reality-gate status when simulated or model-derived work is in scope;
- artifact map and current checkpoint;
- coverage manifest with slices or journeys, charter, anti-charter, dependencies, owners, status, verification tier, total target count, processed count, cap, and remainder;
- completed, rejected, and reverted changes;
- defect ledger with severity, acceptance disposition (`blocking` or `nonblocking`), repair state (`open`, `fixed`, `blocked`, or `deferred`), evidence, owner, refutation result, and regression check;
- evidence index with tested artifact or revision, command or rubric, verifier, environment, entrypoint, authentication context, coverage, result, artifact path, confidence, time, and current or stale state;
- run state and artifact verdict as separate fields;
- iteration count, used budget, remaining budget, semantic no-progress count, last resolved gate/contract/defect/coverage state change, and stop trigger;
- for every displayed progress bar: track name, denominator definition, planned, processed/adjudicated, passed, failed, blocked, skipped, and not-tested counts;
- critic reports, identity receipts, live-topology evidence, uncertainty bias, independence level, failed or skipped critics, and preserved dissent;
- known risks, exact stop reason, rollback, and one exact next action.

Store evidence and decisions, not hidden reasoning or secrets. One lead writes durable state. Reconcile artifact drift before resuming.
