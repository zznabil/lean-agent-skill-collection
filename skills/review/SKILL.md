---
name: review
description: "Independently review code, interfaces, writing, data, architecture, repository agent-operability, or another agent’s work against the real contract and artifact. Default to read-only; repair only when explicitly requested."
---

# Review

Use an **ISO/IEC 20246-inspired structured review** of the real work product.

- Select applicable **ISO/IEC 25010** quality attributes, and use an **ISO/IEC/IEEE 15026-2-inspired assurance case** for consequential claims.
- For user information, use **ISO/IEC/IEEE 26513**, **ISO/IEC/IEEE 26514**, **IEC/IEEE 82079-1**, **ISO/IEC 23859**, and cognitive-accessibility sources only when the artifact and audience require them.
- Apply Google code-review practice: protect correctness and code health without blocking net improvement for hypothetical perfection.

1. Define the review decision to be made and its scope before detail. Reconstruct the contract: outcome, non-goals, requirement sources, task acceptance, standing Definition of Done, environment, and risk. First explain enough of the current behavior to avoid criticizing an imagined system.
2. Build an evidence packet from the real artifact, diff, rendered output, test results, logs, data, startup path, or source material.
   - Audit the proof mechanism as well as its result: identify the actual verifier, confirm that it observes the named outcome, check whether it can fail under a representative broken state, and distinguish historical status from current re-execution.
   - Record the tested artifact or revision, verifier, environment, entrypoint, authentication context, time, and coverage when they affect validity.
   - Inventory, mocks, unit tests, harnesses, or bypassed authentication do not prove deployed behavior without relevant equivalence.
   - Treat summaries and worker success as claims, not proof.
3. For a branch or change set, establish the correct base; read the specification and tests, then inspect the diff, full changed files, relevant callers, interfaces, configuration, lockfile or dependency graph, operational commands, and generated artifacts.
   - Scope findings to introduced or changed behavior, but trace consequences beyond the diff.
4. When practical, make an independent first pass before reading earlier comments or persuasive self-assessments.
   - Verify external findings after the first pass instead of inheriting them uncritically.
   - For claimed cross-model independence, record the requested reviewer, actual model, verified serving family, context separation, and artifact inspected.
   - A different CLI alone is not independent; unverified identity lowers the independence level.
   - Delegated review requires live child, tool, or artifact evidence.
5. Select only relevant lanes from `LANES.md`.
   - Every lane or reviewer must name a distinct material risk or evidence gap; do not create review fan-out because agents are available.
   - Give parallel lanes distinct charters and anti-charters.
   - For material code changes, check specification or behavioral compliance before maintainability and simplification; then deduplicate by evidence, not wording.
   - A tiny deterministic change MAY need only one focused read and one decisive check.
6. Try to falsify success with counterexamples, boundary cases, regressions, alternate calculations, cold startup, or actual user journeys. For a material finding, separate finder from verifier and choose the uncertainty bias from the more costly error direction.
7. Check both directions: every acceptance claim maps to evidence, and every material requirement or changed public behavior appears in the verdict or is explicitly excluded.
   - For consequential user information, test the actual user task and intended audience when practical; a readability or checklist score alone is not proof.
   - For a consequential multi-evidence claim, summarize claim, scope, argument, evidence, defeaters, and status.
8. Rank findings by evidence and impact:
   - `P0` safety, security, data loss, or irreversible harm;
   - `P1` blocks the requested outcome or a hard requirement;
   - `P2` meaningful reliability, accessibility, maintainability, performance, documentation, operations, or agent-operability defect;
   - `P3` minor preference with low user impact.
9. Ignore style nits while P0–P2 defects remain.
   - For simplification, classify only evidence-backed opportunities as delete, reuse, standard library, native platform, inline, consolidate, or shrink.
   - Judge concepts, owners, dependencies, branches, and behavior before line count.
   - If no material simplification remains, report `ALREADY LEAN` and stop.
   - Do not invent requirements, infer AI authorship from style, use file length alone as a defect, call an unmeasured concern a measured regression, or present a capped sample as exhaustive.
10. In repair mode, change only evidence-backed defects, preserve unrelated work, and rerun affected checks.
    - A simplification must reduce net complexity, not move it behind another wrapper.
    - Approve a definite net improvement when the contract is met and residuals are nonblocking and owned; reject both hypothetical-perfection blocking and material regression for speed.

Flag wording that conceals a verified failure, its impact, or an evidenced actor. Preserve legitimate uncertainty and exact source meaning; do not treat the presence of a negative or a hedge as a defect by itself.

Each finding states: ID, severity, repair class (`block now`, `fix before merge`, `follow-up`, or `no change`), violated requirement, exact evidence, reproduction, expected versus actual, impact, smallest repair direction, confidence, and verification status.

- Severity and repair class are independent: a `P2` MAY still be `fix before merge`, while a nonblocking `P2` needs an owner or revisit trigger before `PASS WITH RISKS`.

Lead with `PASS`, `PASS WITH RISKS`, or `FAIL`, then the highest-severity evidence-backed findings.

- Do not open with praise, narrate the review process, or manufacture minor comments to make the review look thorough.
- Include executed checks, skipped or failed checks, unprocessed remainder, and remaining uncertainty.
- A builder’s unverified self-assessment is not evidence.
- Do not claim standards compliance without scoped verification evidence.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
