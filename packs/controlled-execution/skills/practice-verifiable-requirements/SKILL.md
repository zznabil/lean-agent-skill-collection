---
name: practice-verifiable-requirements
description: "Write atomic requirements with accountable evidence."
---
# Verifiable requirements

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
Use when a director, worker, reviewer or system must demonstrate completion. Produce one independently testable obligation at a time, not an unverifiable broad responsibility. This pattern does not make a generic workflow a NASA requirement.

## Requirement record
For each requirement, record `ID`, `ACTOR`, `TRIGGER / TIMING`, `REQUIRED ACTION OR INFORMATION`, `EXPECTED RESULT`, `EVIDENCE`, `VERIFIER`, `HOLD POINT`, `FAILURE CONDITION` and `RECOVERY`. Record `EXCEPTION` only when authorised.

## Steps
1. Name one accountable actor or organisation and one required action or information product in active voice.
2. State when the requirement applies and when it must be complete.
3. Define the observable result separately from the activity. Give evidence that demonstrates the result and a verifier who evaluates it.
4. Set a hold point before progression when an undetected defect would become costly. State the failing result and permitted recovery before that gate.
5. Split combined obligations until each can pass or fail independently. Replace vague modifiers such as “properly” or “thoroughly” with measurable criteria.

## Worked distinction
**Weak:** The worker MUST thoroughly test the change.

**Controlled:**
- The worker MUST run the repository's relevant test command after the edit.
- The worker MUST report the command, exit code, passed count and failed count.
- The director MUST inspect that evidence.
- The director MUST NOT accept the task while a required test is failed or unrun.

## Verify and recover
Trace every completion claim to observed evidence. Hold acceptance if actor, test method or threshold is missing, or required evidence failed or was not run. Correct the requirement or defect, rerun the check, and report verified, failed and unrun obligations separately.

Source details and access limits: [SOURCES.md](SOURCES.md).
