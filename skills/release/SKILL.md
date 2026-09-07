---
name: release
description: "Prepare and verify a versioned release; publish and clean up only within the approval already granted."
---

# Release

Inspect the current branch, version, open work and repository release policy. Establish the exact authorised disposition: prepare, PR, merge, tag, publish or deploy. Reuse standing approval within scope; do not stop for another approval when it is already granted.

Choose an unused version; preserve earlier tags and releases. Derive notes, breaking changes, migration and limitations from the diff. Check metadata, licences, profiles, artifacts and recovery together.

Run every required gate on the latest candidate and supported environments. Review the diff and actual package contents. Confirm checks can fail meaningfully; a build-generated declaration is not a test result. Do not weaken branch protection or bypass a failed or missing required check.

Merge only the reviewed head after required PR checks pass. Read back the merge revision and verify required exact-main checks. Build and tag that exact source using the repository's tag policy. Publish only after authorised gates pass; inspect external state after ambiguous writes before retrying.

Report version, user-visible change, migration, actual checks, skipped checks and artifact locations. Distinguish built, merged, tagged, uploaded and publicly released. A signed tag, reproducible build and correct program are separate claims. Failure at a required gate means blocked delivery, not permission to manufacture a pass.

For published assets, verify inventory, paths, digests and the practical first-use journey. Download draft assets and compare bytes and contents before publication; repeat public readback and verify the tag target. Remove only identified, completed temporary branches after checking their heads and unmerged work.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

For required provenance, SBOM or reproducible-build evidence, use [SUPPLY-CHAIN.md](SUPPLY-CHAIN.md).

## Standards in use

- When preparing a versioned release, classify compatibility under the project-adopted version scheme and write an accurate change summary; use commit conventions only where the project adopts them. (Semantic Versioning; Conventional Commits).
