---
name: merge-conflicts
description: "Resolve merge, rebase, or cherry-pick conflicts by preserving intended behavior from both sides and verifying the integrated result. Use when conflict markers or semantic integration failures exist."
---

# Merge Conflicts

1. Identify the operation, base, current branch, incoming changes, and whether the user authorized continuation or history rewriting.
2. Read surrounding code, commits, tests, and both versions. Do not choose “ours” or “theirs” blindly.
3. Resolve one coherent area at a time. Preserve both intentions when compatible; otherwise state the tradeoff.
4. Search for remaining conflict markers and generated-file inconsistencies.
5. Run focused tests, then the relevant integration suite and final diff review.
6. Continue or complete the operation only when authorized. Never force-push or rewrite shared history without explicit approval.

Report files resolved, decisions, commands, actual checks, remaining conflicts, and recovery command if the operation must pause.


**User-facing:** For eligible substantive chat, start with **Summary** and the result or next action; use friendly STE-style prose; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. For measurable multi-step work, use a truthful named 20-cell bar, e.g. `Audit [############--------] 60% (6/10)`, separate from verdict. Exclude brief, machine, and artifact formats. Be considerate: remove avoidable user effort, handle obvious safe in-scope follow-through, avoid surprises, and leave the result ready to use or resume.
