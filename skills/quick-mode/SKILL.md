---
name: quick-mode
description: "Deliver a user-authorised working slice fast, with one cheap reality check and visible deferrals. Use only when the user explicitly requests Quick Mode, a rough prototype, or an equivalent fast-path scope; not for quick questions or short replies."
---
# Quick Mode
Deliver the smallest useful working slice now. State deferred nonessential hardening and polish. Do not defer them silently.
## Composition
For a composed task, use one primary lifecycle owner: the explicit user-designated owner; otherwise selected `get-it-done`; otherwise the unique substantive task skill after assigning support roles. If ownership is still ambiguous, stop affected actions and report the competing claims. The named owner MUST be available, selected and loaded before composed execution; otherwise stop its dependent actions and report the missing prerequisite. Safe independent inspection may continue. Availability alone proves neither selection nor loading. Alone, this skill retains its normal ownership and status rules.
When composed, Quick Mode modifies only the user-authorized working slice and optional validation. It MUST NOT suppress the selected owner's state, an explicitly selected assurance phase, release gates, destructive-action authorization, safe-state checks, hold points or recovery. Report deferrals and production readiness separately. The Handoff states describe the slice, not a second task lifecycle.
Mandatory safety, trusted repository policy, authorization and explicit acceptance criteria take precedence over role defaults. A supporter MUST NOT claim task completion or change permissions. Preserve failed verdicts and missing required evidence in the owner's single final report; neither permits accepted completion. Presentation changes no facts, scope or verdicts.

## Activation
Activate Quick Mode only on an explicit user request for Quick Mode, a rough prototype, or an equivalent fast path with reduced acceptance. A quick question, short reply, or deadline alone does not qualify. Keep all requirements that the user retained in scope. Keep one foreground owner. When primary, skip separate plans, durable state, delegation, Gauntlet, and unrelated cleanup unless risk requires them or the user requests them. When supporting, preserve the selected owner and assurance workflow.
## Safety floor
MUST preserve authorization, privacy, secrets, trust boundaries, data integrity, minimum recovery, and required security, compatibility, accessibility, and acceptance conditions.
Keep normal permission gates for consequential, destructive, costly, external, or production actions. Never weaken tests. Do not infer success from silence, label an unrun check as passed, or claim production readiness by default.
If an action cannot proceed safely, prefer a reversible local patch, preview, dry run, or disposable prototype.
## Fast path
1. State the working slice and user-visible result first. Name one cheap smoke check and the main deferrals in one sentence.
2. Inspect the necessary files, runtime, interfaces and constraints. Reuse project mechanisms, the standard library, native features or installed dependencies.
3. Build the thinnest end-to-end slice. Smoke-check the real artefact or product boundary. A launch, API request, rendered view or CLI interaction counts only when it observes the selected outcome and can fail.
4. Repair defects blocking the slice or safety floor. Report actual evidence, failed or unavailable checks and deferrals. Stop before optional polish.
If no smoke check is possible, report `SMOKE: UNRUN` and the exact missing capability. You may deliver the artifact, but it is unverified.
## Selected interaction validation
Dogfooding and automated UAT are optional until the user selects them. Once selected, they are required. Use the project's existing browser, desktop, mobile, game, CLI, or API interface. Use the narrowest reliable tool in this order: native harness, structured protocol, accessibility automation, then computer-use control. Static source inspection, compilation alone, unit tests alone, and an uninteracted screenshot are not interaction evidence.
- **DOGFOOD:** Start from a known state. Operate the actual running artifact through its intended surface. Complete one representative user task. Observe the visible result and side effects. Clean disposable state. Report `PASS`, `FAIL`, `BLOCKED`, or `UNRUN`.
- **AUTOMATED UAT:** Run or create a replayable user journey through the real product boundary. Include a starting state, user-level actions, an observable failure-sensitive assertion, a replay command/artifact, and cleanup or reset when needed. A one-off computer-use session is DOGFOOD, not automated UAT. Computer-use automation counts only if it is recorded or scripted for replay and includes assertions. Pass a positive control and reject a representative broken state before claiming the UAT verifier works.
- If selected validation lacks a tool, runtime, account, environment, or permission, report `BLOCKED` or `UNRUN`. Name the missing item. Do not substitute static inspection or report the selected scope complete.
## Handoff
Use `COMPLETE` only if the working slice and all selected checks passed. Use `PARTIAL` for a useful slice with failed or unrun selected validation. Use `BLOCKED` if no useful safe slice exists. Report the working result, actual smoke/DOGFOOD/UAT evidence, material deferrals, remaining user action, and `Production readiness: NOT ASSESSED`. For later hardening, use the existing artifact and deferral list. Do not restart or silently extend the reduced scope.
## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when helpful. If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. These are communication aids, not claims of formal standards conformance or legal authority.
**User-facing:**
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty, limits and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action. Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not invent mandates.
- Before risky work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain or contrast only when useful.
- Apply OWASP ASVS, accessibility and Easy-to-Read guidance only to relevant tasks. Easy-to-Read verification requires intended-user review.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
