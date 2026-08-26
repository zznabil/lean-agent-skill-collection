---
name: handoff
description: "Create a concise status recap or durable handoff. Use after substantial work, before interruption, or when another session needs the exact current state and next action."
---

# Handoff

Choose one mode.

## Quick status

Use `DONE`, `PARTIAL`, or `BLOCKED`, then state:

- **Result:** what exists now.
- **Verified:** checks actually run and outcomes.
- **Next:** one action only when work remains.

## Durable handoff

1. State the goal, scope, constraints, current revision or checkpoint, and terminal or pause state.
2. Reference existing specs, diffs, issues, logs, and artifacts by path. Do not copy large content already stored elsewhere.
3. Record completed work, changed files, decisions, actual verification, failures, blockers, risks, rollback, and the exact next command or action.
4. Name relevant areas intentionally left untouched and any out-of-scope concern that the next worker could mistake for an omission.
5. Note relevant skills for the next session only when they add distinct value.
6. Make the handoff sufficient for a fresh agent to continue without rereading the full conversation.

Do not mark unverified work complete. Redact secrets and unnecessary private data.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
