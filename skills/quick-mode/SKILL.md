---
name: quick-mode
description: "Deliver a user-authorised working slice fast, with one cheap reality check and visible deferrals. Use only when the user explicitly requests Quick Mode, a rough prototype, or an equivalent fast-path scope; not for quick questions or short replies."
---

# Quick Mode

Deliver the smallest useful working result now. Defer nonessential ceremony, hardening, broad validation, and polish without hiding what remains.

## Activation and boundary

Quick Mode requires an explicit user request. It can be selected from natural language or by direct skill invocation only when the user requests Quick Mode or clearly authorises a rough working version, fast prototype, or reduced acceptance scope.

Do not activate it merely because the user says “quick question”, requests a short answer, or asks how fast something is.

Quick Mode changes the accepted scope from the smallest complete production-capable solution to the smallest useful working slice. It does not create permission to ignore a requirement that the user kept in scope.

Use one foreground owner. Do not create a separate plan, durable state, delegation tree, Gauntlet, broad audit, speculative refactor, or unrelated cleanup unless the user separately requests it or a non-deferrable risk requires it.

## Non-negotiable floor

Quick Mode MUST preserve:

- explicit in-scope behaviour and acceptance conditions;
- authorisation, access, privacy, secrets, and trust boundaries;
- safeguards for destructive, irreversible, costly, external, or production actions;
- data integrity and the minimum recovery needed for material loss;
- required security, compatibility, and accessibility constraints;
- honest separation of passed, failed, blocked, and unrun checks;
- host, system, legal, and safety rules.

Quick Mode MUST NOT weaken an existing test to obtain a pass, label an unrun check as passed, infer success from silence, deploy or publish without normal authorisation, or represent the result as production-ready by default.

For a consequential action, produce the fastest safe substitute when possible: a dry run, preview, disposable prototype, local patch, simulated environment, reversible branch, or unsigned draft.

## Fast path

1. Write one sentence that defines the working slice, one cheap reality check, and the main deferred work.
2. Inspect only the files, runtime, interfaces, and constraints needed for that slice.
3. Reuse existing project mechanisms, the standard library, native platform features, or installed dependencies before adding new structure.
4. Build the thinnest end-to-end slice that produces an observable result.
5. Run one cheap smoke check against the real artefact or its actual product boundary.
6. Repair only defects that block the selected slice or its non-negotiable floor.
7. Report the working result, executed evidence, failed or unavailable checks, and material deferrals.
8. Stop. Optional polish and hardening must justify a separate scope.

A build, import, parse, launch, rendered view, representative API request, small fixture, or direct CLI run can be the smoke check when it observes the selected outcome and can fail honestly.

If no practical smoke check is available, report `SMOKE: UNRUN` with the exact missing environment, dependency, permission, or tool. The artefact may still be delivered, but the result is not verified.

## Optional interaction validation

Dogfooding and automated user acceptance testing are optional before selection. Once the user selects either mode, it becomes a required part of the Quick Mode scope.

### DOGFOOD

The agent MUST operate the actual running project through its intended user-facing surface and complete one representative user task.

Use an appropriate interaction tool, such as:

- the project’s existing browser, desktop, mobile, game, CLI, or API harness;
- Chrome DevTools or the Chrome DevTools Protocol;
- OMP Browser Relay or equivalent browser-control tooling;
- Playwright, Cypress, WebDriver, Puppeteer, or an existing browser stack;
- Appium, native UI automation, or platform accessibility automation;
- CUA or computer-use control for an otherwise opaque interface;
- shell control when the CLI is the actual user interface;
- an HTTP client when the API is the product interface.

Static source inspection, compilation alone, unit tests alone, or an uninteracted screenshot do not satisfy DOGFOOD.

For DOGFOOD:

1. Start from a known state.
2. Operate the real built or served artefact.
3. Perform one representative intended task.
4. Observe the user-visible or system-visible result.
5. Record material side effects.
6. Clean up disposable state when appropriate.
7. Report `PASS`, `FAIL`, `BLOCKED`, or `UNRUN`.

### AUTOMATED UAT

The agent MUST run or create one repeatable automated acceptance journey through the real product boundary.

The journey MUST include:

- a defined starting state;
- user-level actions;
- at least one observable acceptance assertion;
- failure-sensitive evidence;
- a replay command or durable automation artefact;
- cleanup or state reset when required.

Prefer the project’s existing automation stack. Do not install a large new framework solely for one Quick Mode journey unless the user requests it.

A CUA-driven journey counts as automated UAT only when it is sufficiently recorded or scripted to replay and its outcome is asserted. A one-off computer-use session is DOGFOOD or interactive UAT, not repeatable automated UAT.

### Tool selection

Use the narrowest reliable control surface in this order:

1. existing project-native acceptance harness;
2. structured browser or application protocol;
3. platform accessibility or native automation API;
4. CUA or computer-use interaction;
5. the actual CLI or API surface when that is the product.

Prefer structured deterministic control for repeatable UAT. Prefer realistic interface interaction for dogfooding.

If a selected interaction mode cannot run because no suitable tool, runtime, account, environment, or permission is available:

- report the mode as `BLOCKED` or `UNRUN`;
- state the exact missing capability;
- do not substitute source review and call it dogfooding or UAT;
- do not report the selected Quick Mode scope as complete.

## Completion and handoff

Use these states:

- `COMPLETE` — the selected working slice exists and every selected validation mode passed.
- `PARTIAL` — the implementation is useful, but a selected validation mode failed or remains unrun.
- `BLOCKED` — no useful in-scope working slice can be produced safely.

Report:

```text
Quick-scope outcome: <COMPLETE | PARTIAL | BLOCKED>

Working result:
<what now works>

Evidence:
<smoke, dogfood, and automated UAT actually executed>

Deferred:
<material unrun hardening, checks, or polish>

Production readiness:
NOT ASSESSED
```

When the user later requests hardening or production readiness, hand the existing artefact and its deferral list to `implement`, `test`, `get-it-done`, or `gauntlet-loop` as appropriate. Do not rebuild from zero or silently carry the reduced acceptance scope forward.

**User-facing:**

- Apply the global outcome-first delivery overlay.
- State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility.
- Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artefact voice.
- Own actual agent errors without inventing blame; give the correction or next safe action within existing permissions.
- Keep the final report compact: working result, fresh evidence, material deferrals, production-readiness status, and remaining user action.
- Do not replay routine tool calls or imply that deferred work passed.
