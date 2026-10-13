# Repository audit — 2026-10-13

## Scope and decision

Review every open PR, then inspect repository consistency, source provenance, executable boundaries and release requirements. PR #30 was the only open PR. Its four public code cases passed fresh calibration, source/package validation and rejection controls before merge at `de6f4f9461bdbcc4445248bc3bd6ade1e5642f17`.

The baseline inventory contained 594 tracked files, 134 source skills and 110 skill-local source notices. The source skills comprise 24 base skills, 27 integrated supplemental routines, 63 remaining-standards routines, 7 gated routines and 13 controlled-execution routines. The six generated profile totals remain 36, 47, 51, 30, 33 and 31. Publisher documents and historical releases are preserved.

The audit found three defects in existing execution boundaries. Repair them for V8.19.0. Require fresh release gates on the final revision; this audit record alone grants no release pass.

## Findings and repairs

| ID | Severity | Reproduction and impact | Repair and verification |
| --- | --- | --- | --- |
| HERMES-DESTINATION | P1 | Create the pack destination after confirmation and before the staging move. `Move-Item` nests the staged pack and prints `INSTALLED:` while the expected skill path is absent. Later rollback can remove another writer's destination. | Stage under the skills home and use exclusive `Directory.Move` on the same filesystem. Apply identical bytes to all four installer copies. Destination-race controls require failure, preserved concurrent bytes, no nested stage and no policy write. Existing policy-race controls remain. |
| BUILD-LINK | P1 | Put a junction inside `artifacts/` that points to a controlled directory outside `artifacts/`. The builder accepts its lexical prefix, deletes an outside sentinel and writes release files through the junction. | Validate existing output ancestors and descendants for links before deletion or writing. Reuse the inventory tree guard. Positive controls accept existing and new safe paths; negative controls reject outside paths, files, linked parents and linked descendants. The actual builder now rejects the reproduced junction and preserves the sentinel. |
| CI-NATIVE-FAILURE | P1 | A pack step runs several Python commands. An earlier nonzero exit can be replaced by a later successful command. A controlled first-command failure completed the old block without rejection. Main validation also used a weaker duplicate artifact comparison that omitted hidden files. | Check every Python exit immediately on both hosts. Calibrate each failure position against a complete positive block. Reuse the existing artifact comparator, which checks exact names, hidden files and streaming hashes. |

The new regression tests rejected the old installer and workflow. The repaired controls ran successfully on PowerShell 7 and Windows PowerShell 5.1. Fresh builds and final-commit CI remain separate release gates.

## Consistency coverage

- Enumerate every tracked path. Parse live JSON with duplicate-key rejection and parse Python source. Check source skill names against directory names and the fewer-than-100-line limit.
- Resolve local Markdown file links and heading anchors across live authored files. Historical `dist/` and `releases/` snapshots and bundled publisher texts are checked through their existing inventories rather than treated as current instructions.
- Compare canonical skills, adapter invocation flags, catalogue rows, root policy maps, supplemental membership and all six profile definitions. Independently recompute supplemental line/word counts and optional routine line counts.
- Inspect the PR evaluator, manifest, broken examples, repairs, controls, validator integration and documentation limits. Calibration rejects invalid code, incomplete output, forged markers and timeouts; public fixture results do not prove live skill use.
- Inspect installers, builders, validators, CI entrypoints and source-pack builders. Preserve source licensing notices and baseline pins. Re-run source/archive checks, damaged controls, publisher-baseline checks, prose preservation and deterministic builds on the final release revision.

## Source cross-checks

The [11 October ledger](UPSTREAM-PROVENANCE-2026-10-11.json) remains a dated record. GitHub's commit API resolved all 43 primary repository pins and both supporting repository pins to their exact recorded SHA values on 13 October. Root license metadata was checked at all 43 primary pins. Component-specific, missing and ambiguous notices remain explicit; GitHub's detected license is not substituted for full component terms. No new upstream code is imported.

The two paper identities and versions resolve to the authoritative records for [HORIZON](https://arxiv.org/abs/2606.28279v1) and [AVO](https://arxiv.org/abs/2603.24517v1). The repository does not infer a recovered historical review pin from those versions.

The scoped communication references remain consistent with [RFC 8174](https://www.rfc-editor.org/info/rfc8174/), [WCAG 2.2](https://www.w3.org/TR/WCAG22/) and [Diátaxis](https://diataxis.fr/). The ASD-STE100 publisher site was unavailable to this retrieval; its existing linked source and access limitation remain. Restricted standards were not obtained or assessed clause by clause. Publisher-baseline and checksum tests verify the bundled snapshots, not that every mutable publisher page still serves identical bytes.

## Evidence and release requirements

Run the commands in the root README and CI, including `scripts/test-build-output.ps1` and `scripts/test-workflow-gates.ps1`. Run `scripts/test-hermes-install.ps1 -Installer <path>` for the root installer and each of the three pack copies. Require each process to succeed and inspect its specific success marker or structured report.

The public release evidence must name the exact source commit, environment, commands, results, archive digests and current CI runs. Build fresh assets after tagging, download every published asset and compare bytes. Earlier public tags and releases remain unchanged.

This is a repository consistency and execution-boundary audit. It does not certify security, accessibility, formal standards conformance or universal model obedience. No fresh live OMP, Codex or Hermes agent trial, user-comprehension study, upstream runtime execution or cross-model independent review is claimed.
