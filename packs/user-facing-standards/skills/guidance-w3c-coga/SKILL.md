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
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
See [SOURCES.md](SOURCES.md) for source limits.
