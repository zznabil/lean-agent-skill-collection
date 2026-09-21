# Quick Mode design — V8.10.0

## Decision

Add `quick-mode` as one explicit-request task skill.

Quick Mode is not a general low-scrutiny router. It activates only when the user authorises a reduced acceptance scope for a rough working version, prototype, or equivalent fast path.

The leading action is distinct:

> produce the smallest useful working slice now, run one cheap reality check, disclose deferrals, and stop.

`implement` still owns the smallest complete bounded change. `test` owns sufficient verification. `get-it-done` owns sustained completion. `gauntlet-loop` owns justified adversarial acceptance. Quick Mode does not replace those routes.

## Why the V8.5 decision changes

V8.5 correctly rejected an automatically selected “low-scrutiny” skill because it would compete with existing owners and could silently weaken required evidence.

The new route has a different contract:

- explicit user request required, with natural-language selection allowed;
- user-authorised scope reduction;
- unchanged permission, safety, data, security, compatibility, and accessibility floors;
- a smoke check by default rather than zero verification;
- visible `NOT ASSESSED`, `UNRUN`, `BLOCKED`, and deferred states;
- no production-readiness claim;
- selected dogfooding or automated UAT becomes required.

The historical V8.5 record remains unchanged. This document records the later, narrower exception.

## Validation modes

### Smoke

Quick Mode runs one cheap check that observes the selected working result through the real artefact or product boundary when practical.

### Dogfooding

Dogfooding requires the agent to control and use the actual running project through its intended user surface. Appropriate tools include Chrome DevTools/CDP, OMP Browser Relay, existing browser automation, native UI automation, accessibility automation, CUA/computer use, shell control for a CLI, and an HTTP client for an API.

Source inspection, compilation alone, unit tests alone, and an uninteracted screenshot are not dogfooding evidence.

### Automated UAT

Automated UAT requires one repeatable acceptance journey with:

- known starting state;
- user-level actions;
- observable assertion;
- failure-sensitive evidence;
- replay command or durable automation artefact;
- cleanup or reset when needed.

A one-off CUA session can be dogfooding or interactive UAT. It counts as automated UAT only when it is reproducible and asserted.

## Tool selection

Use the narrowest reliable surface:

1. existing project-native acceptance harness;
2. structured browser or application protocol;
3. native or accessibility automation API;
4. CUA/computer use;
5. the actual CLI or API when that is the product interface.

Do not pretend an unavailable tool ran. A selected interaction mode that cannot run remains `BLOCKED` or `UNRUN` and prevents `COMPLETE`.

## Profiles and invocation

Quick Mode is included in:

- Core;
- Engineering;
- Complete;
- Get It Done.

It is absent from Communication and Gauntlet. Its OpenAI adapter permits natural-language selection, while the skill contract requires an explicit fast-path request.

This changes the Complete inventory from 23 to 24 skills. The manual-only inventory remains six, and the implicitly selectable inventory grows from 17 to 18.

## Evidence boundary

The included scenario corpus is authored policy and routing evidence. Static validation can confirm files, inventory, metadata, profile membership, packaging, and required clauses. It does not establish live routing, tool availability, model adherence, task-success improvement, or production safety.
