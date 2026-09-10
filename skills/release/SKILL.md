---
name: release
description: "Prepare and verify a software or artifact release, including version, changelog, build, package, checksums, migration notes, staged rollout, operations evidence, and rollback. Publish only with explicit authorization."
---

# Release

Use an **ISO/IEC/IEEE 12207-inspired lifecycle** for release, operation, maintenance, recovery, and retirement evidence. Apply **Semantic Versioning** and **Conventional Commits** only when the project adopts them. For consequential supply-chain claims, load `SUPPLY-CHAIN.md` for **SLSA**, **SPDX/CycloneDX**, artifact digests, and **Reproducible Builds**.

1. Define scope, target version, supported environments, approvals, success signals, hard-block dimensions, hold conditions, rollback triggers, and rollback point.
2. Follow repository versioning and commit conventions. Use SemVer or Conventional Commits only when adopted; do not create churn merely to conform.
3. Derive notes from verified diffs and user-visible impact, not commit titles alone. Check both directions: every release-note claim traces to a change, and every breaking or material user-facing change appears or is explicitly excluded.
4. Confirm version consistency, compatibility and migration notes, dependencies, licenses, generated artifacts, and clean working state. For public or high-assurance releases, read `SUPPLY-CHAIN.md`. For a consequential AI asset, verify its current asset card and every evidence-invalidating change. For migrations, verify the sequence and recovery path; destructive contraction comes last.
5. Run the project-defined build, test, static, security, packaging, install, startup, and smoke gates that apply. Record each dimension as `PASS`, `CONCERN`, `BLOCKER`, `NOT APPLICABLE`, or `CANNOT CHECK`; never guess a pass.
6. Independently confirm a proposed blocker against the actual artifact and release scope before issuing `NO-GO`. A pre-existing or disproved issue is not a release blocker.
7. In a clean environment when practical, install the package and execute the critical user or operator journey.
8. For critical production paths, verify the operator questions, telemetry, alert, runbook, and rollback signal required by scope. Test instrumentation instead of assuming it works.
9. Use staged or feature-gated rollout when blast radius justifies it. Advance, hold, or roll back from measured comparison with baseline, not generic thresholds.
10. Inspect archives, permissions, stray files, debug settings, secrets, reproducibility, checksums, and applicable provenance or inventory evidence. Keep integrity, provenance, dependency risk, and correctness separate.
11. Verify branch base and final diff, then state the authorized disposition: review, merge, retain, or discard.
12. Confirm first-use readiness: the artifact is easy to locate; install or use instructions and required configuration are sufficient; rollback or recovery is clear; and the user is told whether any action remains.
13. Produce a release packet with decision, version, changes, upgrade steps, known issues, evidence, skipped checks, artifacts, checksums, applicable provenance or SBOM locations, rollout and monitoring, rollback, branch disposition, approval state, and user-action status.
14. Publish, tag, upload, notify, merge, or deploy only when authorized. Read back external state after the action.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
