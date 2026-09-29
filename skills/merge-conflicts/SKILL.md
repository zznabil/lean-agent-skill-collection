---
name: merge-conflicts
description: "Resolve merge, rebase, or cherry-pick conflicts by preserving intended behavior from both sides and verifying the integrated result. Use when conflict markers or semantic integration failures exist."
---

# Merge Conflicts

1. **Operation and authority.** Identify the operation, base, current branch, incoming changes, and whether the user authorized continuation or history rewriting.
2. **Both versions.** Read surrounding code, commits, tests, and both versions. Do not choose “ours” or “theirs” blindly.
3. **Compatible intent.** Resolve one coherent area at a time. Preserve both intentions when compatible; otherwise state the tradeoff.
4. **Remaining conflicts.** Search for remaining conflict markers and generated-file inconsistencies. Before deleting or overwriting either side, verify the intended safe state and preserve a recoverable path.
5. **Integrated verification.** Run focused tests, then the relevant integration suite and final diff review.
6. **Authorised continuation.** Continue or complete the operation only when authorized. Never force-push or rewrite shared history without explicit approval.

Report files resolved, decisions, commands, actual checks, remaining conflicts, and recovery command if the operation must pause.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
