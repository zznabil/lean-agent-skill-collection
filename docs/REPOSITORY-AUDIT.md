# Repository integrity audit — V8.4.0

## Decision

**PASS after repairs, with external-link and live-host limits.**

The audit covered tracked source, metadata, profiles, skill packages, adapters, support references, local links, text encoding, checksums, workflows, deterministic builds, validator rejection controls, the V8.3.0 baseline release, release branches, and the standards register.

## Verified strengths

- The canonical source contains 23 skills, and the Complete profile matches the skill tree.
- PowerShell release builds, validator self-tests, source checks, and archive validation pass.
- Two clean builds are byte-identical.
- The annotated `v8.3.0` baseline tag points to its published merge commit.
- Existing archive checks reject traversal, duplicate members, case collisions, symlinks, and executable payloads.

## Defects repaired

1. Correct stale current-release wording in the README.
2. Add an offline metadata-consistency check across release profiles, package validation, plugin metadata, citation metadata, README, changelog, and release notes.
3. Count the 48 V8.3 scenario rows and verify that documentation and release copies remain byte-identical.
4. Reject leftover release, recovery, overlay, and publishing scaffolds from canonical source.
5. Enforce UTF-8 without BOM, LF line endings, no trailing whitespace, a final newline, and no merge-conflict markers in current source.
6. Enforce the canonical `USER-INFORMATION.md`, CAST UDL, and 48-scenario names and counts.
7. Run the repository audit in both PowerShell 7 and Windows PowerShell 5.1 CI jobs.

## Profile composition

- The standalone Communication profile contains `teach`, `wait-what`, and `writing`.
- The Get It Done profile contains the full Communication profile plus `get-it-done` and `gauntlet-loop`.
- The Gauntlet profile contains the full Communication profile plus `gauntlet-loop`.
- CI compares these unions against the canonical profile lists and rejects missing or duplicate entries.

## Proof-integrity source checks

- The root package metadata pins the reviewed Unlazy commit and states that no runtime is vendored.
- The 40-row proof-integrity scenario corpus is counted from its canonical CSV and compared with the release mirror.
- Required proof-integrity phrases are checked in `AGENTS.md`, `ENGINEERING-CORE.md`, `test`, `get-it-done`, `ORCHESTRATION.md`, `gauntlet-loop`, and `review`.
- No Unlazy checker, dispatcher, installer, Stop hook, approval store, or Node runtime is required by any Lean profile.

## Release gate

V8.4.0 must be tagged from the exact merged commit. Release assets must be rebuilt from that tag, validated, checksummed, uploaded as a separate GitHub Release, and read back after publication. The published V8.3.0 release must remain unchanged.

## Remaining limits

- Static checks do not prove live routing or model compliance in OMP, Codex, or ChatGPT.
- External-link availability can vary by network, geography, authentication, rate limits, and anti-bot policy.
- Standards status requires periodic review against authoritative publishers.
- A tag is not cryptographically signed unless the publishing identity supplies a signing key.
- Formal standards, accessibility, security, or usability conformance is not claimed.
