# V8.13.0 full-skill kernel repository checks

The audit checks all 134 source skills, including both source-only packs, for fewer than 100 lines per `SKILL.md`. Static validation pins the OMP corpus and runner, checks source hashes and package structure, and excludes tool-generated `.patchloom/` backups from source-link hygiene. All six profiles must carry the governing kernel with unchanged memberships. Live-host behavior is observed separately; static checks do not prove it.

The root-policy audit counts `AGENTS.md` lines and rejects 100 or more; the current file remains below 100 lines. Package checks require the exact base-skill subset and all 27 supplemental rows in each of six generated profiles.

Earlier V8.8 textual-fingerprint and V8.10.1 Quick Mode acceptance language below is historical where it conflicts with deliberate communication-prose edits.

---

# V8.10.1 Quick Mode repository acceptance

The current V8.10.1 release contains 24 canonical skills. The prior V8.8 instructions remain the preservation baseline; `quick-mode` is the only added root.

## Current candidate invariants

- 24 canonical skills and six profiles.
- Six manual-only skills and 18 implicitly selectable skills.
- Quick Mode appears in Core, Engineering, Complete, and Get It Done only.
- The Complete profile matches the canonical skill tree.
- Communication remains embedded in Get It Done and Gauntlet.
- All 23 specialist skills retain a local outcome-first fallback.
- All 24 OpenAI adapters retain the delivery overlay.
- V8.8's 25 preserved instruction roots, references, adapters, register, and historical files retain their declared baselines.
- The 24-case Quick Mode corpus is unique and byte-identical to its release mirror.
- Deterministic builds and archive checks remain required on PowerShell 7 and Windows PowerShell 5.1.

## Quick Mode checks

The validator confirms explicit-request routing with natural-language selection, smoke-by-default metadata, selected-validation obligation, real-project interaction, rejection of static inspection as interaction evidence, `NOT_ASSESSED` production readiness, and exact profile membership.

The audit checks three fixtures in each category: activation, anti-trigger, scope, safety, smoke, dogfooding, automated UAT, and unavailable tooling.

Static checks do not execute Chrome DevTools/CDP, OMP Browser Relay, Playwright, CUA, native automation, a CLI, or an API. They do not prove live routing or successful interaction.

---

# V8.8.0 prose-preservation acceptance

Use [the V8.8.0 design](PROSE-CLARITY-v8.8.0.md) for the current change, source walkthroughs, frozen baseline, reconstruction checks and evidence limits. Existing V8.7 checks remain required; add `scripts/test-prose-preservation.ps1 -ArtifactsDirectory ./artifacts/repro-a` on both PowerShell hosts. Execution results belong to the exact CI revision, not this document.

No live model performance or conformance result is asserted. The earlier record below remains historical context for the inherited checks.

---

# Repository integrity audit — V8.8.0
## Decision

This record defines release acceptance. Executed results belong to the exact source revision's CI and publication readback; static checks do not establish live-host behaviour.

## Current invariants

- The root skills/ tree contains 23 canonical base task skills and 23 OpenAI adapters.
- The canonical supplemental pack contains 27 user-facing standards in SOURCE-MANIFEST.json/CATALOG.md order and no OpenAI adapters.
- Every generated profile includes all 27 supplemental skills in addition to its unchanged base membership; effective totals are core 35, engineering 46, complete 50, communication 30, get-it-done 32, and gauntlet 31.
- The release-wide unique skill count is 50; the Complete profile matches the 23-skill base tree plus the 27-skill supplemental layer.
- Communication remains embedded in Get It Done and Gauntlet base packs.
- All 22 specialist skills retain a local outcome-first fallback.
- All 23 OpenAI adapters retain the delivery overlay; supplemental skills add none.
- Supplemental source limitations, rights notices and source-local notes remain preserved.
- The 48-case V8.6 scenario corpus is unique and mirrored in the release directory.
- Existing V8.3 user-information, V8.4 proof-integrity, and V8.5 proportional-rigor corpora remain present and mirrored.
- Deterministic builds and archive checks remain required on PowerShell 7 and Windows PowerShell 5.1.

## V8.6 source checks

The validator requires:

- response-weight matching;
- internal depth separated from external brevity;
- outcome, fresh verification, and remaining action;
- no routine process replay;
- tool intent followed by execution or a blocker;
- evidence-based agreement and plain uncertainty;
- conditional safe batching of independent lookups;
- explicit user or host presentation precedence;
- distinct Summary and TL;DR jobs when both are used;
- no new routed style skill;
- no vendored Hermes runtime.

## V8.7 direct-claims checks

Source and generated ZIP validation checks the directness and uncertainty/meaning guard clauses, all local fallbacks, adapters, and declared metadata. The 32 authored fixtures have unique IDs, complete fields, four covered categories, and an exact release mirror. Positive and fourteen negative controls test the structural guards. None of these checks establishes live model adherence.

## Release gate

Tag V8.8.0 only from the exact merged commit after both CI jobs pass. Build fresh assets, publish a separate public release, download every asset, and compare it byte-for-byte with the validated local build. Earlier releases remain unchanged.

## Remaining limits

Repository validation cannot prove live model compliance, task-completion improvement, user satisfaction, or runtime equivalence across agent hosts.
