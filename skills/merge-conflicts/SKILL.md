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
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
