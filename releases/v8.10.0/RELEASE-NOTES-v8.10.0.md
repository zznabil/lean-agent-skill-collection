# V8.10.0 — Quick Mode

## Change

Add `quick-mode` as a distinct explicit-request task skill for a user-authorised fast path.

Quick Mode delivers the smallest useful working slice, runs one cheap smoke check, discloses material deferrals, marks production readiness `NOT ASSESSED`, and stops before optional hardening. It does not silently weaken retained requirements, permission boundaries, destructive-action controls, data integrity, security, compatibility, accessibility, or evidence truthfulness.

The route is added to Core, Engineering, Complete, and Get It Done. It is absent from Communication and Gauntlet. The Complete profile grows from 23 to 24 skills; Quick Mode joins the implicitly selectable set, which grows from 17 to 18, while the manual-only set remains six.

## Optional interaction validation

Dogfooding and automated UAT remain optional until the user selects them. Once selected, they are required for the Quick Mode scope.

Dogfooding requires the agent to operate the real running project through its intended interface using an appropriate control surface such as Chrome DevTools/CDP, OMP Browser Relay, existing browser automation, native or accessibility automation, CUA/computer use, shell control for a CLI, or an HTTP client for an API.

Automated UAT requires one replayable user journey with a known starting state, user-level actions, an observable assertion, failure-sensitive evidence, a replay command or durable automation artefact, and cleanup or reset where needed. A one-off CUA session is not automated UAT unless it is reproducible and asserted.

Static source inspection, compilation alone, unit tests alone, and an uninteracted screenshot do not satisfy selected dogfooding or UAT.

## Compatibility and evidence

V8.8's 25 preserved instruction roots remain byte- and prose-checked. The preservation gate permits only the declared additive `quick-mode` membership in four profiles and proves that removing it reconstructs the exact V8.8 profile memberships.

The 24 Quick Mode scenarios are authored routing and contract fixtures, not live model runs. Static checks do not establish host tool availability, model adherence, task-success improvement, production safety, or formal conformance.

This PR does not merge, tag, publish, install, deploy, or alter an active agent session.
