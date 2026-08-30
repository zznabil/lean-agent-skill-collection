# Lean Agent Skills V8.3.1 — release audit

## Decision

**PASS STATIC — EMPIRICAL USER VALIDATION PENDING**

V8.3.1 keeps all V8.3.0 skill content: 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. It adds repository-integrity hardening and no routed skill, dependency, service, runtime hook, executable skill payload, or automatic trusted-state mutation.

```text
Canonical skills:          23 → 23
Primary SKILL.md lines:         850
Primary SKILL.md words:      13,286
Largest primary skill:     gauntlet-loop (119 lines)
Static scenarios:          48
Candidate decisions:       24
```

Live OMP, Codex, ChatGPT, comprehension, task success, accessibility, latency, and human satisfaction were not measured.

## V8.3 behavioural audit

The V8.3.0 18-pass behavioural audit remains applicable because V8.3.1 does not alter skill content or routing.

| Pass | Perspective | Result |
|---:|---|---|
| 1 | Source, licence, and 23-skill inventory | PASS |
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

## V8.3.1 repository hardening

The patch adds and validates:

- cross-file release-version and title consistency;
- the 23-skill Complete-profile inventory;
- the 48-row scenario corpus and release mirrors;
- `skills/writing/USER-INFORMATION.md` reference closure;
- UTF-8 without BOM, LF endings, no trailing whitespace, and final newlines;
- rejection of temporary release/recovery scaffolds;
- required built archives;
- PowerShell 7 and Windows PowerShell 5.1 execution.

See [`REPOSITORY-AUDIT.md`](REPOSITORY-AUDIT.md) for the detailed repository findings and limits.

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

## Evidence model

Strong user-information claims require the real task and intended audience. Preferred outcome measures remain findability, correct understanding, task completion, first-attempt success, interruption/error recovery, wording-attributable errors, help dependence, and cohort gaps. Readability formulas and checklist scores are diagnostics only.

## Residual risks

1. More named standards can increase context salience even when conditional.
2. Models may over-apply procedure templates to short answers.
3. Intended-user testing may be unavailable; the verdict must then be capped.
4. Cognitive accessibility varies by person and context; one persona cannot represent all users.
5. ISO/IEC/IEEE 26513 Edition 2 and IEC/IEEE 82079-1 Edition 3 are not final.
6. Live host routing and behavioural gain remain unmeasured.
7. Static repository validation cannot prove future external-link availability.

## Release recommendation

Publish V8.3.1 only from the exact merged commit after both CI jobs pass. Create an annotated tag, build fresh release assets, verify their checksums, and keep the V8.3.0 release unchanged.
