---
name: practice-state-verification
description: "Gate risky work on verified state transitions."
---
# State verification

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
Use when risky work depends on a known system state. A completed step does not prove the required state exists. This routine cannot replace a legally required lockout/tagout programme or qualified procedure.

## State sequence
`PREPARE → CHANGE OR ISOLATE → SECURE → VERIFY → HOLD → WORK → INSPECT → RESTORE → VERIFY RESTORATION`

## Steps
1. Define starting and required controlled states, authorised actor, scope and evidence criterion. Prepare tools, permissions, backups and communication.
2. Before change, state hazards and consequences. Change or isolate with the authorised mechanism; secure against unintended reversal, concurrent change or reaccumulation.
3. Independently observe or test the actual state. PAUSE: do not work until the evidence meets the criterion.
4. Perform only bounded work authorised for that state. If the state can change, verify again at its defined interval or trigger.
5. Inspect the work and surrounding scope. Restore in the defined order, verify the restored state and record remaining restrictions.

## Failure and recovery
A failed, missing or stale verification MUST stop progression. Recovery MUST return the system to a known state before retry. Do not improvise restoration when ownership or state is uncertain; hold the operation and seek the qualified procedure or owner.

## Worked distinction
**Insufficient:** Apply a patch and continue because the command returned no visible error.

**Controlled:** Apply the patch, read the modified file, run the required test, inspect the result, stop on failure, repair, and repeat verification before progression.

## Verify
Return the observed state at each hold point, verifier, evidence and restoration result. If the true state cannot be established safely, do not claim the task complete.

Source details and access limits: [SOURCES.md](SOURCES.md).
