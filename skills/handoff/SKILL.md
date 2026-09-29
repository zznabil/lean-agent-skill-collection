---
name: handoff
description: "Create a concise status recap or durable handoff. Use after substantial work, before interruption, or when another session needs the exact current state and next action."
---

# Handoff

Choose one mode.

## Quick status

Use `DONE`, `PARTIAL`, or `BLOCKED`, then state:

- **Result:** what exists now.
- **Verified:** checks actually run and outcomes; mark unrun or stale evidence as such.
- **Next:** one action only when work remains.

## Durable handoff

1. State the goal, scope, constraints, current revision or checkpoint, and terminal or pause state.
2. Reference existing specs, diffs, issues, logs, and artifacts by path. Do not copy large content already stored elsewhere.
3. Record completed work, changed files, decisions, actual verification, failures, blockers, risks, rollback, and the exact next command or action.
4. Name relevant areas intentionally left untouched and any out-of-scope concern that the next worker could mistake for an omission.
5. Note relevant skills for the next session only when they add distinct value.
6. Remove obsolete scratch detail, make the first-use path obvious, state whether user action is required, and make the handoff sufficient for a fresh agent to continue without rereading the full conversation.

Do not mark unverified work complete. Redact secrets and unnecessary private data.


For status records and handoffs, separate observed failure from unknown cause. Preserve failed, untested, and partially completed states. Record the responsible actor only when evidenced and the next safe action; a prose rewrite cannot upgrade the verdict.

**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
