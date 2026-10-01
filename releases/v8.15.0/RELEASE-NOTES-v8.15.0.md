# V8.15.0 — Three-Driver Communication Kernel

## Changes

- Use three default communication drivers: ASD-STE100-inspired language, ISO 704-inspired terminology, and Diátaxis organization.
- Rewrite all 134 skills, 110 source notes, 24 adapter prompts, 23 live authored companion resources, and root AGENTS.md. Task-specific standards remain selected by task rather than becoming universal prose rules.
- Preserve conditional safety, permission, normative-force, recovery, and evidence contracts. Preserve routing metadata, six profile memberships, authentic source identities and editions, publisher bytes, licenses, and redistribution limits.
- Apply Vale to 268 live authored Markdown files. Correct sentence tokenization and canonical terminology; retain advisory sentence warnings and explicit positive and rejection controls.
- Replace obsolete wording pins with standalone-kernel, boundary, package-reference, and integrity controls. Keep real JSON-Boolean enforcement; Boolean strings remain rejected.
- Pin INI checkout line endings to LF so Windows checkouts preserve the Vale configuration checksum.
- Read release metadata explicitly as UTF-8. This preserves Unicode release summaries and makes PowerShell 7 and Windows PowerShell 5.1 builds byte-identical.

## Install and recovery

Choose one profile ZIP from this release. Review its instructions before trusting them. Merge its AGENTS.md into the trusted project root and configure the host to load the selected skills directory. A skills-only installation must retain each skill’s linked companion resources; listing or copying a skill does not prove activation.

The base collection still has 24 skills: 18 implicitly selectable and six manual-only. Every generated profile includes 27 supplemental routines. The remaining-standards and controlled-execution packs stay source-only and outside generated profiles; their rights and adoption limits still apply.

To roll back, reinstall the V8.14.0 profile and restore its trusted root policy. Do not mix policies, skills, or support resources from different releases. Public history is not rewritten; subsequent corrections use a new release.

## Verification and evidence limits

Source identity is the Git tag v8.15.0. The builder is scripts/build-release.ps1, using deterministic ZIP Store archives. RELEASE-MANIFEST.json records package inventories and archive hashes; CHECKSUMS.sha256 identifies the seven downloadable ZIP archives. These are integrity records, not signed SLSA provenance or an SBOM.

Release gates build twice, compare exact file sets and SHA-256 values, exercise validator rejection controls, validate package inventories and rights, audit repository consistency, and inspect packaged standalone instructions. The supported local build runtimes are PowerShell 7 and Windows PowerShell 5.1. The same checks run in GitHub Actions.

The full rewrite passed 11 CI checks before merge. Release metadata and packages are checked again for this version. Static validation and lint do not prove live host behavior, model performance, security certification, or formal standards conformance. Sentence-length warnings are advisory.

Artifact locations and installation commands are documented in the root README.md. Publisher licensing and source limitations remain in THIRD_PARTY_NOTICES.md and USER-FACING-STANDARDS-NOTICES.md beside the release assets.
