---
name: skill-design
description: "Create, refactor, evaluate, package, import, or route portable agent skills, workflow instructions, and skill stacks. Use for SKILL.md, plugin compatibility, benchmark design, third-party audits, trigger quality, executable workflow review, or reducing skill-set bloat."
---
# Skill Design
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with result or blocker, fresh evidence and material limits. Correct actual errors. Number steps, retain required items and restore relevant state after interruption. Omit routine narration, praise and recaps; TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive, external, consequential or surprising actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; keep evidenced progress separate from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
## Import
1. Inspect source, revision, license, trigger, files, tool assumptions, network use, state mutation, executable code, hooks, installers, automatic updates, permissions, and actual behavior. For tool selection, apply **ISO/IEC 20741-inspired tool selection**. Start with requirements and measured trials, not reputation or feature count.
2. Distinguish a **skill**, which changes agent behavior, from a **runtime**, which adds execution capability. Adopt a runtime separately only when the capability is real, needed, pinned, reviewable, and cannot be reproduced safely with existing host tools.
3. Prefer a disposable project-local prompt, script, checker, or simulator to a global skill when the need is task-specific.
4. **Adopt** a separate skill only when it has a distinct leading action and independent trigger.
5. **Absorb** useful precise rules into an existing skill or conditional reference when workflows overlap.
6. **Reject** provider wrappers, session-start routers, automatic trusted-file mutation, duplicate doctrine, promotion, arbitrary gates, unreviewed dynamic code execution, and infrastructure whose risk and cost exceed its behavioral value.
## Stack and route
1. Choose one primary task skill. Add support only for a distinct scope, execution, context or assurance responsibility. Resolve lifecycle ownership by explicit user designation, otherwise selected `get-it-done`, otherwise the unique substantive task skill. Stop affected actions if ownership remains ambiguous or the owner is not available, selected and loaded. Do not preload or chain a catalog by default. Alone, the selected skill retains its normal ownership.
   - Scope modifiers cannot weaken mandatory safety, trusted policy, authorization or acceptance. Capability executors own their evidence; assurance retains independent failed verdicts. Supporters do not issue final task status. The owner reports evidence and failures once; failed or missing required evidence prevents accepted completion. Presentation changes no facts, permissions or verdicts.
   - Standalone folders must carry these fallbacks without sibling or root dependencies. Unavailable required support blocks dependent acceptance; do not silently skip it.
2. For a stack or runtime, record exact IDs, source revision or digest, host and scope, purpose, overlap decision, permissions, executable surfaces, update behavior, and rollback.
   - For a standard, record version, status, official source, review date, Lean home, and next review trigger.
    - Preview changes to authority, runtime, routing or activation before applying them; keep routine local edits moving.
   - Structural validity does not prove semantic fit, safety, or conformance.
   - Read `PLAYBOOKS.md` when needed.
## Write or refactor
1. Inspect existing formats, names, references and host constraints. Name the result, next consumer, observable completion and non-obvious intent. Write short, active decisions. Important requirements name one actor and verifiable action. Distinguish invariants, defaults and heuristics; do not make every preference mandatory.
2. Treat skill merges as behavioural changes.
   - Before merging skills that co-activate or differ mainly by tone, depth, style, checklist, standard or orchestration branding, compare their contracts. Check triggers, mandates, references, standalone entry points, authority and completion rules.
   - Merge only within authorised scope after required preservation checks pass.
3. Treat descriptions as routing interfaces and permanent context costs. State action, trigger and expensive anti-trigger, not the whole workflow.
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
