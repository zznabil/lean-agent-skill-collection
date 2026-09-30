---
name: plan
description: "Turn evidence and resolved decisions into an executable proposal, spec, ticket set, workflow, refactor plan, or comparison of competing plans. Use for planning artifacts, not implementation unless also requested."
---
# Plan
Select **proposal**, **spec**, **tickets**, **workflow**, **refactor**, or **arbiter**.
- First choose the output depth: **Direct** (a few sentences), **Brief** (bounded units, files, and checks in chat), or **Durable** (a versioned artifact for high-risk, multi-session, or headless work).
- If implementation is also requested and the task is clear, local, reversible, and proved by one decisive check, use Direct. Proceed without a separate plan artifact.
## Common process
1. State the proposed outcome and next consumer first. Reconstruct the current state, constraints, non-goals, users, risks, and definition of done from the conversation and workspace.
2. Verify consequential claims against files, behavior, documentation, tests, or data.
   - Identify the riskiest unknown and the cheapest probe that can remove it.
   - Run one quick necessity check: delete, reduce, defer, build, or build hard.
   - Do not require a verdict ceremony for obvious work. Mission-critical complexity may justify `build hard`.
3. Apply **ISO/IEC/IEEE 29148-inspired requirements traceability**. Express each material requirement as ID, source, observable statement, verification method, environment, and threshold.
   - For event-, state-, option-, or failure-dependent behavior, use **EARS** forms—`WHEN`, `WHILE`, `WHERE`, or `IF … THEN`—with a **BCP 14** response.
   - Do not turn an inferred preference into a requirement.
   - In Durable artifacts, keep stable `REQ-#`, `UNIT-#`, and `DEC-#` identifiers. Never silently renumber them.
   - Mark examined decisions `SETTLED`. Reopen them only when new evidence invalidates them.
4. For accessibility-sensitive work, apply **ISO/IEC 29138-1:2018 and 29138-4:2026** as a lightweight needs map: `user accessibility need → barrier → requirement → evidence`. Do not use one diagnosis or persona as a proxy for all users.
5. For independent capabilities, map the owner, interface, dependencies, acceptance checks, and integration point.
   - For Durable or delegated work, maintain a revisioned contract inventory. Give every independently omittable required outcome and every acceptance-changing constraint a stable ID, owner, observing gate or manual review, disposition, and revision. `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` remain non-completion unless an authorized scope change removes the requirement.
   - Prove coverage in both directions. Map every requirement to work. Map every work item to a requirement or explicit enabling need.
6. Place verification where its evidence exists.
   - A leaf check MUST be satisfiable from that leaf's owned artifact.
   - Place interface compatibility, end-to-end behavior, joined-state invariants, and regression across several leaves in the integration unit. These checks SHOULD run once there rather than in every leaf.
   - For shared surfaces, choose the smallest contract: none, a 5–12 line inline contract, or a full contract. Use a full contract only when consumers, compatibility, migration, auth, data, CLI, API, or UI-flow risk justifies it.
   - If you cannot name a consumer, surface, check, deliverable, or blocker, skip the ceremony.
7. Select only applicable **ISO/IEC 25010** quality attributes that can change the decision.
   - For material risk, use an **ISO 31000 / IEC 31010 / ISO/IEC/IEEE 16085-inspired** record: cause → event → consequence, exposure, treatment, owner, trigger, and evidence.
   - Resolve only blocking choices. For minor reversible gaps, record a conservative default.
8. For every unresolved consequential decision, recommend a default. State its main trade-off and what it blocks. Group tightly related questions. Do not ask the user to choose what current evidence already resolves.
9. Prefer verified vertical slices. Order them by dependency and risk. Preserve known behavior. Include rollback for risky steps.
10. Write locally by default. Change a remote tracker only with explicit authorization.
## Modes
- **Proposal:** State the problem and evidence. When a real tradeoff exists, give deliberately different credible options. Include the recommendation, smallest test or MVP, kill or revisit criteria, dissent, and `Not doing`.
- **Spec:** Include the outcome, scope, capability map, requirements, interfaces, data, failure paths, migration, acceptance checks, risks, and open decisions.
- **Tickets:** Assign one user-visible or system outcome to each vertical slice. Include dependencies, allowed area, acceptance checks, verification method, and focused-session size. Use expand–migrate–contract for wide compatibility changes.
- **Workflow:** Include the trigger, owner, execution mode, inputs, structured stage contracts, packet charters and anti-charters, pipeline versus justified barriers, approvals, outputs, bounded loops, cap disclosure, failure recovery, privacy boundary, and one normal plus one failure walkthrough.
- **Refactor:** Include measured pain, characterization coverage, seam, behavior-preserving slices, compatibility, migration, verification, and rollback. Compare no change, local change, and broader change.
- **Arbiter:** Normalize competing plans. Hide author identity when practical. Score against one rubric and preserve strong dissent. Then adopt, hybridize, or reject. Break ties by user fit, correctness, evidence, simplicity, rollback, then cost.
Return the lightest useful planning output. Include traceability, dependencies, completion checks, rejected alternatives, disclosed remainder, and `Not doing` when those fields matter.
- A Direct plan MAY contain only the chosen approach and decisive check.
- Use a plan to guide outcomes and decisions, not line-by-line code choreography.
- Do not claim that implementation occurred.
## Communication kernel
- If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are communication guides, not a claim of formal standards conformance.
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to support the answer. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not replay routine tool work or add routine praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. When the agent makes an actual error, acknowledge it and give the correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
## Conditional execution and reporting
- When expressing normative force, use BCP 14 only for that purpose. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Where needed, add a hold point and check the safe state. State the expected result, failure sign, and recovery.
- When a mechanism is difficult, explain it simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Calculate it from processed items and round down. Keep progress separate from the verdict. Otherwise, report phase and evidence without a bar. Processed is not passed.
- Avoid unexpected scope changes. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or when helpful for substantial chat. Each must add distinct value.
