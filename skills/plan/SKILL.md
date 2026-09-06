---
name: plan
description: "Turn evidence and resolved decisions into an executable proposal, spec, ticket set, workflow, refactor plan, or comparison of competing plans. Use for planning artifacts, not implementation unless also requested."
---

# Plan

Select **proposal**, **spec**, **tickets**, **workflow**, **refactor**, or **arbiter**. Choose output depth first: **Direct** (a few sentences), **Brief** (bounded units, files, and checks in chat), or **Durable** (a versioned artifact for high-risk, multi-session, or headless work). When implementation is also requested and the task is clear, local, reversible, and proved by one decisive check, use Direct and proceed without creating a separate plan artifact.

## Common process

1. Reconstruct the outcome, current state, constraints, non-goals, users, risks, and definition of done from the conversation and workspace.
2. Verify consequential claims against files, behavior, documentation, tests, or data. Identify the riskiest unknown and the cheapest probe that can remove it. Run one quick necessity check: delete, reduce, defer, build, or build hard. Do not turn this into a mandatory verdict ceremony for obvious work; mission-critical complexity may be the correct `build hard` result.
3. Apply **ISO/IEC/IEEE 29148-inspired requirements traceability**: express each material requirement as ID, source, observable statement, verification method, environment, and threshold. For event, state, option, or failure-dependent behavior, use **EARS** forms—`WHEN`, `WHILE`, `WHERE`, or `IF … THEN`—plus a **BCP 14** response. Do not promote an inferred preference into a requirement. In Durable artifacts, keep stable `REQ-#`, `UNIT-#`, and `DEC-#` identifiers; never silently renumber them. Mark examined decisions `SETTLED` and reopen only when new evidence invalidates them.
4. For accessibility-sensitive work, apply **ISO/IEC 29138-1:2018 and 29138-4:2026** as a lightweight needs map: `user accessibility need → barrier → requirement → evidence`. Do not treat one diagnosis or persona as a proxy for all users.
5. For independent capabilities, map owner, interface, dependencies, acceptance checks, and integration point. For Durable or delegated work, maintain a revisioned contract inventory: every independently omittable required outcome and every acceptance-changing constraint gets a stable ID, owner, observing gate or manual review, disposition, and revision. `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` remain non-completion unless an authorized scope change removes the requirement. Prove coverage in both directions: every requirement maps to work, and every work item maps to a requirement or explicit enabling need.
6. Place verification where its evidence lives. A leaf check MUST be satisfiable from that leaf's owned artifact. Interface compatibility, end-to-end behavior, joined-state invariants, and regression across several leaves belong in the integration unit and SHOULD run once there rather than in every leaf. For shared surfaces, choose the smallest contract: none, a 5–12 line inline contract, or a full contract only when consumers, compatibility, migration, auth, data, CLI, API, or UI-flow risk justifies it. If no consumer, surface, check, deliverable, or blocker can be named, skip the ceremony.
7. Select only applicable **ISO/IEC 25010** quality attributes that can change the decision. For material risk, use an **ISO 31000 / IEC 31010 / ISO/IEC/IEEE 16085-inspired** record: cause → event → consequence, exposure, treatment, owner, trigger, and evidence. Resolve only blocking choices; use a conservative recorded default for minor reversible gaps.
8. For every unresolved consequential decision, recommend a default, state its main trade-off and what it blocks, and group tightly related questions. Do not ask the user to choose what current evidence already resolves.
9. Prefer verified vertical slices ordered by dependency and risk. Preserve known behavior and include rollback for risky steps.
10. Write locally by default. Mutate a remote tracker only with explicit authorization.

## Modes

- **Proposal:** problem, evidence, deliberately different credible options when a real tradeoff exists, recommendation, smallest test or MVP, kill or revisit criteria, dissent, and `Not doing`.
- **Spec:** outcome, scope, capability map, requirements, interfaces, data, failure paths, migration, acceptance checks, risks, and open decisions.
- **Tickets:** one user-visible or system outcome per vertical slice, with dependencies, allowed area, acceptance checks, verification method, and focused-session size. Use expand–migrate–contract for wide compatibility changes.
- **Workflow:** trigger, owner, execution mode, inputs, structured stage contracts, packet charters and anti-charters, pipeline versus justified barriers, approvals, outputs, bounded loops, cap disclosure, failure recovery, privacy boundary, and one normal plus one failure walkthrough.
- **Refactor:** measured pain, characterization coverage, seam, behavior-preserving slices, compatibility, migration, verification, and rollback. Compare no change, local change, and broader change.
- **Arbiter:** normalize competing plans, hide author identity when practical, score against one rubric, preserve strong dissent, then adopt, hybridize, or reject. Tie-break by user fit, correctness, evidence, simplicity, rollback, then cost.

Return the lightest useful planning output with traceability, dependencies, completion checks, rejected alternatives, disclosed remainder, and `Not doing` when those fields matter. A Direct plan MAY be only the chosen approach and decisive check. A plan is a guardrail for outcomes and decisions, not line-by-line code choreography. Do not claim implementation occurred.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
