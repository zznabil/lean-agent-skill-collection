---
name: guidance-safe-technical-procedures
description: "Write safe procedures, not warning-only fixes."
---
# Safe technical procedures

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use for destructive commands, firmware, permissions, storage, production changes or other technically hazardous work. Make correct execution control the hazard; a warning supports the procedure but cannot replace it. This routine does not claim military technical-manual conformance.

## Steps
1. State scope, authorised role, prerequisites, tools and known starting state. Name irreversible effects, cost, data loss and service impact before commitment.
2. Remove or restrict hazardous capability where feasible. Provide recovery or rollback before the first irreversible action.
3. Give each step one action or tightly coupled group. Put its warning immediately before the hazardous action.
4. After each state change, state the expected observable result, failure sign and safe response beside the step.
5. PAUSE before progression while required state or approval is unverified. Verify again after restoration.
6. Keep domain-specific limits, values and terms exact; never simplify away a safety condition.

## Warning test
A warning is inadequate when the procedure still invites an unsafe action, the safe action is absent or late, the actor cannot verify state, severity wording lacks an authorised scheme, or recovery starts from an unknown state.

## Worked distinction
**Warning-only:** “CAUTION: This command may erase data. Run the command.”

**Controlled procedure:** Confirm the target, display the resolved device identifier, verify the backup, restrict the command to that identifier, obtain required approval, execute, inspect the result and restore only through the defined recovery path.

## Verify and recover
Walk the procedure from prerequisites through restoration using stated evidence. If warning-only wording carries a control, move that control into an action and retest. Stop on failed or unknown state; use the defined recovery path rather than improvising. Return the procedure, warnings, hold points and recovery.

Source details and access limits: [SOURCES.md](SOURCES.md).
