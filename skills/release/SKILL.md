---
name: release
description: "Prepare and verify a software or artifact release, including version, changelog, build, package, checksums, migration notes, staged rollout, operations evidence, and rollback. Publish only with explicit authorization."
---
# Release
Use an **ISO/IEC/IEEE 12207-inspired lifecycle** to collect evidence for release, operation, maintenance, recovery, and retirement. Apply **Semantic Versioning** and **Conventional Commits** only if the project adopts them. For consequential supply-chain claims, load `SUPPLY-CHAIN.md` for **SLSA**, **SPDX/CycloneDX**, artifact digests, and **Reproducible Builds**.
## Composition
For a composed task, use one primary lifecycle owner: the explicit user-designated owner; otherwise selected `get-it-done`; otherwise the unique substantive task skill after assigning support roles. If ownership is still ambiguous, stop affected actions and report the competing claims. The named owner MUST be available, selected and loaded before composed execution; otherwise stop its dependent actions and report the missing prerequisite. Safe independent inspection may continue. Availability alone proves neither selection nor loading. Alone, this skill retains its normal ownership and status rules.
When supporting, own release evidence and the publication go/no-go decision within the owner's scope. Quick Mode MUST NOT weaken required checks, approvals, artifact integrity or public-state verification. Reduced delivery scope is not publication permission. An already explicit authorization covers only its stated target and action; still verify hold points and read back external state.
Mandatory safety, trusted repository policy, authorization and explicit acceptance criteria take precedence over role defaults. A supporter MUST NOT claim task completion or change permissions. Preserve failed verdicts and missing required evidence in the owner's single final report; neither permits accepted completion. Presentation changes no facts, scope or verdicts.

1. Define the scope, target version, supported environments, approvals, success signals, hard-block dimensions, hold conditions, rollback triggers, and rollback point.
2. Follow repository versioning and commit conventions. Use SemVer or Conventional Commits only if adopted. Do not create churn merely to conform.
3. Derive notes from verified diffs and user-visible impact. Do not rely on commit titles alone. Check both directions: trace every release-note claim to a change; include every breaking or material user-facing change, or explicitly exclude it.
4. Confirm version consistency, compatibility and migration notes, dependencies, licenses, generated artifacts, and a clean working state.
   - For public or high-assurance releases, read `SUPPLY-CHAIN.md`.
   - For a consequential AI asset, verify its current asset card and every change that invalidates evidence.
   - For migrations, verify the sequence and recovery path. Perform destructive contraction last.
5. Run all applicable project-defined build, test, static, security, packaging, install, startup, and smoke gates. Record each dimension as `PASS`, `CONCERN`, `BLOCKER`, `NOT APPLICABLE`, or `CANNOT CHECK`. Never guess a pass.
6. Before issuing `NO-GO`, independently confirm a proposed blocker against the actual artifact and release scope. A pre-existing or disproved issue is not a release blocker.
7. Install the package in a clean environment when practical. Execute the critical user or operator journey.
8. For critical production paths, verify the operator questions, telemetry, alert, runbook, and rollback signal required by scope. Test instrumentation. Do not assume it works.
9. Use staged or feature-gated rollout if the blast radius justifies it. Advance, hold, or roll back based on measured comparison with the baseline. Do not use generic thresholds.
10. Inspect archives, permissions, stray files, debug settings, secrets, reproducibility, checksums, and applicable provenance or inventory evidence. Keep integrity, provenance, dependency risk, and correctness separate.
11. Verify the branch base and final diff. State the authorized disposition: review, merge, retain, or discard.
12. Confirm first-use readiness. Check that the artifact is easy to locate, install or use instructions and required configuration are sufficient, and rollback or recovery is clear. Tell the user whether any action remains.
13. Produce a release packet. Include the decision, version, changes, upgrade steps, known issues, evidence, skipped checks, artifacts, checksums, applicable provenance or SBOM locations, rollout and monitoring, rollback, branch disposition, approval state, and user-action status.
14. Before publishing, tagging, uploading, notifying, merging, or deploying, state the target and expected result. Warn about consequential risks. Verify a safe rollback point. Pause for explicit authorization. Read back external state afterward. If it differs, stop dependent steps and report recovery.
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
