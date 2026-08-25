# Gauntlet state format

Record:

- mission, scope, non-goals, assumptions, permissions, and current phase;
- benchmark version, task-gate status, and standing Definition of Done when one exists;
- acceptance ledger with requirement, check, expected result, actual result, evidence, and status;
- belief ledger with `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN` state, provenance, counterexamples, and revisit condition;
- model-gate and reality-gate status when simulated or model-derived work is in scope;
- artifact map and current checkpoint;
- coverage manifest with slices or journeys, charter, anti-charter, dependencies, owners, status, verification tier, total target count, processed count, cap, and remainder;
- completed, rejected, and reverted changes;
- defect ledger with severity, evidence, owner, state, refutation result, and regression check;
- evidence index with command or method, environment, result, artifact path, confidence, and time;
- iteration count, used budget, remaining budget, no-progress count, and stop trigger;
- critic reports, identity receipts, live-topology evidence, uncertainty bias, independence level, failed or skipped critics, and preserved dissent;
- known risks, exact stop reason, rollback, and one exact next action.

Store evidence and decisions, not hidden reasoning or secrets. One lead writes durable state. Reconcile artifact drift before resuming.
