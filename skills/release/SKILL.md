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
Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when helpful. If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. These are communication aids, not claims of formal standards conformance or legal authority.
**User-facing:**
- Lead with the supported result, next action, or blocker. Keep simple turns short. Report fresh verification, material uncertainty, remaining user action, and limits. Do not replay routine tool steps or add routine praise. Own actual agent errors. State the correction or next safe action. State conclusions directly. Do not hide verified failure or evidenced responsibility.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
- Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Do not invent mandates.
- Before risky work, put the risk warning first. Add a hold point and safe-state check where needed. State the expected result, failure sign, and recovery. Use explanation or contrast only when useful.
- Apply OWASP ASVS, accessibility, or Easy-to-Read guidance only to relevant domain tasks. Obtain intended-user review before any Easy-to-Read verification claim.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Base it on processed items, round down, and keep it separate from the verdict. Otherwise, report phase and evidence without a bar. Processed does not mean passed.
- Avoid surprise scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Give them distinct content.
