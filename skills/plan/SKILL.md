---
name: plan
description: "Turn evidence and resolved decisions into an executable proposal, spec, ticket set, workflow, refactor plan, or comparison of competing plans. Use for planning artifacts, not implementation unless also requested."
---

# Plan

Select **proposal**, **spec**, **tickets**, **workflow**, **refactor**, or **arbiter**. Choose output depth first: **Direct** (a few sentences), **Brief** (bounded units, files, and checks in chat), or **Durable** (a versioned artifact for high-risk, multi-session, or headless work).

## Common process

1. Reconstruct the outcome, current state, constraints, non-goals, users, risks, and definition of done from the conversation and workspace.
2. Verify consequential claims against files, behavior, documentation, tests, or data. Identify the riskiest unknown and the cheapest probe that can remove it.
3. Express each material requirement as ID, source, observable statement, verification method, environment, and threshold. For event, state, option, or failure-dependent behavior, use `WHEN`, `WHILE`, `WHERE`, or `IF … THEN` plus a BCP 14 response. Do not promote an inferred preference into a requirement. In Durable artifacts, keep stable `REQ-#`, `UNIT-#`, and `DEC-#` identifiers; never silently renumber them. Mark examined decisions `SETTLED` and reopen only when new evidence invalidates them.
4. For independent capabilities, map owner, interface, dependencies, acceptance checks, and integration point. Prove coverage in both directions: every requirement maps to work, and every work item maps to a requirement or explicit enabling need.
5. For shared surfaces, choose the smallest contract: none, a 5–12 line inline contract, or a full contract only when consumers, compatibility, migration, auth, data, CLI, API, or UI-flow risk justifies it. If no consumer, surface, check, deliverable, or blocker can be named, skip the ceremony.
6. Select only quality attributes that can change the decision. For material risk, record cause → event → consequence, exposure, treatment, owner, trigger, and evidence. Resolve only blocking choices; use a conservative recorded default for minor reversible gaps.
7. For every unresolved consequential decision, recommend a default, state its main trade-off and what it blocks, and group tightly related questions. Do not ask the user to choose what current evidence already resolves.
8. Prefer verified vertical slices ordered by dependency and risk. Preserve known behavior and include rollback for risky steps.
9. Write locally by default. Mutate a remote tracker only with explicit authorization.

## Modes

- **Proposal:** problem, evidence, deliberately different credible options when a real tradeoff exists, recommendation, smallest test or MVP, kill or revisit criteria, dissent, and `Not doing`.
- **Spec:** outcome, scope, capability map, requirements, interfaces, data, failure paths, migration, acceptance checks, risks, and open decisions.
- **Tickets:** one user-visible or system outcome per vertical slice, with dependencies, allowed area, acceptance checks, verification method, and focused-session size. Use expand–migrate–contract for wide compatibility changes.
- **Workflow:** trigger, owner, execution mode, inputs, structured stage contracts, packet charters and anti-charters, pipeline versus justified barriers, approvals, outputs, bounded loops, cap disclosure, failure recovery, privacy boundary, and one normal plus one failure walkthrough.
- **Refactor:** measured pain, characterization coverage, seam, behavior-preserving slices, compatibility, migration, verification, and rollback. Compare no change, local change, and broader change.
- **Arbiter:** normalize competing plans, hide author identity when practical, score against one rubric, preserve strong dissent, then adopt, hybridize, or reject. Tie-break by user fit, correctness, evidence, simplicity, rollback, then cost.

Return one ordered artifact with traceability, dependencies, completion checks, rejected alternatives, disclosed remainder, and `Not doing`. A plan is a guardrail for outcomes and decisions, not line-by-line code choreography. Do not claim implementation occurred.


**User-facing:** For eligible substantive chat, start with **Summary** and the result or next action; use friendly STE-style prose; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. For measurable multi-step work, use a truthful named 20-cell bar, e.g. `Audit [############--------] 60% (6/10)`, separate from verdict. Exclude brief, machine, and artifact formats. Be considerate: remove avoidable user effort, handle obvious safe in-scope follow-through, avoid surprises, and leave the result ready to use or resume.
