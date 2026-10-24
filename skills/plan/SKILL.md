---
name: plan
description: "Turn evidence and resolved decisions into an executable proposal, spec, ticket set, workflow, refactor plan, or comparison of competing plans. Use for planning artifacts, not implementation unless also requested."
---
# Plan
Select **proposal**, **spec**, **tickets**, **workflow**, **refactor**, or **arbiter**.
- First choose the output depth: **Direct** (a few sentences), **Brief** (bounded units, files, and checks in chat), or **Durable** (a versioned artifact for high-risk, multi-session, or headless work).
- If implementation is also requested and the task is clear, local, reversible, and proved by one decisive check, use Direct. Proceed without a separate plan artifact.
## Common process
1. Lead with the proposed outcome and next consumer. Recover the current state, constraints, non-goals, users, risks and definition of done.
2. Verify consequential claims against current files, behaviour, documentation, tests or data.
   Identify the riskiest unknown and cheapest resolving probe. Check whether to delete, reduce, defer, build or build hard.
   Do not add a verdict ceremony to obvious work; mission-critical complexity may justify `build hard`.
3. Apply **ISO/IEC/IEEE 29148-inspired requirements traceability**. Express each material requirement as ID, source, observable statement, verification method, environment, and threshold.
   - For event-, state-, option-, or failure-dependent behavior, use **EARS** forms—`WHEN`, `WHILE`, `WHERE`, or `IF … THEN`—with a **BCP 14** response.
   - Do not turn an inferred preference into a requirement.
   - In Durable artifacts, keep stable `REQ-#`, `UNIT-#`, and `DEC-#` identifiers. Never silently renumber them.
   - Mark examined decisions `SETTLED`. Reopen them only when new evidence invalidates them.
4. For accessibility-sensitive work, apply **ISO/IEC 29138-1:2018 and 29138-4:2026** as a lightweight needs map: `user accessibility need → barrier → requirement → evidence`. Do not use one diagnosis or persona as a proxy for all users.
5. Map independent capabilities to owners, interfaces, dependencies, acceptance checks and integration points.
   - For Durable or delegated work, maintain a revisioned contract inventory. Give each independently omittable outcome and acceptance-changing constraint a stable ID, owner, observing gate or manual review, disposition and revision.
     `ABANDONED`, `DEFERRED` and `OWNER_DECISION` mean incomplete unless an authorised scope change removes the requirement.
   - Map every requirement to work and every work item to a requirement or explicit enabling need.
6. Place checks where their evidence exists. A leaf check MUST be satisfiable from its owned artefact.
   Joined-state, interface, end-to-end and cross-leaf regression checks SHOULD run once at integration.
   Use no surface contract, a 5–12-line inline contract or a full contract according to consumer, compatibility, migration, auth, data, CLI, API or UI-flow risk.
   Skip ceremony without a named consumer, surface, check, deliverable or blocker.
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
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. Trusted root `AGENTS.md` governs when loaded; otherwise use this standalone fallback. Never claim root activation without evidence.
Use ASD-STE100-inspired short, active sentences, ISO 704-inspired stable terms and Diátaxis organisation when useful, without claiming formal conformance.
Lead with the answer, decision or blocker. Keep only necessary detail. Omit routine Summary headings and closing recaps.
Use TL;DR only when helpful for a long response, and place it first. Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action; omit routine narration and praise.
## Conditional execution and reporting
Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not invent mandates from advice.
Before risky work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery.
Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when helpful.
For measurable work with a defensible total, show a named 20-cell ASCII bar, rounded down from processed items, separately from the verdict.
Processed does not mean passed. Otherwise report the phase and evidence. Avoid surprise scope and leave the result usable or resumable.
