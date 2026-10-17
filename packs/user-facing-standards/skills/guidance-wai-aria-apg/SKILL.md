---
name: guidance-wai-aria-apg
description: "Apply WAI-ARIA patterns to a specific web interaction."
---
# WAI-ARIA APG: accessible interaction patterns

## Use
- Implement or review a specific web widget’s keyboard interaction and accessible semantics. Return a working component or findings within the defined pattern scope.
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
9. Verify the accessible tree and keyboard path in the target browser and assistive technology. Roles alone do not prove operation.
10. Record support gaps and departures from the selected pattern. Include reproducible steps and current evidence.

## Keep the task contract
- Do not replace native semantics with conflicting roles. Do not use ARIA to conceal a functional keyboard defect.
- Do not treat an attractive static screenshot as proof that a widget is operable.
- Follow the task authority. A passed code review alone does not authorise component deployment.

## Verify and deliver
- After changes, recheck keyboard behaviour, names and states. Report unsupported combinations and untested states.
- Distinguish an APG-pattern review, normative ARIA validation and whole-page WCAG conformance.
- Return the component change or findings for the defined scope. Identify the exact pattern and tested environment.

## Worked distinction
A div with role="button" still needs appropriate focusability and keyboard handling.
A native button is preferable when it provides the intended action and semantics.

## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this standalone fallback. Do not claim activation without evidence.
Apply this skill’s source-specific procedure only to its task.
- Use ASD-STE100-inspired short, active sentences and concrete words; retain domain terms.
- Use ISO 704-inspired stable concepts and terminology. Define unfamiliar terms when needed.
- Separate tutorial, how-to, reference and explanation with Diátaxis when helpful, not forced headings.
- Lead with the answer or action, not a required Summary. Use TL;DR only first when helpful for complex material, without a repeated conclusion.
- Keep simple answers short, not arbitrarily truncated. Match requested voice and format. Use British spelling except for sources, syntax or requested locale.
- Preserve facts, quantities, negation, actors, conditions, exceptions, rights, permissions, uncertainty and evidence. Never claim unchecked compliance or completion.
- Preserve normative BCP 14 MUST/SHOULD/MAY force and exceptions. Important requirements name one actor, action and observable check.
- Before hazards, warn with verified risks. At critical steps, hold and verify the safe state. Retain task-specific controls.
- When failure is plausible, give expected results, failure signs and recovery.
- For measurable multi-step work, show a named 20-cell ASCII bar (# processed, - remaining), with floor percentage from durable counts.
- Keep PASS/FAIL/BLOCKED separate. Classify failed, blocked, skipped or untested items with evidence before counting.
- Without a defensible total, report phase, evidence and next action. This does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. Use compliant/noncompliant code or configuration contrasts only when useful.
These inspirations do not establish formal standards conformance.

See [SOURCES.md](SOURCES.md) for source editions, local files, official links and reuse limits.
