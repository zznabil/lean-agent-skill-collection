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
