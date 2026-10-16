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
1. State the working slice and user-visible result first. Include one cheap smoke check and the main deferrals in a sentence.
2. Inspect only the needed files, runtime, interfaces, and constraints. Reuse project mechanisms, stdlib, native features, or installed dependencies.
3. Build the thinnest end-to-end slice. Run one cheap smoke check on the real artifact or product boundary. A representative launch, API request, rendered view, or CLI interaction counts only if it observes the selected outcome and can fail.
4. Repair defects that block the slice or safety floor. Report the result, executed evidence, failed or unavailable checks, and deferrals. Stop before optional polish.
If no smoke check is possible, report `SMOKE: UNRUN` and the exact missing capability. You may deliver the artifact, but it is unverified.
## Selected interaction validation
Dogfooding and automated UAT are optional until the user selects them. Once selected, they are required. Use the project's existing browser, desktop, mobile, game, CLI, or API interface. Use the narrowest reliable tool in this order: native harness, structured protocol, accessibility automation, then computer-use control. Static source inspection, compilation alone, unit tests alone, and an uninteracted screenshot are not interaction evidence.
- **DOGFOOD:** Start from a known state. Operate the actual running artifact through its intended surface. Complete one representative user task. Observe the visible result and side effects. Clean disposable state. Report `PASS`, `FAIL`, `BLOCKED`, or `UNRUN`.
- **AUTOMATED UAT:** Run or create a replayable user journey through the real product boundary. Include a starting state, user-level actions, an observable failure-sensitive assertion, a replay command/artifact, and cleanup or reset when needed. A one-off computer-use session is DOGFOOD, not automated UAT. Computer-use automation counts only if it is recorded or scripted for replay and includes assertions. Pass a positive control and reject a representative broken state before claiming the UAT verifier works.
- If selected validation lacks a tool, runtime, account, environment, or permission, report `BLOCKED` or `UNRUN`. Name the missing item. Do not substitute static inspection or report the selected scope complete.
## Handoff
Use `COMPLETE` only if the working slice and all selected checks passed. Use `PARTIAL` for a useful slice with failed or unrun selected validation. Use `BLOCKED` if no useful safe slice exists. Report the working result, actual smoke/DOGFOOD/UAT evidence, material deferrals, remaining user action, and `Production readiness: NOT ASSESSED`. For later hardening, use the existing artifact and deferral list. Do not restart or silently extend the reduced scope.
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
