---
name: guidance-w3c-coga
description: "Find cognitive barriers using W3C COGA guidance."
---
# W3C COGA: cognitive usability

## Use
- Use when people must understand, decide, act or recover in an interface or instruction. Deliver task-linked cognitive barriers and changes, not a diagnosis-based user profile.
- Name intended users and the task. For agent-facing prose, use explicit state and clarity as design choices, not a claim that agents share human cognition.

## Source and scope
- Read relevant objectives and patterns in references/coga-official.html.txt, the official 2021 Working Group Note.
- This is supplemental guidance. It is not a WCAG success-criteria checklist or a certification scheme.

## Procedure
1. Make the purpose, controls and current task understandable from the current screen or instruction.
2. Make needed information easy to find through clear labels, grouping, navigation and recognisable destinations.
3. Use concrete, literal language and stable terms. Explain necessary specialised language beside its first use.
4. Prevent avoidable errors. Show what went wrong, what remains saved and the permitted correction path.
5. Help users maintain or regain focus; control unnecessary interruption without hiding urgent information.
6. Keep required values, choices and state visible instead of relying on recall across screens or turns.
7. Provide accessible help at the point where it is needed, with an understandable route to human support when
  available.
8. Support relevant adaptation and personalisation without assuming every user needs every option.
9. Involve people with relevant cognitive and learning disabilities in research, design and evaluation when
  practical.
10. Test the real find, understand, complete and resume tasks. Record where users stop, what help they need and whether recovery works.

## Keep the task contract
- Preserve warnings, conditions, negation, quantities and recovery information while simplifying language.
- Repeating essential state can be useful; do not remove it solely because it appears elsewhere.
- Do not force a fixed number of bullets, quizzes, reading level or a persona onto every user.
- A style change cannot replace an unavailable functional recovery path. Record the product defect separately.

## Verify and deliver
- Tie each proposed change to a specific user barrier and relevant pattern.
- Recheck the normal journey, an error and interruption/resumption. Identify untested user groups.
- Report observed usability findings separately from WCAG conformance findings.

## Worked distinction
A form asks for an earlier reference number on a later screen.
Keep that number available or permit a safe lookup; do not merely tell the user to remember it.

## Lean communication kernel (standalone fallback)
If root `AGENTS.md` is loaded, it governs. Otherwise apply these rules to communication. This skill’s source-specific procedure runs only for its task, not every reply.
- Lead with the supported result and next action. Use short, active ASD-STE100-inspired technical wording and CDC-style familiar words. Keep how-to, reference and explanation apart when Diátaxis separation helps.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Never call an unchecked result compliant or complete.
- In normative text, keep BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check (NASA).
- Before a hazardous action, show the verified risk and an ANSI-style warning. For critical steps, use a WHO-style hold point and OSHA-style safe-state check; give the FDA-style expected result, failure sign and recovery when failure is plausible. These analogies do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining) and floor percentage from durable counts; keep the PASS/FAIL/BLOCKED verdict separate. A failed, blocked, skipped or untested item counts only when classified with evidence. With no defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain a difficult mechanism from foundations (Feynman). Use SEI CERT-style compliant/noncompliant contrast for code or configuration only when useful. Do not force examples or sections on simple tasks.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
