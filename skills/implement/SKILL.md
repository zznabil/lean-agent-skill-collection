---
name: implement
description: "Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance."
---

# Implement

Use this optimization order: **correctness → safety → contract and architecture → simplicity → diff size → lines of code**. Before new code, check whether the work is unnecessary, already implemented, reusable from the repository, available in the standard library or native platform, or covered by an installed dependency. Add a new abstraction or dependency only when the contract requires it.

For **DIRECT** work, use one foreground owner, no separate plan or durable state, no delegation, and the narrowest decisive check. Escalate only when inspection exposes wider coupling, consequential risk, or an unproved boundary.

1. Read the request, relevant context, current code or artifact, tests, and local conventions. Preserve unrelated local work.
2. Trace each material requirement to an observable acceptance check. Identify the smallest affected area, riskiest unknown, and any load-bearing behavior that must remain true. Trace callers and the owning shared location so the fix removes the cause rather than one visible symptom.
3. Resolve observable uncertainty through inspection or a cheap probe before asking the user. In an established or weakly tested area, add a characterization check before refactoring behavior.
4. Order work as thin vertical slices. Resolve contracts and high-risk unknowns before broad implementation; keep each stable slice reversible.
5. For a risky or wide change, establish a clean baseline and an isolated branch, worktree, or reversible checkpoint before editing.
6. Make the smallest complete change. Prefer deletion, reuse, standard-library or native capability, an installed dependency, or direct local code before a new layer. Avoid speculative abstraction, unrelated cleanup, and refactors that move complexity without reducing it. When the required behavior already exists, verify it and make no change.
7. For interface work, preserve the current design system and implement the required loading, empty, error, disabled, validation, persistence, and recovery states. Use `browser-automation` for rendered and interactive proof.
8. Apply **NIST SP 800-218 SSDF** proportionally. At trust boundaries, validate untrusted input; for web applications, use applicable **OWASP ASVS** requirements rather than a vague security claim. Inspect a new dependency, lockfile change, transitive impact, and lifecycle scripts before adoption. Test material security or compatibility controls when relevant.
9. Run the narrowest current check that fully proves the affected contract; one check is sufficient only when it observes the complete outcome and can fail honestly. Do not invent a new test framework or broad suite for a tiny local change, but do not use small scope to skip a required boundary, security, persistence, compatibility, or regression check. Broaden once the change is stable only when another material boundary remains. Keep or revert the change based on measured evidence.
10. When a defect pattern can recur, add the smallest durable guard: regression test, type, schema, lint rule, validation check, or approved hook.
11. Inspect the final diff and real output. Remove debug code, temporary files, accidental dependency changes, narration comments, placeholders, unjustified type escapes, defensive branches with no real failure mode, needless pass-through wrappers, and avoidable deep nesting. Preserve justified trust-boundary checks, observable behavior, and local conventions; do not infer authorship from style.
12. Run one stewardship pass over the introduced change: verify ready-to-use behavior, include necessary use or recovery information, and leave the affected area easy for the next maintainer. Do not broaden the task into unrelated cleanup. Stop when the contract and fresh evidence are satisfied; optional polish must justify its own value.
13. Report changed artifacts, requirement coverage, actual checks and outcomes, assumptions, residual risk, intentionally untouched relevant areas, out-of-scope findings, and whether user action remains.

MUST NOT weaken tests, change expected behavior to match a bug, or publish, push, deploy, or mutate production without authorization.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
