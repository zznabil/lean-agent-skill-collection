---
name: implement
description: "Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance."
---

# Implement

Use this optimization order: **correctness → safety → contract and architecture → simplicity → diff size → lines of code**.

- Before new code, check whether the work is unnecessary, already implemented, reusable from the repository, available in the standard library or native platform, or covered by an installed dependency.
- Add a new abstraction or dependency only when the contract requires it.

For **DIRECT** work, use one foreground owner, no separate plan or durable state, no delegation, and the narrowest decisive check. Escalate only when inspection exposes wider coupling, consequential risk, or an unproved boundary.

1. **Read before editing.** Read the request, relevant context, current code or artifact, tests, and local conventions. Preserve unrelated local work.
2. **Acceptance and shared owner.** Trace each material requirement to an observable acceptance check.
   - Identify the smallest affected area, riskiest unknown, and any load-bearing behavior that must remain true.
   - Trace callers and the owning shared location so the fix removes the cause rather than one visible symptom.
3. **Characterise existing behaviour.** Resolve observable uncertainty through inspection or a cheap probe before asking the user. In an established or weakly tested area, add a characterization check before refactoring behavior.
4. **Reversible slices.** Order work as thin vertical slices. Resolve contracts and high-risk unknowns before broad implementation; keep each stable slice reversible.
5. **Baseline and isolation.** For a risky or wide change, establish a clean baseline and an isolated branch, worktree, or reversible checkpoint before editing.
6. **Smallest complete change.** Make the smallest complete change.
   - Prefer deletion, reuse, standard-library or native capability, an installed dependency, or direct local code before a new layer.
   - Avoid speculative abstraction, unrelated cleanup, and refactors that move complexity without reducing it.
   - When the required behavior already exists, verify it and make no change.
7. **Rendered interface states.** For interface work, preserve the current design system and implement the required loading, empty, error, disabled, validation, persistence, and recovery states. Use `browser-automation` for rendered and interactive proof.
8. **Security and dependencies.** Apply **NIST SP 800-218 SSDF** proportionally.
   - At trust boundaries, validate untrusted input; for web applications, use applicable **OWASP ASVS** requirements rather than a vague security claim.
   - Inspect a new dependency, lockfile change, transitive impact, and lifecycle scripts before adoption.
   - Test material security or compatibility controls when relevant.
9. **Fresh verification.** Name the expected user-visible result and failure sign, then run the narrowest current check that proves the affected contract. One check is sufficient only when it observes the complete outcome and can fail honestly; if it fails, repair or report the blocker rather than recasting it as success.
   - Do not invent a new test framework or broad suite for a tiny local change, but do not use small scope to skip a required boundary, security, persistence, compatibility, or regression check.
   - Broaden once the change is stable only when another material boundary remains.
   - Keep or revert the change based on measured evidence.
10. **Durable regression guard.** When a defect pattern can recur, add the smallest durable guard: regression test, type, schema, lint rule, validation check, or approved hook.
11. **Inspect final output.** Inspect the final diff and real output.
    - Remove debug code, temporary files, accidental dependency changes, narration comments, placeholders, unjustified type escapes, defensive branches with no real failure mode, needless pass-through wrappers, and avoidable deep nesting.
    - Preserve justified trust-boundary checks, observable behavior, and local conventions; do not infer authorship from style.
12. **Ready-to-use pass.** Run one stewardship pass over the introduced change: verify ready-to-use behavior, include necessary use or recovery information, and leave the affected area easy for the next maintainer.
    - Do not broaden the task into unrelated cleanup.
    - Stop when the contract and fresh evidence are satisfied; optional polish must justify its own value.
13. **Delivery record.** Report changed artifacts, requirement coverage, actual checks and outcomes, assumptions, residual risk, intentionally untouched relevant areas, out-of-scope findings, and whether user action remains.

MUST NOT weaken tests, change expected behavior to match a bug, or publish, push, deploy, or mutate production without authorization.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
