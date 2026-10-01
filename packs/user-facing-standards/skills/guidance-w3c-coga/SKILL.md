---
name: guidance-w3c-coga
description: "Find cognitive barriers using W3C COGA guidance."
---
# W3C COGA: cognitive usability
## Use
- Use this skill when people must understand, decide, act or recover in an interface or instruction. Deliver cognitive barriers and changes linked to the task. Do not deliver a diagnosis-based user profile.
- Identify intended users and the task. In agent-facing prose, use explicit state and clarity as design choices. Do not claim that agents share human cognition.
## Source and scope
- Read the relevant objectives and patterns in references/coga-official.html.txt. This file contains the official 2021 Working Group Note.
- Use this source as supplemental guidance. It is not a WCAG success-criteria checklist or a certification scheme.
## Procedure
1. Make the purpose, controls and current task understandable from the current screen or instruction.
2. Make needed information easy to find. Use clear labels, grouping, navigation and recognisable destinations.
3. Use concrete, literal language and stable terms. Explain necessary specialised language beside its first use.
4. Prevent avoidable errors. Show what went wrong, what remains saved and which correction path is permitted.
5. Help users maintain or regain focus. Control unnecessary interruptions without hiding urgent information.
6. Keep required values, choices and state visible. Do not rely on recall across screens or turns.
7. Provide accessible help where users need it. When human support is available, provide an understandable route to it.
8. Support relevant adaptation and personalisation. Do not assume that every user needs every option.
9. When practical, involve people with relevant cognitive and learning disabilities in research, design and evaluation.
10. Test the real tasks: find, understand, complete and resume. Record where users stop, what help they need and whether recovery works.
## Keep the task contract
- Preserve warnings, conditions, negation, quantities and recovery information when simplifying language.
- Repeat essential state when useful. Do not remove it solely because it appears elsewhere.
- Do not force a fixed number of bullets, quizzes, reading level or a persona onto every user.
- A style change cannot replace a missing functional recovery path. Record the product defect separately.
## Verify and deliver
- Link each proposed change to a specific user barrier and relevant pattern.
- Recheck the normal journey, an error and interruption/resumption. Identify user groups that were not tested.
- Report observed usability findings separately from WCAG conformance findings.
## Worked distinction
A form asks for an earlier reference number on a later screen.
Keep that number available or permit a safe lookup; do not merely tell the user to remember it.
## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If it loads, it governs. Do not claim root activation without evidence. Apply this skill’s source-specific procedure only to its task, not to every reply.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis organization to separate how-to, reference and explanation when helpful. These are communication inspirations, not formal conformance claims.
- Lead with the supported result and next action. Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and the requested format. Never call an unchecked result compliant or complete.
- For normative text, preserve BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, identify one actor, action and observable check.
- Before a hazardous action, state the verified risk and give a warning. For critical steps, provide a hold point and check the safe state. When failure is plausible, give the expected result, failure sign and recovery path. These controls do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining). Calculate the floor percentage from durable counts. Report the PASS/FAIL/BLOCKED verdict separately. Count a failed, blocked, skipped or untested item only after classifying it with evidence. If no total is defensible, report the phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. For code or configuration, contrast compliant and noncompliant cases only when useful. Do not force examples or sections on simple tasks.
For source editions, local files, official links and reuse limits, see [SOURCES.md](SOURCES.md).
