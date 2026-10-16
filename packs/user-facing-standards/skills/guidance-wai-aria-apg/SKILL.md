---
name: guidance-wai-aria-apg
description: "Apply WAI-ARIA patterns to a specific web interaction."
---
# WAI-ARIA APG: accessible interaction patterns

## Use
- Use this skill for the keyboard interaction and accessible semantics of a specific web widget. Return a working component or findings for the defined pattern scope.
- First identify the widget and platform. Do not add ARIA just because the task edits HTML.

## Source and scope
- The references/ directory contains the APG overview, pattern index, keyboard guide and naming guide.
- Before you change a widget, load its specific live pattern and examples from the official index.
- The bundle does not include every widget page. Treat missing pattern details as unchecked until you retrieve them.
- APG examples provide guidance. They do not guarantee production readiness or constitute a complete WCAG audit.

## Procedure
1. Prefer a native HTML element if it provides the required behaviour and meets the task.
2. Select the pattern that matches the actual interaction. Do not assign a role that the element cannot fulfil.
3. Implement the required keyboard behaviour in code. A role does not create event handling.
4. Define how Tab enters and leaves the component. Define how focus moves within composite widgets.
5. Use the focus-management technique that the pattern specifies. Distinguish DOM focus from selection.
6. Provide an accessible name from visible text when possible. Distinguish the name, description and state.
7. Synchronise required roles, properties and states with the rendered state and interactive state.
8. Test opening, closing, selection, disabled states and focus recovery when the component supports them.
9. Verify the accessible tree and keyboard path in the target browser and assistive technology. A role alone does not prove that the widget works.
10. Record support gaps and departures from the selected pattern. Include reproducible steps and current evidence.

## Keep the task contract
- Do not replace native semantics with conflicting roles. Do not use ARIA to conceal a functional keyboard defect.
- Do not treat an attractive static screenshot as proof that a widget is operable.
- Follow the task authority. A passed code review alone does not authorise component deployment.

## Verify and deliver
- After a change, recheck keyboard behaviour, names and states. Report unsupported combinations and states you did not test.
- Distinguish an APG-pattern review, normative ARIA validation and whole-page WCAG conformance.
- Return the component change or findings for the defined scope. Identify the exact pattern and tested environment.

## Worked distinction
A div with role="button" still needs appropriate focusability and keyboard handling.
A native button is preferable when it provides the intended action and semantics.

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
