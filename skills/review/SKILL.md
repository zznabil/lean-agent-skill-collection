---
name: review
description: "Independently review code, interfaces, writing, data, architecture, repository agent-operability, or another agent’s work against the real contract and artifact. Default to read-only; repair only when explicitly requested."
---
# Review
For review tasks, use an **ISO/IEC 20246-inspired structured review** of the actual work product.
- Select applicable **ISO/IEC 25010** quality attributes. For consequential claims, use an **ISO/IEC/IEEE 15026-2-inspired assurance case**.
- For user information, use **ISO/IEC/IEEE 26513**, **ISO/IEC/IEEE 26514**, **IEC/IEEE 82079-1**, **ISO/IEC 23859**, and cognitive-accessibility sources only when the artifact and audience require them.
- Apply Google code-review practice. Protect correctness and code health. Do not block net improvement for hypothetical perfection.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own within scope. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive, external, consequential or surprising actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
## Review procedure
Stay read-only unless the user explicitly requests repair.
1. Define the review decision and scope. Recover outcome, non-goals, requirement sources, acceptance, standing Definition of Done, environment and risk. Explain enough current behaviour to avoid reviewing an imagined system.
2. Gather evidence from the actual artefact, diff, rendered output, test results, logs, data, startup path or source material.
   - Audit the proof mechanism and result. Identify the actual verifier. Confirm that it observes the named outcome and can fail under a representative broken state. Separate historical status from current re-execution.
   - When validity depends on them, record the tested artifact or revision, verifier, environment, entrypoint, authentication context, time, and coverage.
   - Inventory, mocks, unit tests, harnesses, and bypassed authentication do not prove deployed behavior without relevant equivalence.
   - Treat summaries and worker success as claims, not proof.
3. For a branch or change set, establish the correct base. Read the specification and tests. Then inspect the diff, full changed files, relevant callers, interfaces, configuration, lockfile or dependency graph, operational commands, and generated artifacts.
   - Limit findings to introduced or changed behavior. Trace consequences beyond the diff.
4. When practical, make an independent first pass before reading earlier comments or persuasive self-assessments.
   - After that pass, verify external findings. Do not accept them without checking.
   - For claimed cross-model independence, record the requested reviewer, actual model, verified serving family, context separation, and artifact inspected.
   - A different CLI alone does not establish independence. Unverified identity lowers the independence level.
   - Delegated review requires live child, tool, or artifact evidence.
5. Select only relevant lanes from `LANES.md`.
   - Every lane or reviewer must name a distinct material risk or evidence gap. Do not add review lanes merely because agents are available.
   - Give parallel lanes distinct charters and anti-charters.
   - For material code changes, check specification or behavioral compliance before maintainability and simplification. Then deduplicate by evidence, not wording.
   - A tiny deterministic change MAY need only one focused read and one decisive check.
6. Try to disprove success with counterexamples, boundary cases, regressions, alternate calculations, cold startup, or actual user journeys. For a material finding, separate finder from verifier. Choose the uncertainty bias according to the more costly error direction.
7. Check both directions. Map every acceptance claim to evidence. Include every material requirement or changed public behavior in the verdict, or explicitly exclude it.
   - For consequential user information, test the actual user task and intended audience when practical. A readability or checklist score alone is not proof.
   - For a consequential multi-evidence claim, summarize claim, scope, argument, evidence, defeaters, and status.
8. Rank findings by evidence and impact:
   - `P0`: safety, security, data loss, or irreversible harm;
   - `P1`: blocks the requested outcome or a hard requirement;
   - `P2`: meaningful reliability, accessibility, maintainability, performance, documentation, operations, or agent-operability defect;
   - `P3`: minor preference with low user impact.
9. Ignore style nits while P0–P2 defects remain.
   - For simplification, classify only evidence-backed opportunities as delete, reuse, standard library, native platform, inline, consolidate, or shrink.
   - Judge concepts, owners, dependencies, branches, and behavior before line count.
   - If no material simplification remains, report `ALREADY LEAN` and stop.
   - Do not invent requirements or infer AI authorship from style. Do not use file length alone as a defect. Do not call an unmeasured concern a measured regression or present a capped sample as exhaustive.
10. In repair mode, change only evidence-backed defects. Preserve unrelated work. Rerun affected checks.
    - A simplification must reduce net complexity, not move it behind another wrapper.
    - Approve a definite net improvement when the contract is met and residuals are nonblocking and owned. Do not block for hypothetical perfection or accept material regression for speed.
Flag wording that hides a verified failure, its impact, or an evidenced actor. Preserve legitimate uncertainty and exact source meaning. A negative or hedge is not a defect by itself.
## Findings and verdict
For each material finding, give severity, exact evidence, impact and the smallest repair. Include ID, requirement, reproduction, expected versus actual, confidence, verification status and repair class (`block now`, `fix before merge`, `follow-up`, or `no change`) when needed for a decision or handoff, or requested.
- Treat severity and repair class separately. A `P2` MAY still be `fix before merge`. A nonblocking `P2` needs an owner or revisit trigger before `PASS WITH RISKS`.
Lead with `PASS`, `PASS WITH RISKS`, or `FAIL`. Then give the highest-severity evidence-backed findings.
- Do not open with praise, narrate the review process, or invent minor comments to make the review appear thorough.
- Include executed checks, skipped or failed checks, unprocessed remainder, and remaining uncertainty.
- Do not treat a builder’s unverified self-assessment as evidence.
- Do not claim standards compliance without scoped verification evidence.
