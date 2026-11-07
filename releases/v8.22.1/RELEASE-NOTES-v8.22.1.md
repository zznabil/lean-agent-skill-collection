# V8.22.1 — OMP Source-read Evidence Repair

Release date: 2026-11-08.

## Changes

- Recognise OMP skill results whose header names the expected packaged source. Retain raw reads, raw selectors, displayed range context and exact rereads of truncated lines.
- Reject mismatched headers, reordered or unmatched numbered output, altered content, failed or unpaired reads and reads after the decision boundary. Count only verified source lines; distant reader anchors do not extend the normal context window.
- Calibrate both composition and communication evaluators with valid and broken cases. Source-line coverage is not byte attestation, runtime activation or whole-skill obedience.
- Preserve the 24 base skills, 27 supplemental routines, source-only optional packs, skill routing and upstream licences. This patch adds no skill, runtime, dependency or host hook.

## Installation and upgrade

Download `lean-agent-skills-complete-openai-v8.22.1.zip` and the release integrity records. Verify the downloaded digest before extraction. Follow the [V8.22.0 installation and upgrade procedure](../v8.22.0/RELEASE-NOTES-v8.22.0.md#installation-and-upgrade): back up only collection-owned paths and their absence state; preserve unrelated host skills, policy, configuration and later edits. Start a new host session and verify discovery and the resources the task uses. Keep the previous verified package for rollback.

The evaluator repair is in the repository's `scripts/` directory. Installing the skill package alone does not update an existing repository checkout or prove host activation.

## Acceptance and recovery

Apply the existing [release audit](../../docs/AUDIT.md): fresh failure-sensitive evaluator controls, source and archive validation, reproducible builds and installer boundaries on both supported PowerShell hosts; actual isolated package journeys; independent review and judge; current PR and merged-main CI; and downloaded-asset verification. Record missing or failed gates instead of treating this note as a pass.

Do not overwrite an existing tag or published asset. If a published release needs correction, prepare a new reviewed release. Restore only backed-up collection-owned paths and preserve unrelated changes.
