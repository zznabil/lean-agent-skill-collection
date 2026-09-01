# Repository integrity audit — V8.5.1

## Decision

**PASS after repairs, with external-link and live-host limits.**

The audit covered tracked source, metadata, profiles, skill packages, adapters, support references, local links, text encoding, checksums, workflows, deterministic builds, validator rejection controls, release branches, and the standards register.

## Verified strengths

- The canonical source contains 23 skills, and the Complete profile matches the skill tree.
- PowerShell release builds, validator self-tests, source checks, and archive validation pass.
- Two clean builds are byte-identical.
- Existing archive checks reject traversal, duplicate members, case collisions, symlinks, and executable payloads.
- The V8.5 proportional-rigor behavior is unchanged by this maintenance patch.

## Repository repairs retained from V8.3.1

1. Cross-file metadata consistency across release profiles, package validation, plugin metadata, citation metadata, README, changelog, and release notes.
2. Evaluation scenario counts and byte-identical documentation/release mirrors.
3. Rejection of leftover release, recovery, overlay, and publishing scaffolds.
4. UTF-8 without BOM, LF endings, no trailing whitespace, a final newline, and no merge-conflict markers in current source.
5. Canonical support-file checks and cross-platform repository auditing.

## V8.5.1 validator portability repair

- Validation contract files are read explicitly as UTF-8 rather than through the Windows PowerShell 5.1 default ANSI code page.
- The U+2192 needle is constructed from `[char]0x2192`, so the script parser does not depend on the source file's interpretation of that literal.
- The repair changes no skill, route, profile, scenario, package membership, or acceptance contract.

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

## Proportional-rigor source checks

- Package metadata declares DIRECT, STANDARD, DEEP, and ADVERSARIAL modes and the 48-row canonical scenario file.
- The scenario corpus is counted from the CSV and compared byte-for-byte with its release mirror.
- Required mode and anti-underbuilding phrases are checked in `AGENTS.md`, `ENGINEERING-CORE.md`, `plan`, `implement`, `test`, `review`, `debug`, `get-it-done`, `ORCHESTRATION.md`, `gauntlet-loop`, and `wait-what`.
- The 23-skill inventory and all six profiles remain unchanged.

## Release gate

V8.5.1 must be tagged from the exact merged commit. Release assets must be rebuilt from that tag, validated on both supported PowerShell hosts, checksummed, uploaded as a separate GitHub Release, downloaded again, and compared byte-for-byte. The published V8.5.0 release must remain unchanged.

## Remaining limits

- Static checks do not prove live routing or model compliance in OMP, Codex, or ChatGPT.
- External-link availability can vary by network, geography, authentication, rate limits, and anti-bot policy.
- Standards status requires periodic review against authoritative publishers.
- A tag is not cryptographically signed unless the publishing identity supplies a signing key.
- Formal standards, accessibility, security, or usability conformance is not claimed.
