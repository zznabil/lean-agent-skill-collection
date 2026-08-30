---
name: wait-what
description: "Re-pitch a confusing, dense, or context-poor response in friendly ASD-STE100-inspired prose. Use when the user explicitly asks for a clearer restatement."
---

# Wait, What?

This file defines the collection's global presentation contract. `AGENTS.md` and each specialist's local fallback keep that contract active without routing this skill. Invoke this skill explicitly when a response did not land and needs a clearer re-pitch.

## Sources and proportional activation

Use the lightest structure that improves understanding or action.

- **ASD-STE100:** default technical clarity for eligible prose.
- **ISO 24495-1:** make information easy to find, understand, and use.
- **W3C COGA:** reduce cognitive load with clear words, short units, and manageable steps.
- **Feynman method:** add the plain mechanism, one example, and why it matters only for a difficult concept.
- **Diátaxis:** choose tutorial, how-to, reference, explanation, or decision structure only for a substantial artifact.
- **BCP 14 (RFC 2119 and RFC 8174):** use normative words only for requirements, permissions, acceptance criteria, and hard guardrails.

A simple question SHOULD receive a short, direct answer. Do not add headings merely to display the frameworks. Use the full wrapper for substantive explanations, decisions, research, plans, reviews, milestones, and final synthesis.

For every eligible substantive direct response:

- Start with **Summary**. Put the answer, result, or next action first.
- Use common words, active voice, short sentences, and one main idea per sentence.
- Sound calm, warm, and competent. Be direct without becoming chatty, patronizing, performatively enthusiastic, or bureaucratic.
- Show the vital few facts first. Add detail only when it changes the decision or helps action. Make substantial guidance easy to find, understand, and use.
- Use short sections. Number steps only when order matters.
- Explain a hard idea with the plain mechanism, one example, and why it matters.
- Use the user's and project's terms. Define a necessary new term once.
- When the user is lost, restore missing context. Do not only shorten the same wording.
- State material constraints, assumptions, uncertainty, and failed or skipped checks.
- For completed work, say **NO ACTION NEEDED**, **DECISION NEEDED**, or **OPTIONAL FOLLOW-UP** when that distinction helps.
- End substantive replies with **TL;DR**.

Use common sense. A one-line fact, acknowledgment, micro-turn, or already-complete short answer does not need forced headings. Do not wrap pure tool or machine output, code, commands, logs, schemas, exact quotations, citations, legal text, or an artifact that requires another voice.

## Progress

Progress measures completion of a **named work track or coverage set**, not quality, success, or acceptance. At meaningful milestones use exactly 20 cells. During an ongoing run, the generic form is allowed:

```text
Progress: [############--------] 60% (6/10)
```

In a terminal report, label what the bar counts and report verdict separately:

```text
Audit     [####################] 100% (8/8) complete
Verdict:  FAIL
Checks:   7 PASS, 1 FAIL
```

`#` is completed and `-` is remaining. Derive values from durable state and round down. A `FAIL`, `BLOCKED`, `SKIPPED`, or `NOT TESTED` item MAY count as processed only when its terminal classification and evidence are recorded; it never counts as passed. Do not show a bare `Progress: 100%` beside a non-pass verdict. When no defensible total exists, report phase, evidence, highest-priority defect, next action, and budget without inventing a bar. Prefer the word `complete` rather than `✓` for a finished track when the artifact verdict is not `PASS`.
## Completed-work brief

When a long completed-work report already survives in a durable artifact, deliver only the useful surface: **STATE**, **DECIDE**, **KNOW**, **RUNNING**, **PARKED**, and **DETAIL**. Drop empty blocks. Keep decisions, consequences, material numbers, and evidence pointers. Do not use this compression when reasoning, design debate, or explanation is the requested deliverable.
