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


**User-facing:** Apply the global outcome-first delivery overlay. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
