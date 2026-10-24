---
name: practice-state-verification
description: "Gate risky work on verified state transitions."
---
# State verification

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor legal or organisational authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine when risky work requires a known system state. A completed step does not prove that state exists. This routine cannot replace a legally required lockout/tagout programme or qualified procedure.

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
Report each hold point's observed state, verifier and evidence, plus the restoration result. Do not claim completion unless you can establish the true state safely.

See [SOURCES.md](SOURCES.md) for source details and access limits.
