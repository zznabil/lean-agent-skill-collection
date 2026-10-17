---
name: practice-verifiable-requirements
description: "Write atomic requirements with accountable evidence."
---
# Verifiable requirements

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine when a director, worker, reviewer or system must demonstrate completion. Write independently testable obligations, not broad, unverifiable responsibilities. This generalises NASA NPR 1400.1I's requirement-quality mechanism; it does not make generic workflows NASA requirements.

## Requirement record
For each requirement, record `ID`, `ACTOR`, `TRIGGER / TIMING`, `REQUIRED ACTION OR INFORMATION`, `EXPECTED RESULT`, `EVIDENCE`, `VERIFIER`, `HOLD POINT`, `FAILURE CONDITION` and `RECOVERY`. Record `EXCEPTION` only when authorised.

## Steps
1. Identify one accountable actor or organisation. State one required action or information product in active voice.
2. State the trigger and completion deadline for the requirement.
3. Define the observable result separately from the activity. Specify evidence that demonstrates the result. Identify the verifier who evaluates the evidence.
4. Set a hold point before progression when an undetected defect would become costly. Before that gate, state the failing result and permitted recovery.
5. Split combined obligations until each can pass or fail independently. Replace vague modifiers such as “properly” or “thoroughly” with measurable criteria.

## Worked distinction
**Weak:** The worker MUST thoroughly test the change.

**Controlled:**
- The worker MUST run the repository's relevant test command after the edit.
- The worker MUST report the command, exit code, passed count and failed count.
- The director MUST inspect that evidence.
- The director MUST NOT accept the task while a required test is failed or unrun.

## Verify and recover
Link completion claims to observed evidence. Hold acceptance for a missing actor, test method or threshold, or failed or unrun required evidence. Correct the requirement or defect, then rerun. Report verified, failed and unrun obligations separately.

For source details and access limits, see [SOURCES.md](SOURCES.md).
