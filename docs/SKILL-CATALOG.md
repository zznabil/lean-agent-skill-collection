# Skill catalogue - V9.0.1

One primary procedure at a time. Conditional references live inside their owning skill; do not load every reference in advance.

| Skill | Trigger |
|---|---|
| [browser-automation](../skills/browser-automation/SKILL.md) | Run authorised browser actions or user-journey checks with stable locators and read-back of the actual result. |
| [debug](../skills/debug/SKILL.md) | Diagnose a defect, performance regression or incident; classify incomplete reports before attempting a fix. |
| [experiment](../skills/experiment/SKILL.md) | Compare a hypothesis or prototype against a controlled baseline with decision-relevant measures and a stopping rule. |
| [gauntlet-loop](../skills/gauntlet-loop/SKILL.md) | Run an explicitly requested bounded adversarial acceptance loop when ordinary verification leaves material hidden-defect risk. |
| [get-it-done](../skills/get-it-done/SKILL.md) | Own an explicitly requested long-running task through implementation, verification and authorised delivery. |
| [handoff](../skills/handoff/SKILL.md) | Record an explicitly requested status, session handoff or durable project context with verified state and the exact next action. |
| [implement](../skills/implement/SKILL.md) | Implement a bounded code change or refactor; resolve conflicts or CLI behaviour when those are part of the change. |
| [office-files](../skills/office-files/SKILL.md) | Create, edit or repair documents, presentations, PDFs and spreadsheets; validate the final file and required visual fidelity. |
| [plan](../skills/plan/SKILL.md) | Plan a multi-step change, architecture decision or unresolved requirement; do not implement a plan-only request. |
| [release](../skills/release/SKILL.md) | Prepare and verify a versioned release; publish and clean up only within the approval already granted. |
| [research](../skills/research/SKILL.md) | Answer an evidence-dependent question from the requested sources, matching the relevant version, date and scope. |
| [review](../skills/review/SKILL.md) | Review a change or artifact for evidence-backed defects and acceptance; remain read-only unless repair is requested. |
| [skill-design](../skills/skill-design/SKILL.md) | Create, consolidate or evaluate an agent skill with a precise trigger, minimal instructions and testable boundaries. |
| [teach](../skills/teach/SKILL.md) | Teach or practise a concept using a plain mechanism, worked example and support matched to the learner. |
| [test](../skills/test/SKILL.md) | Create or repair tests and verification gates for an observable requirement, regression or risky boundary. |
| [wait-what](../skills/wait-what/SKILL.md) | Re-explain or simplify a confusing answer when the user explicitly asks for a clearer version. |
| [writing](../skills/writing/SKILL.md) | Draft or edit prose for its audience and purpose while preserving source meaning and the requested voice. |

## Profiles

**Lean Agent Skills Core (8):** `gauntlet-loop`, `get-it-done`, `handoff`, `plan`, `research`, `review`, `skill-design`, `wait-what`.

**Lean Agent Skills Engineering (14):** `browser-automation`, `debug`, `experiment`, `gauntlet-loop`, `get-it-done`, `handoff`, `implement`, `plan`, `release`, `research`, `review`, `skill-design`, `test`, `wait-what`.

**Lean Agent Skills Complete (17):** `browser-automation`, `debug`, `experiment`, `gauntlet-loop`, `get-it-done`, `handoff`, `implement`, `office-files`, `plan`, `release`, `research`, `review`, `skill-design`, `teach`, `test`, `wait-what`, `writing`.

**User-Facing Communication Mini (3):** `teach`, `wait-what`, `writing`.

**Get It Done Pack (5):** `gauntlet-loop`, `get-it-done`, `teach`, `wait-what`, `writing`.

**Gauntlet Loop Pack (4):** `gauntlet-loop`, `teach`, `wait-what`, `writing`.

## Boundaries

The OpenAI adapters mark get-it-done, gauntlet-loop, handoff and wait-what manual-only. This does not prove enforcement by every host. Global clear reporting does not require routing through wait-what. A plan-only request does not authorise implementation, and a handoff does not authorise rewriting trusted policy.

See [migration](MIGRATION-v9.md) for retired routes and [design](V9-DESIGN.md) for evidence limits.
