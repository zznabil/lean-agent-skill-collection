---
name: release
description: "Prepare and verify a software or artifact release, including version, changelog, build, package, checksums, migration notes, staged rollout, operations evidence, and rollback. Publish only with explicit authorization."
---

# Release

Use an **ISO/IEC/IEEE 12207-inspired lifecycle** for release, operation, maintenance, recovery, and retirement evidence. Apply **Semantic Versioning** and **Conventional Commits** only when the project adopts them. For consequential supply-chain claims, load `SUPPLY-CHAIN.md` for **SLSA**, **SPDX/CycloneDX**, artifact digests, and **Reproducible Builds**.

1. Define scope, target version, supported environments, approvals, success signals, hard-block dimensions, hold conditions, rollback triggers, and rollback point.
2. Follow repository versioning and commit conventions. Use SemVer or Conventional Commits only when adopted; do not create churn merely to conform.
3. Derive notes from verified diffs and user-visible impact, not commit titles alone. Check both directions: every release-note claim traces to a change, and every breaking or material user-facing change appears or is explicitly excluded.
4. Confirm version consistency, compatibility and migration notes, dependencies, licenses, generated artifacts, and clean working state.
   - For public or high-assurance releases, read `SUPPLY-CHAIN.md`.
   - For a consequential AI asset, verify its current asset card and every evidence-invalidating change.
   - For migrations, verify the sequence and recovery path; destructive contraction comes last.
5. Run the project-defined build, test, static, security, packaging, install, startup, and smoke gates that apply. Record each dimension as `PASS`, `CONCERN`, `BLOCKER`, `NOT APPLICABLE`, or `CANNOT CHECK`; never guess a pass.
6. Independently confirm a proposed blocker against the actual artifact and release scope before issuing `NO-GO`. A pre-existing or disproved issue is not a release blocker.
7. In a clean environment when practical, install the package and execute the critical user or operator journey.
8. For critical production paths, verify the operator questions, telemetry, alert, runbook, and rollback signal required by scope. Test instrumentation instead of assuming it works.
9. Use staged or feature-gated rollout when blast radius justifies it. Advance, hold, or roll back from measured comparison with baseline, not generic thresholds.
10. Inspect archives, permissions, stray files, debug settings, secrets, reproducibility, checksums, and applicable provenance or inventory evidence. Keep integrity, provenance, dependency risk, and correctness separate.
11. Verify branch base and final diff, then state the authorized disposition: review, merge, retain, or discard.
12. Confirm first-use readiness: the artifact is easy to locate; install or use instructions and required configuration are sufficient; rollback or recovery is clear; and the user is told whether any action remains.
13. Produce a release packet with decision, version, changes, upgrade steps, known issues, evidence, skipped checks, artifacts, checksums, applicable provenance or SBOM locations, rollout and monitoring, rollback, branch disposition, approval state, and user-action status.
14. Before publishing, tagging, uploading, notifying, merging, or deploying, state the target and expected result, warn about consequential risks, verify a safe rollback point, and pause for explicit authorization. Read back external state afterward; if it differs, stop dependent steps and report recovery.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Report fresh verification, material uncertainty, remaining user action, and limits—not routine tool narration or praise. Own actual agent errors with correction or next safe action.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly without hiding verified failure or evidenced responsibility.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance or legal authority from stylistic analogies.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not invent a mandate.
- Before risky work, put an ANSI-style warning first, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Use Feynman explanation or SEI CERT contrast only when useful.
- Apply OWASP ASVS, accessibility, or Easy-to-Read guidance only to relevant domain tasks. Intended-user review precedes any Easy-to-Read verification claim.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope; leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat, with distinct content.
