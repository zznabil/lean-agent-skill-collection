---
name: handoff
description: "Create a concise status recap or durable handoff. Use after substantial work, before interruption, or when another session needs the exact current state and next action."
---
# Handoff
Select one mode.
## Quick status
Start with `DONE`, `PARTIAL`, or `BLOCKED`. Then report:
- **Result:** state what exists now.
- **Verified:** list the checks actually run and their outcomes. Label evidence that is unrun or stale.
- **Next:** give one action only if work remains.
## Durable handoff
1. Record goal, scope, constraints, current revision or checkpoint and terminal or pause state.
2. Link existing specs, diffs, issues, logs and artefacts rather than duplicating large content.
3. Record completed work, changed files, decisions, actual checks, failures, blockers, risks, rollback and the exact next command or action.
4. Name relevant areas deliberately unchanged and out-of-scope concerns that could look like omissions.
5. List skills for the next session only when they add distinct value.
6. Remove obsolete scratch detail. Make first use and remaining user action clear. A fresh agent must be able to continue without reading the full conversation.
Do not label unverified work complete. Remove secrets and unnecessary private data.
For status records and handoffs, distinguish an observed failure from an unknown cause. Retain failed, untested, and partially completed states. Identify the responsible actor only when evidence supports that attribution. Record the next safe action. A prose rewrite cannot improve the verdict.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive, external, consequential or surprising actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
