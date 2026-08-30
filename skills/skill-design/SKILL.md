---
name: skill-design
description: "Create, refactor, evaluate, package, import, or route portable agent skills, workflow instructions, and skill stacks. Use for SKILL.md, plugin compatibility, benchmark design, third-party audits, trigger quality, executable workflow review, or reducing skill-set bloat."
---

# Skill Design

## Import

1. Inspect source, revision, license, trigger, files, tool assumptions, network use, state mutation, executable code, hooks, installers, automatic updates, permissions, and actual behavior. Apply **ISO/IEC 20741-inspired tool selection**: start from requirements and measured trials, not reputation or feature count.
2. Distinguish a **skill** that changes agent behavior from a **runtime** that adds execution capability. Adopt a runtime separately only when the capability is real, needed, pinned, reviewable, and cannot be reproduced safely by existing host tools.
3. Prefer a disposable project-local prompt, script, checker, or simulator before a global skill when the need is task-specific.
4. **Adopt** a separate skill only for a distinct leading action and independent trigger.
5. **Absorb** sharp rules into an existing skill or conditional reference when the workflow overlaps.
6. **Reject** provider wrappers, session-start routers, automatic trusted-file mutation, duplicate doctrine, promotion, arbitrary gates, unreviewed dynamic code execution, or infrastructure whose risk and cost exceed behavioral value.

## Stack and route

1. Choose one primary skill whose leading action matches the request. Add another only for a distinct phase or independent review. Do not preload or chain a catalog by default.
2. For a stack or runtime, record exact IDs, source revision or digest, host and scope, purpose, overlap decision, permissions, executable surfaces, update behavior, and rollback. For a standard, record version, status, official source, review date, Lean home, and next review trigger. Preview before applying. Structural validity does not prove semantic fit, safety, or conformance. Read `PLAYBOOKS.md` when needed.

## Write or refactor

1. Inspect the existing format, names, references, and real host constraints. Start with an outcome spine: result, next consumer, observable done condition, and non-obvious intent. Classify guidance as an invariant, default, or heuristic; do not make every preference mandatory.
2. Merge skills that always run together or differ only by tone, depth, style, checklist, standard, or orchestration branding.
3. Treat the description as a routing interface and permanent context cost: state action, trigger, and any expensive anti-trigger; do not summarize the whole workflow.
4. Keep `SKILL.md` executable and short. Move conditional detail to a small reference only when it saves repeated context. A standalone skill carries every required reference inside its directory; root doctrine cannot be a hidden dependency.
5. A cross-cutting mandate that must survive explicit skill selection MUST NOT depend only on another skill being co-loaded. Put its smallest sufficient fallback in the selected skill or in a trusted host-level policy.
6. Use capability language in the neutral skill and thin host adapters beside it.
7. Include completion, permission, and failure rules only when they change execution. Every `MUST` should map to observable behavior, a check, a tool affordance, or an explicit decision rule. Remove motivational rules the environment cannot evaluate.
8. Remove wrappers, aliases, promotion, reading lists, fake tools, and facts the environment can reveal directly.

## Evaluate and package

Use `PLAYBOOKS.md` for structural, routing, behavioral, workflow-topology, trusted-refinement, and runtime-safety tests; objective assertions; cost measurement; adapters; manifests; path checks; and clean extraction. Trusted doctrine MUST NOT self-modify during ordinary task execution. A proposed refinement needs a baseline, held-out or adversarial cases, a reviewed diff, explicit authorization, and rollback. Add words or infrastructure only when observed behavior justifies them.

A good skill changes behavior with the fewest durable words. A good workflow makes mechanics deterministic without hiding cost, failure, or permission. Neither simulates authority or promises capabilities the host lacks.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
