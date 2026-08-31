---
name: review
description: "Independently review code, interfaces, writing, data, architecture, repository agent-operability, or another agent’s work against the real contract and artifact. Default to read-only; repair only when explicitly requested."
---

# Review

Use an **ISO/IEC 20246-inspired structured review** of the real work product. Select applicable **ISO/IEC 25010** quality attributes, and use an **ISO/IEC/IEEE 15026-2-inspired assurance case** for consequential claims. For user information, use **ISO/IEC/IEEE 26513**, **ISO/IEC/IEEE 26514**, **IEC/IEEE 82079-1**, **ISO/IEC 23859**, and cognitive-accessibility sources only when the artifact and audience require them. Apply Google code-review practice: protect correctness and code health without blocking net improvement for hypothetical perfection.

1. Reconstruct the contract: outcome, scope, non-goals, requirement sources, task acceptance, standing Definition of Done, environment, and risk. First explain enough of the current behavior to avoid criticizing an imagined system.
2. Build an evidence packet from the real artifact, diff, rendered output, test results, logs, data, startup path, or source material. Audit the proof mechanism as well as its result: identify the actual verifier, confirm that it observes the named outcome, check whether it can fail under a representative broken state, and distinguish historical status from current re-execution. Record the tested artifact or revision, verifier, environment, entrypoint, authentication context, time, and coverage when they affect validity. Inventory, mocks, unit tests, harnesses, or bypassed authentication do not prove deployed behavior without relevant equivalence. Treat summaries and worker success as claims, not proof.
3. For a branch or change set, establish the correct base; read the specification and tests, then inspect the diff, full changed files, relevant callers, interfaces, configuration, lockfile or dependency graph, operational commands, and generated artifacts. Scope findings to introduced or changed behavior, but trace consequences beyond the diff.
4. When practical, make an independent first pass before reading earlier comments or persuasive self-assessments. Verify external findings after the first pass instead of inheriting them uncritically. For claimed cross-model independence, record the requested reviewer, actual model, verified serving family, context separation, and artifact inspected. A different CLI alone is not independent; unverified identity lowers the independence level. Delegated review requires live child, tool, or artifact evidence.
5. Select only relevant lanes from `LANES.md`. Give parallel lanes distinct charters and anti-charters. For material code changes, check specification or behavioral compliance before maintainability and simplification; then deduplicate by evidence, not wording.
6. Try to falsify success with counterexamples, boundary cases, regressions, alternate calculations, cold startup, or actual user journeys. For a material finding, separate finder from verifier and choose the uncertainty bias from the more costly error direction.
7. Check both directions: every acceptance claim maps to evidence, and every material requirement or changed public behavior appears in the verdict or is explicitly excluded. For consequential user information, test the actual user task and intended audience when practical; a readability or checklist score alone is not proof. For a consequential multi-evidence claim, summarize claim, scope, argument, evidence, defeaters, and status.
8. Rank findings by evidence and impact:
   - `P0` safety, security, data loss, or irreversible harm;
   - `P1` blocks the requested outcome or a hard requirement;
   - `P2` meaningful reliability, accessibility, maintainability, performance, documentation, operations, or agent-operability defect;
   - `P3` minor preference with low user impact.
9. Ignore style nits while P0–P2 defects remain. Do not invent requirements, infer AI authorship from style, use file length alone as a defect, call an unmeasured concern a measured regression, or present a capped sample as exhaustive.
10. In repair mode, change only evidence-backed defects, preserve unrelated work, and rerun affected checks. A simplification must reduce net complexity, not move it behind another wrapper. Approve a definite net improvement when the contract is met and residuals are nonblocking and owned; reject both hypothetical-perfection blocking and material regression for speed.

Each finding states: ID, severity, repair class (`block now`, `fix before merge`, `follow-up`, or `no change`), violated requirement, exact evidence, reproduction, expected versus actual, impact, smallest repair direction, confidence, and verification status. Severity and repair class are independent: a `P2` MAY still be `fix before merge`, while a nonblocking `P2` needs an owner or revisit trigger before `PASS WITH RISKS`.

End with `PASS` when no blocking finding remains, `PASS WITH RISKS` only for explicitly accepted and owned nonblocking residuals, or `FAIL` while any `block now` or `fix before merge` finding remains, plus executed checks, skipped or failed checks, unprocessed remainder, and remaining uncertainty. A builder’s unverified self-assessment is not evidence. Do not claim standards compliance without scoped verification evidence.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
