# Long-task checkpoint

Use one file at `.agent-state/get-it-done/<goal-id>.md` when a session may end or work needs durable ownership. Tiny tasks need no file. Keep these fields, merging sections when that is clearer:

- Goal, scope/non-goals, authority, current artifact revision and state.
- Required outcomes: ID, owner, observable check, expected result, actual result, evidence and whether current or stale.
- Decisions and assumptions that affect the next action; source and revisit trigger.
- Work completed, pending dependencies, budget used/remaining and meaningful no-progress count.
- Blockers, accepted nonblocking residuals with owner/revisit condition, recovery point and exact next action.

States are DONE, PAUSED_LIMITS, NEEDS_APPROVAL, BLOCKED, UNSTABLE, INFEASIBLE and CANCELLED; use ACTIVE while working. DONE requires every required outcome and gate. Deferred or abandoned required work remains unfinished until an authorised scope change removes it. INFEASIBLE needs affirmative evidence, not merely a timeout or exhausted search.

One owner writes the checkpoint. Reconcile the latest request and artifact drift before resuming. Recheck affected stale evidence. Store decisions and receipts, not hidden reasoning, secrets or fabricated progress. A processed count may include explicitly classified failures or blockers; it never implies they passed.

V8 state files remain historical inputs. Read their existing fields, preserve unresolved gates and authority, then migrate only when resuming that task; do not silently declare their status vocabulary equivalent.
