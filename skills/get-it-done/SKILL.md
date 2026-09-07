---
name: get-it-done
description: "Own an explicitly requested long-running task through implementation, verification and authorised delivery."
---

# Get It Done

Use when explicitly requested, or when the user authorises long-horizon ownership. One owner completes the intended task; this is not a second controller layered over another owner. A tiny task still uses direct execution without state files or delegation.

Define the goal, scope, permission boundary and observable completion criteria. Inspect current artifacts and existing approval before asking. Include running or inspecting the result, repairing in-scope failures and required delivery; do not stop at a first draft or an intermediate review request.

Work in small reversible slices. Reuse project mechanisms and preserve necessary correctness, safety and error handling. Resolve risky assumptions early. Complete authorised preparation before requesting a genuinely missing decision. Read back uncertain external writes before retrying.

For work spanning sessions or consequential stages, keep one concise checkpoint using [STATE.md](STATE.md). For genuinely independent packets, use [ORCHESTRATION.md](ORCHESTRATION.md); otherwise stay sequential. Delegate only through real host capabilities, keep coupled files under one owner and verify workers' actual artifacts before integrating them.

Check the real outcome with falsifiable gates. Rerun affected evidence after a relevant change; a worker's report or stored pass is historical. Add independent acceptance only when required or justified by a distinct material risk. Missing independent review must remain visible.

Reserve time for integration and verification. After two attempts without meaningful progress, change strategy; stop at the agreed budget or a real blocker. Optional polish does not extend the task.

Return DONE only when every required outcome and gate is satisfied. Otherwise use PAUSED_LIMITS, NEEDS_APPROVAL, BLOCKED, UNSTABLE, INFEASIBLE or CANCELLED with evidence and the exact next action. Unfinished required work cannot become DONE by renaming it deferred. Report the useful result, fresh checks, residual risk and user action, not a phase-by-phase replay.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.
