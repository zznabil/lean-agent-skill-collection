---
name: practice-state-verification
description: "Gate risky work on verified state transitions."
---
# State verification

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- When writing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve force. Give each requirement one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence does not establish success.
- These execution rules do not transfer legal or organisational authority from communication or control patterns.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Purpose and boundary
Use this routine when risky work depends on a known system state. Completing a step does not prove that the required state exists. This routine cannot replace a legally required lockout/tagout programme or qualified procedure.

## State sequence
`PREPARE → CHANGE OR ISOLATE → SECURE → VERIFY → HOLD → WORK → INSPECT → RESTORE → VERIFY RESTORATION`

## Steps
1. Define the starting state and required controlled state. Identify the authorised actor, scope and evidence criterion. Prepare tools, permissions, backups and communication.
2. State hazards and consequences before the change. Use the authorised mechanism to change or isolate the system. Secure it against unintended reversal, concurrent change or reaccumulation.
3. Independently observe or test the actual state. PAUSE: do not work until the evidence meets the criterion.
4. Perform only bounded work authorised for that state. If the state can change, verify it again at the defined interval or trigger.
5. Inspect the work and surrounding scope. Restore the system in the defined order. Verify the restored state and record remaining restrictions.

## Failure and recovery
Failed, missing or stale verification MUST stop progression. Recovery MUST return the system to a known state before retry. If ownership or state is uncertain, do not improvise restoration. Hold the operation and seek the qualified procedure or owner.

## Worked distinction
**Insufficient:** Apply a patch and continue because the command returned no visible error.

**Controlled:** Apply the patch, read the modified file, run the required test, inspect the result, stop on failure, repair, and repeat verification before progression.

## Verify
Return the observed state at each hold point. Identify the verifier, evidence and restoration result. Do not claim task completion if you cannot establish the true state safely.

See [SOURCES.md](SOURCES.md) for source details and access limits.
