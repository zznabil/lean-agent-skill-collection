# Acceptance record

Keep one lead-owned `.gauntlet/state.md`; add separate evidence files only when useful. Record:

- Goal, scope/non-goals, approval, artifact checkpoint and frozen benchmark version.
- Required gates: source, observable outcome, verifier, expected/actual result, environment, evidence, calibration and freshness.
- Coverage: required slices, owner, processed/total, failed, blocked, skipped and unread remainder.
- Findings: evidence, severity P0-P3, blocking/nonblocking disposition, repair state, owner and regression check.
- Critics/judge: actual identity and context boundary when known, inspected artifact, live handle or receipt, independence limits and dissent.
- Budget, repair rounds, meaningful no-progress count, decisions, recovery and exact next action.

Run state is ACTIVE, COMPLETE, BLOCKED, BUDGET EXHAUSTED or CANCELLED. Artifact verdict is PASS, CONDITIONAL PASS, FAIL or NOT JUDGED. These axes are independent. COMPLETE can accompany FAIL. Severity measures impact, not automatically blocking status.

PASS requires current passing evidence for every hard gate and no blocker. CONDITIONAL PASS permits only explicitly accepted, owned nonblocking residuals outside hard gates. A verified hard failure decides FAIL. Otherwise missing required evidence means NOT JUDGED. Abandoned, deferred or owner-decision required work remains non-passing until an authorised scope amendment removes it; record that amendment rather than rewriting history.

Revalidate affected evidence after artifact, input, verifier, environment, dependency or entry-point changes. Preserve unknown causes and raw evidence separately from conclusions. For AI-derived outputs, record model and reality gates when applicable. Store no secrets or hidden reasoning.

V8 ledgers are historical records: preserve unresolved gates and benchmark changes when resuming; do not auto-upgrade their verdict or delete their evidence to fit this smaller format.
