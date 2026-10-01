---
name: skill-design
description: "Create, refactor, evaluate, package, import, or route portable agent skills, workflow instructions, and skill stacks. Use for SKILL.md, plugin compatibility, benchmark design, third-party audits, trigger quality, executable workflow review, or reducing skill-set bloat."
---
# Skill Design
## Communication kernel
Use ASD-STE100-inspired short, active technical sentences. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are communication guides, not claims of formal standards conformance. If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
## Import
1. Inspect source, revision, license, trigger, files, tool assumptions, network use, state mutation, executable code, hooks, installers, automatic updates, permissions, and actual behavior. For tool selection, apply **ISO/IEC 20741-inspired tool selection**. Start with requirements and measured trials, not reputation or feature count.
2. Distinguish a **skill**, which changes agent behavior, from a **runtime**, which adds execution capability. Adopt a runtime separately only when the capability is real, needed, pinned, reviewable, and cannot be reproduced safely with existing host tools.
3. Prefer a disposable project-local prompt, script, checker, or simulator to a global skill when the need is task-specific.
4. **Adopt** a separate skill only when it has a distinct leading action and independent trigger.
5. **Absorb** useful precise rules into an existing skill or conditional reference when workflows overlap.
6. **Reject** provider wrappers, session-start routers, automatic trusted-file mutation, duplicate doctrine, promotion, arbitrary gates, unreviewed dynamic code execution, and infrastructure whose risk and cost exceed its behavioral value.
## Stack and route
1. Choose one primary skill whose leading action matches the request. Add another only for a distinct phase or independent review. Do not preload or chain a catalog by default.
2. For a stack or runtime, record exact IDs, source revision or digest, host and scope, purpose, overlap decision, permissions, executable surfaces, update behavior, and rollback.
   - For a standard, record version, status, official source, review date, Lean home, and next review trigger.
   - Preview before you apply changes.
   - Structural validity does not prove semantic fit, safety, or conformance.
   - Read `PLAYBOOKS.md` when needed.
## Write or refactor
1. Inspect the existing format, names, references, and actual host constraints. Start with the result, next consumer, observable completion condition, and non-obvious intent. Write short active decisions. Where a requirement matters, name one actor and a verifiable action. Classify guidance as invariant, default, or heuristic. Do not make every preference mandatory.
2. Treat a proposed skill merge as a behavioral change.
   - Before merging skills that appear to run together or differ only by tone, depth, style, checklist, standard, or orchestration branding, compare triggers, mandates, references, standalone entry points, authority, and completion rules.
   - Merge only within authorized scope and after required preservation checks pass.
3. Treat the description as a routing interface and permanent context cost. State the action, trigger, and any expensive anti-trigger. Do not summarize the entire workflow.
4. Keep `SKILL.md` complete and easy to execute.
   - Reduce avoidable wording, not required decisions.
   - Move conditional detail to a local reference only when the task trigger reliably loads it before it is needed. Measure claimed context savings in the actual loaded task.
   - Include every required reference inside a standalone skill's directory. Do not make root doctrine a hidden dependency.
5. A cross-cutting mandate that must survive explicit skill selection MUST NOT depend only on another skill loading with it. Put the smallest sufficient fallback in the selected skill or a trusted host-level policy.
6. Describe capabilities in the neutral skill. Put thin host adapters beside it.
7. Include completion, permission, and failure rules only when they change execution. Map every `MUST` to observable behavior, a check, a tool affordance, or an explicit decision rule. Remove motivational rules that the environment cannot evaluate.
8. Remove promotional filler, fake-tool claims, and facts that the environment can reveal directly.
   - Before removing a wrapper, alias, or reading-list entry, establish its purpose and dependencies.
   - Retain every entry that carries a required rule, supported capability, source reference, or standalone loading path. Propose any behavioral removal separately.
## Evaluate and package
Use `PLAYBOOKS.md` for structural, routing, behavioral, workflow-topology, trusted-refinement, and runtime-safety tests; objective assertions; cost measurement; adapters; manifests; path checks; and clean extraction.
- For user-facing skills, include short-answer, procedure, error/recovery, interruption/reorientation, target-user, and over-simplification cases. Readability alone does not provide task evidence.
- Trusted doctrine MUST NOT self-modify during ordinary task execution.
- A proposed refinement needs a baseline, held-out or adversarial cases, a reviewed diff, explicit authorization, and rollback.
- Add words or infrastructure only when observed behavior justifies them.
Use the fewest durable words that preserve the skill's complete behavioral contract. Keep triggers, required actions, exceptions, evidence, and recovery.
- Make workflow mechanics deterministic. Do not hide cost, failure, or permission.
- Neither a skill nor a workflow should simulate authority or promise capabilities that the host lacks.
## Preservation-first instruction editing
Before rewriting agent-facing rules or user-facing delivery guidance, read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md). Preserve the task contract and loading paths before reducing wording. A compact replacement must still name the applicable trigger, action, exception, evidence, and failure response.
Compare old and proposed instructions in both directions. Keep standards-register decisions, source links, named resources, and local fallbacks available at entry points that need them. Treat changes to descriptions, aliases, controller topology, invocation policy, and completion criteria as separate behavioral changes. Do not treat them as automatic results of a prose edit.
**User-facing:**
- Start with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Omit routine tool narration and praise.
- Apply the communication kernel. Use familiar words. State conclusions directly. Do not hide verified failure or evidenced responsibility. Correct actual agent errors or state the next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from style guidance.
- When stating normative force, use BCP 14 only for that purpose. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Add a hold point and safe-state check where needed. State the expected result, failure sign, and recovery. When a mechanism is difficult, explain it simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Calculate progress from processed items and round down. Keep progress separate from the verdict. Otherwise, report phase and evidence without a bar. Processed does not mean passed.
- Avoid surprise scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
