---
name: implement
description: "Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance."
---
# Implement
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terms. Use Diátaxis organization to separate how-to, reference, and explanation when useful. These are style guides, not a claim of formal standards conformance.
Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. State conclusions directly. Do not hide verified failure or responsibility supported by evidence. Correct actual agent errors or give the next safe action.
## Implementation procedure
Apply this priority order: **correctness → safety → contract and architecture → simplicity → diff size → lines of code**.
- Before you add code, check whether the work is unnecessary or already implemented. Check for reusable repository code, standard-library or native-platform capability, and installed dependencies.
- Add an abstraction or dependency only when the contract requires it.
For **DIRECT** work, use one foreground owner. Do not use a separate plan, durable state, or delegation. Use the narrowest decisive check. Escalate only when inspection reveals wider coupling, consequential risk, or an unproved boundary.
1. **Read before editing.** Read the request, relevant context, current code or artifact, tests, and local conventions. Preserve unrelated local work.
2. **Define acceptance and find the shared owner.** Map each material requirement to an observable acceptance check.
   - Identify the smallest affected area, the riskiest unknown, and behavior that must remain true.
   - Trace callers and the shared location that owns the behavior. Fix the cause, not just one visible symptom.
3. **Check existing behavior.** Resolve observable uncertainty through inspection or a cheap probe before you ask the user. In an established or weakly tested area, add a characterization check before you refactor behavior.
4. **Use reversible slices.** Order work in thin vertical slices. Resolve contracts and high-risk unknowns before broad implementation. Keep each stable slice reversible.
5. **Set a baseline and isolate the change.** Before you edit a risky or wide change, establish a clean baseline and an isolated branch, worktree, or reversible checkpoint.
6. **Make the smallest complete change.**
   - Prefer deletion, reuse, standard-library or native capability, an installed dependency, or direct local code before you add a layer.
   - Avoid speculative abstraction, unrelated cleanup, and refactors that move complexity without reducing it.
   - If the required behavior already exists, verify it and make no change.
7. **Implement rendered interface states.** For interface work, preserve the current design system. Implement the required loading, empty, error, disabled, validation, persistence, and recovery states. Use `browser-automation` for rendered and interactive proof.
8. **Check security and dependencies.** Apply **NIST SP 800-218 SSDF** in proportion to the work.
   - Validate untrusted input at trust boundaries. For web applications, use applicable **OWASP ASVS** requirements instead of a vague security claim.
   - Before adoption, inspect a new dependency, lockfile change, transitive impact, and lifecycle scripts.
   - Test material security or compatibility controls when relevant.
9. **Get fresh verification.** Name the expected user-visible result and failure sign. Then run the narrowest current check that proves the affected contract. One check is sufficient only if it observes the complete outcome and can fail honestly. If it fails, repair the failure or report the blocker. Do not present failure as success.
   - Do not invent a test framework or broad suite for a tiny local change. Small scope does not permit you to skip a required boundary, security, persistence, compatibility, or regression check.
   - After the change is stable, broaden verification only if another material boundary remains.
   - Use measured evidence to decide whether to keep or revert the change.
10. **Add a durable regression guard.** If a defect pattern can recur, add the smallest durable guard: regression test, type, schema, lint rule, validation check, or approved hook.
11. **Inspect the final output.** Inspect the final diff and real output.
    - Remove debug code, temporary files, accidental dependency changes, narration comments, placeholders, unjustified type escapes, defensive branches with no real failure mode, needless pass-through wrappers, and avoidable deep nesting.
    - Preserve justified trust-boundary checks, observable behavior, and local conventions. Do not infer authorship from style.
12. **Check readiness for use.** Run one stewardship pass over the introduced change. Verify ready-to-use behavior. Include necessary use or recovery information. Leave the affected area easy for the next maintainer to work on.
    - Do not expand the task into unrelated cleanup.
    - Stop when the contract and fresh evidence are satisfied. Optional polish must justify its own value.
13. **Record delivery.** Report changed artifacts, requirement coverage, actual checks and outcomes, assumptions, residual risk, intentionally untouched relevant areas, out-of-scope findings, and whether user action remains.
MUST NOT weaken tests, change expected behavior to match a bug, or publish, push, deploy, or mutate production without authorization.
## User-facing delivery rules
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not narrate routine tool use or add praise.
- When expressing normative force, use BCP 14 only for that purpose. Important requirements must name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Add a hold point and a safe-state check where needed. Then state the expected result, failure sign, and recovery.
- Explain a difficult mechanism simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Calculate progress from processed items and round down. Keep progress separate from the verdict. Processed is not passed. Otherwise, report the phase and evidence without a bar.
- Avoid surprise scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
