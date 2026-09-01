# Lean Agent Skill Collection V8.5.1 — Validator Portability Repair

V8.5.1 is a maintenance patch. It keeps all 23 V8.5.0 skills, six profiles, invocation rules, proportional-rigor modes, proof-integrity rules, adaptive prose, and human-usable-information behavior unchanged.

## What changed

- Read Markdown contract files explicitly as UTF-8 during repository validation.
- Construct the U+2192 proportional-rigor needle from `[char]0x2192` so Windows PowerShell 5.1 cannot misparse the source literal through its legacy encoding path.
- Preserve the exact validation phrase and all release behavior.

## Compatibility

- Same 23 canonical skills.
- Same six profiles and package composition.
- Same manual and implicit invocation policy.
- No dependency, service, hook, installer, executable skill payload, or automatic trusted-state mutation.

## Validation

The exact release commit must pass:

- deterministic double builds;
- validator rejection-control tests;
- source and archive validation;
- repository-integrity validation;
- PowerShell 7 CI;
- Windows PowerShell 5.1 CI;
- post-publication tag, release, asset, checksum, and byte-for-byte download read-back.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT routing behavior, user comprehension, accessibility conformance, usability conformance, security certification, or formal standards conformance.
