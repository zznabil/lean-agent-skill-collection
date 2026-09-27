---
name: quick-mode
description: "Deliver a user-authorised working slice fast, with one cheap reality check and visible deferrals. Use only when the user explicitly requests Quick Mode, a rough prototype, or an equivalent fast-path scope; not for quick questions or short replies."
---

# Quick Mode

Deliver the smallest useful working slice now. Defer nonessential hardening and polish visibly, not silently.

## Activation

Quick Mode requires an explicit user request: the name, a rough prototype, or an equivalent reduced-acceptance fast path. A quick question, short reply, or deadline alone does not qualify. Do not drop requirements the user kept in scope. Keep one foreground owner; skip separate plans, durable state, delegation, Gauntlet, and unrelated cleanup unless required by risk or requested.

## Safety floor

MUST preserve authorization, privacy, secrets, trust boundaries, data integrity, minimum recovery, and required security, compatibility, accessibility, and acceptance conditions. Consequential, destructive, costly, external, or production actions retain normal permission gates. Never weaken tests, infer success from silence, label an unrun check as passed, or claim production readiness by default. Prefer a reversible local patch, preview, dry run, or disposable prototype when an action cannot safely proceed.

## Fast path

1. Define the working slice, one cheap smoke check, and main deferrals in one sentence.
2. Inspect only the needed files, runtime, interfaces, and constraints; reuse project mechanisms, stdlib, native features, or installed dependencies.
3. Build the thinnest end-to-end slice and run one cheap smoke check on the real artifact or product boundary. A representative launch, API request, rendered view, or CLI interaction counts only when it observes the selected outcome and can fail.
4. Repair defects blocking the slice or safety floor. Report the result, executed evidence, failed/unavailable checks, and deferrals; stop before optional polish.

If no smoke check is possible, report `SMOKE: UNRUN` with the exact missing capability. The artifact may be delivered, but is unverified.

## Selected interaction validation

Dogfooding and automated UAT are optional *until selected* by the user; after selection they are required. Use the project's existing browser, desktop, mobile, game, CLI, or API interface and the narrowest reliable tool: native harness, structured protocol, accessibility automation, then computer-use control. Static source inspection, compilation alone, unit tests alone, and an uninteracted screenshot are not interaction evidence.

- **DOGFOOD:** from a known state, operate the actual running artifact through its intended surface, complete one representative user task, observe the visible result and side effects, clean disposable state, and report `PASS`, `FAIL`, `BLOCKED`, or `UNRUN`.
- **AUTOMATED UAT:** run or create a replayable user journey through the real product boundary with a starting state, user-level actions, an observable failure-sensitive assertion, a replay command/artifact, and cleanup or reset when needed. A one-off computer-use session is DOGFOOD, not automated UAT; computer-use automation counts only if recorded/scripted to replay and asserted.
- If selected validation lacks a tool, runtime, account, environment, or permission, report `BLOCKED` or `UNRUN` and name it. Do not substitute static inspection or report the selected scope complete.

## Handoff

Use `COMPLETE` only when the working slice and all selected checks passed; `PARTIAL` for a useful slice with failed/unrun selected validation; `BLOCKED` when no useful safe slice exists. Report working result, actual smoke/DOGFOOD/UAT evidence, material deferrals, remaining user action, and `Production readiness: NOT ASSESSED`. Later hardening uses the existing artifact and deferral list, not a restart or a silently extended reduced scope.

**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly, preserve uncertainty, negation, evidence and requested voice; own agent errors with a repair or next safe action. Keep the report compact and never imply deferred work passed.
