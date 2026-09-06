# V9.0.1 - Lean Standards, Explicit Behaviour

This release ships the 17-skill V9 consolidation and repairs standards activation lost in the local V9.0.0 candidate. The preceding public version is V8.7.0; V9.0.0 was never tagged or published.

## Changes

All 97 standards-register entries have explicit local ownership. Concrete triggers, behaviours and short source references stay at the point of use; specialised references load only for their stated scope. Historical source editions, review dates and adoption decisions are preserved. Watched, deferred and globally rejected practices are not silently activated.

ASD-STE100-inspired clarity, ISO 24495-1 plain language and W3C COGA are restored to global communication. A one-sentence standalone fallback protects hosts that do not inject AGENTS.md. Feynman-style explanation, Diataxis, BCP 14, accessibility, assurance, API and lifecycle guidance activate only when their task needs them. No new routed skill, runtime, hook or external dependency is added.

## Packages and migration

Six profiles: Complete 17, Engineering 14, Core 8, Communication 3, Get It Done 5, Gauntlet 4. Both task packs retain the full communication trio. Install one profile per scope. Publication does not update local trusted instructions or installed skills. Read docs/MIGRATION-v9.md and review the AGENTS.md diff before replacing an installation.

## Verification and limits

Required gates: reproducible builds, structural and source/package checks, mutation controls, repository audit, both PowerShell 7 and Windows PowerShell 5.1 on PR and exact main, annotated tag, then draft and public asset readback. Actual run results live in CI and release evidence; this document does not pre-award a pass.

Ownership checks prove presence, mapping and packaging, not model obedience or formal standards conformance. The 64 V9 behavioural scenarios and new standards scenarios are authored, not live-model evaluations. No GPT-5.6/GPT-6 task-success, latency or token-saving improvement is claimed.

## Release procedure

Use an unused annotated v9.0.1 tag on the exact main revision after both checks pass. Upload draft assets, download and compare every asset against that build, publish without overwriting any previous release, and repeat public readback. Clean only identified temporary branches after verifying their heads and work.
