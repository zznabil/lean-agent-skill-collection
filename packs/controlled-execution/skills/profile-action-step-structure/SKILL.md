---
name: profile-action-step-structure
description: "Order prerequisites and action-bearing procedure steps."
---
# Action-step structure profile

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Purpose and boundary
Use this profile after the procedure's technical content is known. Put prerequisites first. Put an action in every numbered step. Do not hide a required action behind ambiguous modal wording.

## Steps
1. State access, role, tools, starting state and other prerequisites before the numbered procedure.
2. Put warnings and irreversible consequences before the step that commits the actor.
3. Give each numbered step one action or a tightly coupled group of actions. When applicable, order its parts as optional status, reason or expected result, location, then action.
4. Use MUST or a direct imperative when the adopted contract requires the action. Use MAY or `Optionally` only for a genuine choice.
5. State the observable result after a consequential action. Put the failure sign and recovery beside that step.
6. Put background-only text outside numbered steps. Run the procedure from its stated prerequisites.

## Worked distinction
**Weak step:** You may need to configure branch protection.

**Required action:** To prevent direct changes, in **Settings → Branches**, select **Add branch protection rule**.

**Optional action:** Optionally, to require signed commits, under **Rules**, select **Require signed commits**.

These forms state optionality, purpose, location and action explicitly.

## Verify and recover
Confirm that every step advances the task. Confirm that every required action is present. If a prerequisite or action strength is unresolved, hold publication. Resolve it against the governing contract. Then rerun the procedure. Return steps with expected results and recovery paths.

See source details and access limits in [SOURCES.md](SOURCES.md).
