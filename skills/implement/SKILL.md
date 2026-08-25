---
name: implement
description: "Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance."
---

# Implement

1. Read the request, relevant context, current code or artifact, tests, and local conventions. Preserve unrelated local work.
2. Trace each material requirement to an observable acceptance check. Identify the smallest affected area, riskiest unknown, and any load-bearing behavior that must remain true.
3. Resolve observable uncertainty through inspection or a cheap probe before asking the user. In an established or weakly tested area, add a characterization check before refactoring behavior.
4. Order work as thin vertical slices. Resolve contracts and high-risk unknowns before broad implementation; keep each stable slice reversible.
5. For a risky or wide change, establish a clean baseline and an isolated branch, worktree, or reversible checkpoint before editing.
6. Make the smallest complete change. Avoid speculative abstraction, unrelated cleanup, and refactors that move complexity without reducing it.
7. At trust boundaries, validate untrusted input. Inspect a new dependency, lockfile change, transitive impact, and lifecycle scripts before adoption. Test material security or compatibility controls when relevant.
8. Run focused checks after relevant state changes; do not repeat an unchanged check under unchanged conditions. Run the full relevant suite once the change is stable. Keep or revert the change based on measured evidence.
9. When a defect pattern can recur, add the smallest durable guard: regression test, type, schema, lint rule, validation check, or approved hook.
10. Inspect the final diff and real output. Remove debug code, temporary files, and accidental dependency changes.
11. Report changed artifacts, requirement coverage, actual checks and outcomes, assumptions, residual risk, intentionally untouched relevant areas, and out-of-scope findings.

MUST NOT weaken tests, change expected behavior to match a bug, or publish, push, deploy, or mutate production without authorization.
