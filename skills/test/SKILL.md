---
name: test
description: "Create or repair tests and verification gates for an observable requirement, regression or risky boundary."
---

# Test

Use the existing test stack and the cheapest boundary that observes the requirement. One decisive check can suffice for local logic; shared contracts, authentication, concurrency, persistence, migrations and critical journeys need their relevant boundary evidence. Do not mock away the behaviour being proved.

For a bug, reproduce the failure before the fix when practical. For a poorly tested refactor, characterise existing behaviour. Add only fixtures and assertions needed to distinguish correct from broken output; avoid speculative frameworks and implementation-coupled tests.

Calibrate load-bearing verifiers. Make them inspect the named artifact or service, not merely echo an expected success word. Require process success as well as any success-only output marker. Test an absence detector against a known positive fixture. Calculate supplied quantities independently. Where practical, confirm a representative broken implementation fails, then restore it and confirm the pass.

Control randomness, time, network and shared state. Cover relevant invalid input, failure, cancellation, retry and recovery.

Run changed and required checks against the final relevant revision. Repeat or broaden after changes, failures or unresolved risk, not just to collect more green output. Never delete a difficult test or weaken its assertion to obtain a pass.

Report requirement, command or method, environment, actual result and uncovered scope. Distinguish PASS, FAIL and NOT TESTED. A fixture inventory, static string check or model-written rubric is not evidence of live model behaviour.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

## Standards in use

- When choosing tests, trace each requirement to an observable check; prefer cheap isolated tests, add boundary checks where needed and use properties for invariant-rich inputs. (ISO/IEC/IEEE 29119; practical test pyramid; property-based testing).
- Only when critical state/concurrency risk needs a formal model, model the invariant and counterexamples with the project's chosen method; still test the implementation boundary. (TLA+ (project-local escalation)).
