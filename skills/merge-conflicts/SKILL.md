---
name: merge-conflicts
description: "Resolve merge, rebase, or cherry-pick conflicts by preserving intended behavior from both sides and verifying the integrated result. Use when conflict markers or semantic integration failures exist."
---
# Merge Conflicts
1. **Operation and authority.** Identify the operation, base, current branch, and incoming changes. Check whether the user authorized continuation or history rewriting.
2. **Both versions.** Read both versions, surrounding code, commits, and tests. Do not select “ours” or “theirs” blindly.
3. **Compatible intent.** Resolve one coherent area at a time. Retain both intentions if they are compatible. Otherwise, state the tradeoff.
4. **Remaining conflicts.** Search for remaining conflict markers and generated-file inconsistencies. Before deleting or overwriting either side, verify the intended safe state and retain a recovery path.
5. **Integrated verification.** Run focused tests. Then run the relevant integration suite and review the final diff.
6. **Authorised continuation.** Continue or complete the operation only with authorization. Never force-push or rewrite shared history without explicit approval.
Report resolved files, decisions, commands, checks actually run, and remaining conflicts. If the operation must pause, report the recovery command.
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
