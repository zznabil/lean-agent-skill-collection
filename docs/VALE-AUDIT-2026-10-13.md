# Repository and Vale audit — 2026-10-13

## Scope and baseline

Review all open PRs and refresh repository consistency and release checks. Inspect Vale rules, file selection, workflow inputs and failure controls. Preserve source rights, original publisher bytes, skill routes and profile membership.

PR #32 was the only open PR at the start. It changes the PR template and contribution instructions. Its recorded tree hash matches the checked-out revision. Both changed files pass Vale 3.23.0. Both collection CI hosts passed before its reviewed head was merged.

The repository baseline remains 134 source skills and six profiles. The previous repository audit remains a dated record. Fresh final-revision checks are required for this release.

## Findings and repairs

### VALE-SCOPE — P2, fix before release

The old workflow selected 269 Markdown files. It omitted contributor instructions, the PR template, pack instructions and several companion documents. Its path filters also prevented those files from starting Vale CI. PR #32 disclosed that Vale had not checked its two changed files.

The shared `scripts/vale-files.py` selector now covers authored root, contributor, documentation, skill and pack Markdown. It also selects the current release notes from `release-profiles.json`. Publisher copies, copied licences, historical release snapshots and generated working files remain excluded.

CI and direct checks use the same file list. The direct check processes every selected file in bounded batches. It requires process success and zero error diagnostics. A processed-file count guards against omitted batches.

The omission control puts terminology errors in four previously omitted locations. The old clean subset passes. The shared selector exposes all four errors and returns failure. Separate controls check included and excluded paths and deterministic ordering.

### VALE-TERM — P2, fix before release

The authored attribution summary used `Diataxis`; its own attribution heading used Diátaxis. Vale reported the summary spelling as an error. Correct the summary to Diátaxis and refresh the dependent notice hash and integrity records.

This corrects an authored source name. It changes no licence grant, attribution actor, publisher copy or adaptation status. The CC BY-SA 4.0 boundary remains explicit.

## Rules and execution

The three terminology substitutions remain unchanged. They reject case-insensitive aliases and accept canonical source names. Metadata fields, inline code and fenced code retain their existing exceptions.

The sentence rule remains advisory at more than 35 matched words. The 35-word control has no sentence warning. The 36-word control reports a warning and exits successfully. Longer source conditions are not defects solely because they produce an advisory warning.

The existing [Vale action](https://github.com/vale-cli/vale-action/tree/518a9136acc6e6668ce7c00d367051e0941e87ff) is pinned to its inspected commit. Its installer checks downloaded Vale and reviewdog archives against published checksums. Set `filter_mode: nofilter` and `fail_level: error` explicitly. A direct full-corpus CLI check provides an additional gate after annotation reporting.

The local Vale 3.23.0 Windows archive matched both the official checksum file and GitHub's asset digest before execution. No machine installation or PATH change was made. The rule and scope controls passed on PowerShell 7 and Windows PowerShell 5.1.

The first repaired CI run exposed a reporting limit: 21 advisory warnings exceeded GitHub's annotation quota and made reviewdog fail despite zero prose errors. Limit annotation reporting to errors. The direct full-corpus gate still checks and counts warnings. Its 35/36-word controls require warnings to remain nonblocking. Require a fresh successful CI run after this repair.

A separate encoding probe showed that Windows PowerShell 5.1 misreads the accented name in a UTF-8 script without a byte-order mark. The old canonical-name fixture therefore did not prove the intended spelling on that host. Construct the accented character from its Unicode value and verify the written UTF-8 bytes before invoking Vale. Keep script literals ASCII so both hosts test the same canonical name.

The [Vale scope documentation](https://docs.vale.sh/topics/scopes) distinguishes prose from code and metadata. Observed behavior from the pinned binary remains the acceptance evidence for this release.

## Repository cross-checks and release gates

Re-run JSON and Python parsing, local links and anchors, source names and line limits, catalogue/profile inventories and independent counts. Re-run source and publisher integrity checks, rejection controls, all four installers, prose preservation and byte-reproducible builds on both PowerShell hosts.

Require current PR CI and exact merged-main CI before tagging. Build fresh tagged profiles and all three standalone packs. Publish a separate release, download every asset and compare hashes and bytes. Preserve previous public releases and unrelated local work.

The published evidence must record exact revisions, commands, file counts, diagnostic counts and results. This audit report alone grants no pass. Historical reports remain evidence of their own tested revisions.

No live model trial, contributor-comprehension study, cross-model independent review or formal standards assessment is claimed. Lint and structural checks do not prove agent obedience, security certification or standards conformance.
