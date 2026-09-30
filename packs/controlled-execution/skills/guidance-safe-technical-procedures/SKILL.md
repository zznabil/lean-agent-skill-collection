---
name: guidance-safe-technical-procedures
description: "Write safe procedures, not warning-only fixes."
---
# Safe technical procedures

## Communication kernel
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point. Use familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful.
- If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. If it loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- For normative requirements, use uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These communication and control patterns do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them. They are not default communication drivers.

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
