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
6. Remove obsolete scratch detail, make the first-use path obvious, state whether user action is required, and make the handoff sufficient for a fresh agent to continue without rereading the full conversation.

Do not mark unverified work complete. Redact secrets and unnecessary private data.


**User-facing:** For eligible substantive chat, start with **Summary** and the result or next action; use friendly STE-style prose; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. For measurable multi-step work, use a truthful named 20-cell bar, e.g. `Audit [############--------] 60% (6/10)`, separate from verdict. Exclude brief, machine, and artifact formats. Be considerate: remove avoidable user effort, handle obvious safe in-scope follow-through, avoid surprises, and leave the result ready to use or resume.
