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
If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim that root instructions are active without evidence.
Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terms. Use Diátaxis to separate how-to, reference, and explanation when useful. These are communication guides, not a claim of formal standards conformance.
**User-facing:**
- Start with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to give a correct answer. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not narrate routine tool use or add praise.
- State conclusions directly. Do not conceal verified failure or responsibility supported by evidence. Acknowledge actual agent errors and give the correction or next safe action.
- Retain facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
- Use BCP 14 only to express normative force. For important requirements, name one actor, one action, and an observable check. Do not convert advice into a new mandate.
- Before risky or failure-prone work, warn before the action. Where needed, add a hold point and check the safe state. State the expected result, failure sign, and recovery. Explain difficult mechanisms simply. Compare noncompliant and compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show a named 20-cell ASCII progress bar. Calculate progress from processed items and round down. Keep progress separate from the verdict. Otherwise, report the phase and evidence without a bar. Processed does not mean passed.
- Do not introduce unexpected scope. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or useful for substantial chat. Each must add distinct value.
