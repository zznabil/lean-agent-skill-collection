---
name: release
description: "Prepare and verify a software or artifact release, including version, changelog, build, package, checksums, migration notes, staged rollout, operations evidence, and rollback. Publish only with explicit authorization."
---

# Release

1. Define scope, target version, supported environments, approvals, success signals, hard-block dimensions, hold conditions, rollback triggers, and rollback point.
2. Follow repository versioning and commit conventions. Use SemVer or Conventional Commits only when adopted; do not create churn merely to conform.
3. Derive notes from verified diffs and user-visible impact, not commit titles alone. Check both directions: every release-note claim traces to a change, and every breaking or material user-facing change appears or is explicitly excluded.
4. Confirm version consistency, compatibility and migration notes, dependencies, licenses, generated artifacts, and clean working state. For public or high-assurance releases, read `SUPPLY-CHAIN.md`. For migrations, verify the sequence and recovery path; destructive contraction comes last.
5. Run the project-defined build, test, static, security, packaging, install, startup, and smoke gates that apply. Record each dimension as `PASS`, `CONCERN`, `BLOCKER`, `NOT APPLICABLE`, or `CANNOT CHECK`; never guess a pass.
6. Independently confirm a proposed blocker against the actual artifact and release scope before issuing `NO-GO`. A pre-existing or disproved issue is not a release blocker.
7. In a clean environment when practical, install the package and execute the critical user or operator journey.
8. For critical production paths, verify the operator questions, telemetry, alert, runbook, and rollback signal required by scope. Test instrumentation instead of assuming it works.
9. Use staged or feature-gated rollout when blast radius justifies it. Advance, hold, or roll back from measured comparison with baseline, not generic thresholds.
10. Inspect archives, permissions, stray files, debug settings, secrets, reproducibility, checksums, and applicable provenance or inventory evidence. Keep integrity, provenance, dependency risk, and correctness separate.
11. Verify branch base and final diff, then state the authorized disposition: review, merge, retain, or discard.
12. Produce a release packet with decision, version, changes, upgrade steps, known issues, evidence, skipped checks, artifacts, checksums, applicable provenance or SBOM locations, rollout and monitoring, rollback, branch disposition, and approval state.
13. Publish, tag, upload, notify, merge, or deploy only when authorized. Read back external state after the action.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
