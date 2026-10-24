---
name: implement
description: "Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance."
---
# Implement
## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. Trusted root `AGENTS.md` governs when loaded; otherwise use this standalone fallback. Never claim root activation without evidence.
Use ASD-STE100-inspired short, active sentences, ISO 704-inspired stable terms, and Diátaxis organisation when useful. These guides do not establish formal conformance.
Lead with the answer or next action. Use only the detail the task needs. Omit routine Summary headings and closing recaps.
Use TL;DR only when it helps a long response, and place it first. Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
## Implementation procedure
Apply **correctness → safety → contract and architecture → simplicity → diff size → lines of code**.
For **DIRECT** work, use one foreground owner, no separate plan, durable state or delegation, and the narrowest decisive check.
Escalate only for wider coupling, consequential risk or an unproved boundary.
1. Read the request, relevant context, affected code or artefact, tests and local conventions. Preserve unrelated work.
2. Map each material requirement to an observable check. Identify the smallest affected area, riskiest unknown and preserved behaviour.
   Trace callers to the shared owner; fix the cause rather than a symptom.
3. Resolve observable uncertainty through inspection or a cheap probe before asking. Characterise established or weakly tested behaviour before refactoring.
4. Order thin, reversible vertical slices by contract and risk. Before wide or risky edits, establish a baseline and isolated branch, worktree or checkpoint.
5. Make the smallest complete change. First consider omission, existing repository code, the standard library, native capabilities and installed dependencies.
   Add a layer or dependency only when the contract requires it. Avoid speculative abstractions, unrelated cleanup and complexity-shifting refactors.
   If the required behaviour exists, verify it without changing it.
6. For interfaces, preserve the design system and implement required loading, empty, error, disabled, validation, persistence and recovery states.
   Use `browser-automation` for rendered and interactive proof.
7. Apply **NIST SP 800-218 SSDF** proportionately. Validate untrusted input at boundaries; use applicable **OWASP ASVS** requirements for web applications.
   Inspect new dependencies, lockfile changes, transitive impact and lifecycle scripts before adoption. Test material security and compatibility controls.
8. Name the expected user-visible result and failure sign. Run the narrowest fresh check that observes the complete affected contract and rejects failure.
   Repair failure or report the blocker; never label it success. Do not create a broad framework for a tiny change.
   Small scope does not waive required boundary, security, persistence, compatibility or regression checks.
   Broaden checks only for remaining material boundaries. Use measured evidence to keep or revert the change.
9. Guard recurring defects with the smallest durable regression test, type, schema, lint rule, validation check or approved hook.
10. Inspect the final diff and real output. Remove probes, temporary files, accidental dependencies, placeholders, unjustified type escapes and needless wrappers or nesting.
    Preserve justified trust-boundary checks and local conventions. Do not infer authorship from style.
11. Make one stewardship pass: verify ready-to-use behaviour, add necessary use or recovery information, and leave the area maintainable.
    Stop when the contract and fresh evidence pass; do not expand scope for optional polish.
12. Report changed artefacts, requirement coverage, actual checks, assumptions, residual risk, relevant untouched areas, out-of-scope findings and remaining user action.
MUST NOT weaken tests, change expected behaviour to match a bug, or publish, push, deploy or mutate production without authorisation.
## Conditional reporting
Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not invent mandates from advice.
Before risky work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery.
Explain difficult mechanisms simply. Use compliant/noncompliant contrasts only when helpful.
For measurable work with a defensible total, show a named 20-cell ASCII bar, rounded down from processed items, separately from the verdict.
Processed does not mean passed. Otherwise report the phase and evidence. Avoid surprise scope and leave the result usable or resumable.
