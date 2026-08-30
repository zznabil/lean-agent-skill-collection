# Repository integrity audit — V8.3.0 post-release hardening

## Decision

**PASS after repairs, with external-link and live-host limits.**

The audit covered tracked source, metadata, profiles, skill packages, adapters, support references, local links, text encoding, checksums, workflows, deterministic builds, validator rejection controls, the published V8.3.0 release, tag alignment, release branches, and the standards register.

## Verified strengths

- The canonical source contains 23 skills, and the Complete profile matches the skill tree.
- PowerShell release builds, validator self-tests, source checks, and archive validation pass.
- Two clean builds are byte-identical.
- The annotated `v8.3.0` tag points to the V8.3.0 merge commit.
- Published V8.3.0 asset digests match a clean deterministic build where GitHub exposes a digest.
- Existing archive checks reject traversal, duplicate members, case collisions, symlinks, and executable payloads.

## Defects repaired

1. Correct stale current-release wording in the README.
2. Add an offline metadata-consistency check across release profiles, package validation, plugin metadata, citation metadata, README, changelog, and release notes.
3. Count the V8.3.0 scenario rows and verify that documentation and release copies remain byte-identical.
4. Reject leftover release, recovery, overlay, and publishing scaffolds on canonical source.
5. Enforce UTF-8 without BOM, LF line endings, no trailing whitespace, a final newline, and no merge-conflict markers in current source.
6. Enforce the canonical `USER-INFORMATION.md`, CAST UDL, and 48-scenario names and counts.
7. Run the new repository audit in both PowerShell 7 and Windows PowerShell 5.1 CI jobs.

## Repository-state cleanup

Merged release and operations branches are separate Git references, not source files. Remove them only after proving that their tips are ancestors of `main` and that no open pull request uses them. The active hardening branch remains until review is complete.

## Remaining limits

- Static checks do not prove live routing or model compliance in OMP, Codex, or ChatGPT.
- External-link availability can vary by network, geography, authentication, rate limits, and anti-bot policy.
- Standards status requires periodic review against authoritative publishers.
- The V8.3.0 tag and release are unsigned because no signing key was available to the publishing workflow.
- Formal standards, accessibility, security, or usability conformance is not claimed.
