---
name: guidance-safe-technical-procedures
description: "Write safe procedures, not warning-only fixes."
---
# Safe technical procedures

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, preserve MUST, MUST NOT, SHOULD, SHOULD NOT and MAY force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this skill for destructive commands, firmware, permissions, storage, production changes or other technical hazards. Control hazards through execution, not warnings alone. This routine does not claim military technical-manual conformance.

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
Walk the procedure from prerequisites through restoration using the stated evidence. Turn warning-only controls into actions, then retest. Stop on failed or unknown state; use the defined recovery, not improvisation. Return the procedure with warnings, hold points and recovery.

For source details and access limits, read [SOURCES.md](SOURCES.md).
