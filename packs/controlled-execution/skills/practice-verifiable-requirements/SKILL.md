---
name: practice-verifiable-requirements
description: "Write atomic requirements with accountable evidence."
---
# Verifiable requirements

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If it loads, its policy governs this skill. Otherwise, you MUST apply this kernel independently. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Keep simple replies short. These are the only default communication drivers, not a claim of formal standards conformance.
- When writing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, one action and one observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence does not establish success.
- These execution rules do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use this routine when a director, worker, reviewer or system must demonstrate completion. Produce one independently testable obligation at a time. Do not substitute an unverifiable broad responsibility. The routine generalises a requirement-quality mechanism from NASA NPR 1400.1I. It does not make a generic workflow a NASA requirement.

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
Link every completion claim to observed evidence. Hold acceptance if the actor, test method or threshold is missing. Also hold acceptance if required evidence failed or was not run. Correct the requirement or defect and rerun the check. Report verified, failed and unrun obligations separately.

For source details and access limits, see [SOURCES.md](SOURCES.md).
