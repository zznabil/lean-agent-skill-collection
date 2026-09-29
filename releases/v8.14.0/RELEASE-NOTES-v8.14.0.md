# V8.14.0 — Task Brief and Context Preflight

## Changes

- Add a manually invoked Task Brief / Context Preflight mode to the existing `project-context` skill. No 25th base skill, implicit route, or profile membership change.
- Use Direct, Standard, or Durable depth to record the minimum sufficient context. Classify material items as `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`; end with a readiness state, next action, and freshness trigger.
- Durable records identify the brief, accountable owner, revision, and traceable material items. A brief is not proof that implementation or verification occurred.
- Require the linked `TASK-BRIEF.md` support file in source and packaged Engineering and Complete profiles. The validator rejects a missing-file fixture.
- Keep Map/Explain separate from Task Brief: linked files are pointers until actually read, not evidence for a map.

## Install and recovery

Choose one profile ZIP. Engineering and Complete contain `project-context`; the other four profile memberships remain unchanged. Merge the selected `AGENTS.md` into the trusted project root and configure the host to load that profile's `skills/` directory. A skills-only installation must include `project-context/SKILL.md` and `project-context/TASK-BRIEF.md` together; it does not activate the full root policy.

To roll back, reinstall the V8.13.0 profile and restore its trusted root policy. Do not mix skills or policies from different releases.

## Evidence boundary

Release gates check current source integrity, exact package contents, deterministic builds, and a missing-support-file rejection control. Live routing and the quality or completeness of an actual brief require separate observation; static package checks do not prove model behavior. Optional source packs remain outside generated profiles and retain their separate rights and validation contracts.
