# Lean Agent Skills V8.5.1 — 22-pass release audit

## Decision

**PASS STATIC — LIVE HOST AND TASK OUTCOMES PENDING**

V8.5.1 keeps the 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, six deployment profiles, and all V8.5.0 behavior. It changes only repository validation portability: UTF-8 contract files are read explicitly on both supported PowerShell hosts, and a parser-sensitive Unicode needle is constructed safely.

## Proportional-rigor synthesis

The release preserves the four evidence-selected modes introduced in V8.5.0:

- DIRECT: inspect → act → decisive check → brief result.
- STANDARD: bounded subsystem work with one primary skill and targeted checks.
- DEEP: durable lifecycle and integration evidence.
- ADVERSARIAL: independent attack only when one normal check is insufficient.

Minimum rigor does not lower correctness, safety, authorization, data integrity, required accessibility, compatibility, explicit acceptance, or proof needed for the claim.

## V8.5.1 maintenance repair

- `scripts/validate.ps1` reads the human-information, proof-integrity, and proportional-rigor contract files through explicit UTF-8 decoding.
- The U+2192 phrase used by two proportional-rigor checks is built with `[char]0x2192`, avoiding Windows PowerShell 5.1 source-decoding ambiguity.
- No skill, route, profile, package membership, acceptance rule, or user-facing behavior changed.

## Audit passes

| Pass | Perspective | Result |
|---:|---|---|
| 1 | Version, license, metadata, and six-profile alignment | PASS STATIC |
| 2 | 23-skill inventory and support-reference closure | PASS STATIC |
| 3 | OpenAI adapter schema and manual/implicit policy | PASS STATIC |
| 4 | No new route or trigger collision | PASS STATIC |
| 5 | DIRECT eligibility and anti-ceremony rules | PASS STATIC |
| 6 | STANDARD bounded-work behavior | PASS STATIC |
| 7 | DEEP lifecycle and durable-state escalation | PASS STATIC |
| 8 | ADVERSARIAL trigger and anti-trigger precision | PASS STATIC |
| 9 | Correctness and safety floor before simplicity | PASS STATIC |
| 10 | Necessity, reuse, stdlib, native, dependency, direct-code ladder | PASS STATIC |
| 11 | Root-cause and owning-location repair | PASS STATIC |
| 12 | One decisive check and minimum sufficient evidence | PASS STATIC |
| 13 | Evidence-based escalation and de-escalation | PASS STATIC |
| 14 | One consolidated question and bounded autonomy | PASS STATIC |
| 15 | Strategy change after repeated same-class failure | PASS STATIC |
| 16 | Quiet Direct reporting and truthful progress | PASS STATIC |
| 17 | Already-exists, no-change, and ALREADY LEAN stop states | PASS STATIC |
| 18 | BUILD HARD and anti-underbuilding boundary | PASS STATIC |
| 19 | Existing proof-integrity and parent re-verification preservation | PASS STATIC |
| 20 | Existing human-usable-information and cognitive-accessibility preservation | PASS STATIC |
| 21 | 48-case scenario coverage and release mirror | PASS STATIC |
| 22 | Deterministic builds, archive validation, PowerShell 7, and Windows PowerShell 5.1 | PASS CI |

## Candidate decisions

Strongly absorbed in V8.5.0: Ponytail, Quickflow, do-it, and Small Correct Diff mechanisms.

Selectively absorbed in V8.5.0: Scalpel, Just Do It, Plow Ahead, Requirement Zero, Ralph, and GSD Pi mechanisms.

Rejected for the stable core: separate routes, personas, source runtimes, hook stacks, mandatory routers, universal benchmark promises, blanket test skipping, and Caveman's prose/context compression and commercial runtime surface.

## Remaining limits

- Live routing and instruction adherence in OMP, Codex, and ChatGPT were not measured.
- The numerical benchmark claims of source projects were not treated as comparable evidence.
- Static scenarios do not prove that every model will choose the correct mode.
- A one-check Direct path remains valid only when that check fully observes the claim and has a credible failure path.
- Formal standards, security, accessibility, usability, or quality conformance is not claimed.
