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
1. Record the goal, scope, constraints, current revision or checkpoint, and terminal or pause state.
2. Give paths to existing specs, diffs, issues, logs, and artifacts. Do not duplicate large content stored elsewhere.
3. Record completed work, changed files, decisions, checks actually run, failures, blockers, risks, rollback, and the exact next command or action.
4. Identify relevant areas deliberately left unchanged. Identify out-of-scope concerns that the next worker could mistake for omissions.
5. List relevant skills for the next session only if they add distinct value.
6. Remove obsolete scratch details. Make the first-use path clear. State whether the user must act. Provide enough information for a fresh agent to continue without reading the full conversation again.
Do not label unverified work complete. Remove secrets and unnecessary private data.
For status records and handoffs, distinguish an observed failure from an unknown cause. Retain failed, untested, and partially completed states. Identify the responsible actor only when evidence supports that attribution. Record the next safe action. A prose rewrite cannot improve the verdict.
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
