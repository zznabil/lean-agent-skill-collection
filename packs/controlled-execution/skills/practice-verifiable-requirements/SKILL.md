---
name: practice-verifiable-requirements
description: "Write atomic requirements with accountable evidence."
---
# Verifiable requirements

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
