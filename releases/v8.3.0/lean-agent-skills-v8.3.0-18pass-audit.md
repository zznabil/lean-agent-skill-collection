# Lean Agent Skills V8.3.0 — 18-pass audit

## Decision

**PASS STATIC — EMPIRICAL USER VALIDATION PENDING**

V8.3.0 keeps 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. It adds one conditional reference, `skills/writing/USER-INFORMATION.md`, and no routed skill, dependency, service, hook, executable, or automatic trusted-state mutation.

```text
Canonical skills:          23 → 23
Primary SKILL.md lines:    837 → 850
Primary SKILL.md words: 12,622 → 13,286
Largest primary skill:     gauntlet-loop (119 lines)
Static scenarios:          48
Candidate decisions:       24
```

Live OMP, Codex, ChatGPT, comprehension, task success, accessibility, latency, and human satisfaction were not measured.

## Passes

| Pass | Perspective | Result |
|---:|---|---|
| 1 | Source, version, licence, and 23-skill inventory | PASS |
| 2 | Candidate provenance and current-edition check | PASS |
| 3 | Adopt/absorb/project-local/reject boundaries | PASS |
| 4 | No new routed skill or trigger collision | PASS |
| 5 | Simple-turn proportionality and adaptive prose | PASS STATIC |
| 6 | Information-for-use lifecycle and task contract | PASS STATIC |
| 7 | UI text readability and embedded-help scope | PASS STATIC |
| 8 | Cognitive accessibility, orientation, and recovery | PASS STATIC |
| 9 | Accessibility-needs traceability | PASS STATIC |
| 10 | Terminology consistency and definition quality | PASS STATIC |
| 11 | Teaching, worked examples, self-explanation, and transfer | PASS STATIC |
| 12 | Retrieval practice and alternate-path restraint | PASS STATIC |
| 13 | Easy-to-Read specialization and intended-user review | PASS BY POLICY |
| 14 | Readability-score ceiling and task-based evidence | PASS BY POLICY |
| 15 | Manual invocation and standalone reference closure | PASS STATIC |
| 16 | Context economy, profile consistency, and packaging | PASS STATIC |
| 17 | Human-usable instructions and cognitive-accessibility coverage | PASS STATIC; LIVE USER TEST PENDING |
| 18 | Instructional effectiveness and target-user validation | TEST DESIGN PASS; EMPIRICAL RESULT PENDING |

## Candidate synthesis

Strongly absorbed:

- IEC/IEEE 82079-1:2019 and ISO/IEC/IEEE 26514:2022 for information-for-use design and lifecycle;
- ISO/IEC 23859:2023 for UI text;
- ISO 21801-1:2020 and ISO 9241-171:2025 for cognitive and software accessibility;
- ISO/IEC 29138-1:2018 and 29138-4:2026 for user-accessibility-needs traceability;
- ISO 704:2022 for preferred terms and definitions.

Selectively absorbed:

- ISO/IEC/IEEE 26513 review method while Edition 2 remains at FDIS;
- ISO 9241-112:2025 information presentation;
- CAST UDL 3.0, the IES practice guide, cognitive-load reduction, worked examples, self-explanation, transfer, and retention-oriented retrieval.

Bounded or rejected globally:

- Inclusion Europe Easy-to-Read is specialized and requires intended-user review;
- CDC CCI and PEMAT are diagnostics, not universal release thresholds;
- ISO 24495-2/-3, ISO/IEC/IEEE 26516, ISO 8601, and vendor style guides remain project-local;
- WAI-Adapt remains deferred;
- Feynman remains an informal heuristic, not a formal standard.

## Activation model

The new layer activates for substantial instructions, manuals, onboarding, UI text, forms, warnings, errors, recovery guidance, and teaching. A simple answer remains a simple answer. The expected information contract is:

```text
intended user and task
→ purpose
→ prerequisites
→ action
→ expected result
→ recovery and data state
→ material consequences
→ orientation and next step
```

## Evidence model

Strong user-information claims require the real task and intended audience. The preferred outcome measures are findability, correct understanding, task completion, first-attempt success, interruption/error recovery, wording-attributable errors, help dependence, and cohort gaps. Readability formulas and checklist scores are diagnostics only.

## Residual risks

1. More named standards can increase context salience even when conditional.
2. Models may over-apply procedure templates to short answers.
3. Intended-user testing may be unavailable; the verdict must then be capped.
4. Cognitive accessibility varies by person and context; one persona cannot represent all users.
5. ISO/IEC/IEEE 26513 Edition 2 and IEC/IEEE 82079-1 Edition 3 are not final.
6. Live host routing and behavioural gain remain unmeasured.

## Promotion recommendation

Open a draft PR for human review. Do not merge or publish until repository CI passes and the reviewer accepts the context increase and the specialized Easy-to-Read boundary.
