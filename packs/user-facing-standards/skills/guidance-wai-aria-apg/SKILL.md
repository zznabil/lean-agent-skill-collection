---
name: guidance-wai-aria-apg
description: "Apply WAI-ARIA patterns to a specific web interaction."
---
# WAI-ARIA APG: accessible interaction patterns

## Use
- Use for the keyboard and accessibility semantics of a specific interactive web component.
- Identify the actual widget and platform. Do not add ARIA just because HTML is being edited.

## Source and scope
- The APG overview, pattern index, keyboard guide and naming guide are bundled under references/.
- Load the specific live pattern and its examples from the official index before changing a widget.
- The bundle does not mirror every widget page. Missing pattern details remain unchecked until retrieved.
- APG examples are guidance, not a production-readiness guarantee or a complete WCAG audit.

## Procedure
1. Prefer a native HTML element with the required behaviour when it meets the task.
2. Match the selected pattern to the actual interaction; do not give an element a role it cannot fulfil.
3. Implement required keyboard behaviour in code. Adding a role does not create event handling.
4. Establish how Tab enters and leaves the component and how focus moves within composite widgets.
5. Choose the focus-management technique specified by the pattern; keep DOM focus and selection distinct.
6. Supply an accessible name from visible text when possible. Keep name, description and state distinct.
7. Keep required roles, properties and states synchronised with the rendered and interactive state.
8. Test opening, closing, selection, disabled states and focus recovery where the component supports them.
9. Verify the accessible tree and actual keyboard operation with the target browsers and assistive technologies.
10. Record support gaps and deviations from the selected pattern, with reproducible steps and current evidence.

## Preserve the boundary
- Do not overwrite native semantics with conflicting roles or use ARIA to hide a functional keyboard defect.
- An attractive static screenshot does not prove an operable widget.
- Respect the task authority; do not deploy a component merely because its code review passed.

## Check and finish
- Recheck keyboard, names and states after a change. Report unsupported combinations and untested states.
- Distinguish an APG-pattern review from normative ARIA validation and whole-page WCAG conformance.
- Return the component change or scoped findings, with the exact pattern and tested environment.

## Worked distinction
A div with role="button" still needs appropriate focusability and keyboard handling.
A native button is preferable when it provides the intended action and semantics.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
