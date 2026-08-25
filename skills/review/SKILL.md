---
name: review
description: "Independently review code, interfaces, writing, data, architecture, repository agent-operability, or another agent’s work against the real contract and artifact. Default to read-only; repair only when explicitly requested."
---

# Review

1. Reconstruct the contract: outcome, scope, non-goals, requirement sources, task acceptance, standing Definition of Done, environment, and risk. First explain enough of the current behavior to avoid criticizing an imagined system.
2. Build an evidence packet from the real artifact, diff, rendered output, test results, logs, data, startup path, or source material. Treat summaries and worker success as claims, not proof.
3. For a branch or change set, establish the correct base; read the specification and tests, then inspect the diff, full changed files, relevant callers, interfaces, configuration, lockfile or dependency graph, operational commands, and generated artifacts. Scope findings to introduced or changed behavior, but trace consequences beyond the diff.
4. When practical, make an independent first pass before reading earlier comments or persuasive self-assessments. Verify external findings after the first pass instead of inheriting them uncritically. For claimed cross-model independence, record the requested reviewer, actual model, verified serving family, context separation, and artifact inspected. A different CLI alone is not independent; unverified identity lowers the independence level. Delegated review requires live child, tool, or artifact evidence.
5. Select only relevant lanes from `LANES.md`. Give parallel lanes distinct charters and anti-charters. For material code changes, check specification or behavioral compliance before maintainability and simplification; then deduplicate by evidence, not wording.
6. Try to falsify success with counterexamples, boundary cases, regressions, alternate calculations, cold startup, or actual user journeys. For a material finding, separate finder from verifier and choose the uncertainty bias from the more costly error direction.
7. Check both directions: every acceptance claim maps to evidence, and every material requirement or changed public behavior appears in the verdict or is explicitly excluded.
8. Rank findings by evidence and impact:
   - `P0` safety, security, data loss, or irreversible harm;
   - `P1` blocks the requested outcome or a hard requirement;
   - `P2` meaningful reliability, accessibility, maintainability, performance, documentation, operations, or agent-operability defect;
   - `P3` minor preference with low user impact.
9. Ignore style nits while P0–P2 defects remain. Do not invent requirements, use file length alone as a defect, call an unmeasured concern a measured regression, or present a capped sample as exhaustive.
10. In repair mode, change only evidence-backed defects, preserve unrelated work, and rerun affected checks. A simplification must reduce net complexity, not move it behind another wrapper.

Each finding states: ID, severity, repair class (`block now`, `fix before merge`, `follow-up`, or `no change`), violated requirement, exact evidence, reproduction, expected versus actual, impact, smallest repair direction, confidence, and verification status.

End with `PASS`, `PASS WITH RISKS`, or `FAIL`, plus executed checks, skipped or failed checks, unprocessed remainder, and remaining uncertainty. A builder’s unverified self-assessment is not evidence. Do not claim standards compliance without scoped verification evidence.
