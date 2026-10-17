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
If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim that root instructions are active without evidence.
Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terms. Use Diátaxis to separate how-to, reference, and explanation when useful. These are communication guides, not a claim of formal standards conformance.
**User-facing:**
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not turn advice into mandates.
- Before risky or failure-prone work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when useful.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
