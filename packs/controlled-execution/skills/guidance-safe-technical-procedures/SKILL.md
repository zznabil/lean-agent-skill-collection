---
name: guidance-safe-technical-procedures
description: "Write safe procedures, not warning-only fixes."
---
# Safe technical procedures

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
Use this skill for destructive commands, firmware, permissions, storage, production changes or other technically hazardous work. Make correct execution control the hazard. A warning supports the procedure but cannot replace it. This routine does not claim military technical-manual conformance.

## Steps
1. State the scope, authorised role, prerequisites, tools and known starting state. Before commitment, identify irreversible effects, cost, data loss and service impact.
2. Where feasible, remove or restrict hazardous capability. Provide recovery or rollback before the first irreversible action.
3. Give each step one action or one tightly coupled group of actions. Put its warning immediately before the hazardous action.
4. After each state change, put the expected observable result, failure sign and safe response beside the step.
5. PAUSE before progression while required state or approval remains unverified. After restoration, verify again.
6. Preserve exact domain-specific limits, values and terms. Never remove a safety condition to simplify the procedure.

## Warning test
A warning is inadequate if any of these conditions applies:
- The procedure still invites an unsafe action.
- The safe action is absent or late.
- The actor cannot verify state.
- Severity wording lacks an authorised scheme.
- Recovery starts from an unknown state.

## Worked distinction
**Warning-only:** “CAUTION: This command may erase data. Run the command.”

**Controlled procedure:** Confirm the target, display the resolved device identifier, verify the backup, restrict the command to that identifier, obtain required approval, execute, inspect the result and restore only through the defined recovery path.

## Verify and recover
Walk through the procedure from prerequisites to restoration. Use the stated evidence. If warning-only wording carries a control, move the control into an action. Retest the procedure. Stop if state fails verification or remains unknown. Use the defined recovery path. Do not improvise. Return the procedure, warnings, hold points and recovery.

For source details and access limits, read [SOURCES.md](SOURCES.md).
