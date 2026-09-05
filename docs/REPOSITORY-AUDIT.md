# Repository integrity audit — V8.7.0

## Decision

**PASS after static and cross-platform validation, with live-host limits.**

## Current invariants

- 23 canonical skills and six profiles.
- The Complete profile matches the skill tree.
- Communication remains embedded in Get It Done and Gauntlet packs.
- All 22 specialist skills retain a local outcome-first fallback.
- All 23 OpenAI adapters retain the delivery overlay.
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

Tag V8.6.0 only from the exact merged commit after both CI jobs pass. Build fresh assets, publish a separate public release, download every asset, and compare it byte-for-byte with the validated local build. Earlier releases remain unchanged.

## Remaining limits

Repository validation cannot prove live model compliance, task-completion improvement, user satisfaction, or runtime equivalence across agent hosts.
