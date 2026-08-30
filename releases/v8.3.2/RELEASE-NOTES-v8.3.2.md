# Lean Agent Skill Collection V8.3.2 — Communication-Complete Task Packs

V8.3.2 keeps all 23 canonical skills and all skill instructions unchanged. It changes package composition only.

## What changed

The standalone Communication profile remains:

```text
teach
wait-what
writing
```

The Get It Done pack now contains five skills:

```text
gauntlet-loop
get-it-done
teach
wait-what
writing
```

The Gauntlet pack now contains four skills:

```text
gauntlet-loop
teach
wait-what
writing
```

This means both task packs carry adaptive prose, teaching, writing, cognitive-accessibility, and human-usable-information support without requiring a second overlapping profile installation.

## Compatibility

- Same 23 canonical skills.
- Same six profile names.
- Same manual and implicit invocation policy for every skill.
- The Get It Done package grows from 3 to 5 skills.
- The Gauntlet package grows from 1 to 4 skills.
- The standalone Communication package remains available.
- No dependency, service, runtime hook, installer, executable skill payload, or automatic trusted-state mutation is added.

## Validation

- Profile unions are checked against the canonical Communication profile.
- Duplicate skill names are rejected.
- Deterministic double builds, validator rejection controls, source validation, repository auditing, PowerShell 7 CI, and Windows PowerShell 5.1 CI must pass.
- The annotated tag and published assets must be read back after release.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT routing behaviour, user comprehension, accessibility conformance, usability conformance, security certification, or formal standards conformance.
