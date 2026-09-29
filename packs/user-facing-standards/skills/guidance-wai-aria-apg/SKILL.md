---
name: guidance-wai-aria-apg
description: "Apply WAI-ARIA patterns to a specific web interaction."
---
# WAI-ARIA APG: accessible interaction patterns

## Use
- Use for a specific web widget’s keyboard interaction and accessible semantics. Deliver a working component or scoped pattern findings.
- Identify the widget and platform first. Do not add ARIA merely because HTML is being edited.

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
9. In the target browser and assistive technology, verify the accessible tree and keyboard path. A role alone does not prove that the widget works.
10. Record support gaps and deviations from the selected pattern, with reproducible steps and current evidence.

## Keep the task contract
- Do not overwrite native semantics with conflicting roles or use ARIA to hide a functional keyboard defect.
- An attractive static screenshot does not prove an operable widget.
- Respect the task authority; do not deploy a component merely because its code review passed.

## Verify and deliver
- Recheck keyboard, names and states after a change. Report unsupported combinations and untested states.
- Distinguish an APG-pattern review from normative ARIA validation and whole-page WCAG conformance.
- Return the component change or scoped findings, with the exact pattern and tested environment.

## Worked distinction
A div with role="button" still needs appropriate focusability and keyboard handling.
A native button is preferable when it provides the intended action and semantics.

## Lean communication kernel (standalone fallback)
If root `AGENTS.md` is loaded, it governs. Otherwise apply these rules to communication. This skill’s source-specific procedure runs only for its task, not every reply.
- Lead with the supported result and next action. Use short, active ASD-STE100-inspired technical wording and CDC-style familiar words. Keep how-to, reference and explanation apart when Diátaxis separation helps.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Never call an unchecked result compliant or complete.
- In normative text, keep BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check (NASA).
- Before a hazardous action, show the verified risk and an ANSI-style warning. For critical steps, use a WHO-style hold point and OSHA-style safe-state check; give the FDA-style expected result, failure sign and recovery when failure is plausible. These analogies do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining) and floor percentage from durable counts; keep the PASS/FAIL/BLOCKED verdict separate. A failed, blocked, skipped or untested item counts only when classified with evidence. With no defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain a difficult mechanism from foundations (Feynman). Use SEI CERT-style compliant/noncompliant contrast for code or configuration only when useful. Do not force examples or sections on simple tasks.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
