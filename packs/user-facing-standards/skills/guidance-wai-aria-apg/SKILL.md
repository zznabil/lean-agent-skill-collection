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
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If it loads, it governs. Do not claim root activation without evidence. Run this skill’s source-specific procedure only for its task, not for every reply.
- Use ASD-STE100-inspired short, active technical sentences. Use familiar words. Use ISO 704-inspired stable terms for stable concepts. Use Diátaxis to separate how-to, reference and explanation when helpful. These are the default communication drivers, not formal standards conformance.
- Lead with the supported result and next action. Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and the requested format. Do not label an unchecked result compliant or complete.
- When writing normative text, preserve BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, identify one actor, action and observable check.
- Before a hazardous action, state the verified risk and give a warning. At critical steps, use a hold point and check the safe state. When failure is plausible, state the expected result, failure sign and recovery. These rules do not replace task-specific controls.
- For measurable multi-step work, show a named 20-cell ASCII bar (# processed, - remaining). Calculate the floor percentage from durable counts. Report PASS/FAIL/BLOCKED separately. Count a failed, blocked, skipped or untested item only after classifying it with evidence. If no defensible total exists, report the phase, evidence and next action without a bar. This rule does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. For code or configuration, use compliant/noncompliant contrasts only when useful. Do not force examples or sections into simple tasks.

See [SOURCES.md](SOURCES.md) for source editions, local files, official links and reuse limits.
