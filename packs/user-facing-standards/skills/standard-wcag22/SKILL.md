---
name: standard-wcag22
description: "Audit web accessibility against selected WCAG 2.2 criteria."
---
# WCAG 2.2: scoped accessibility verification

## Use
- Use to assess a named web page, flow or change against selected WCAG 2.2 criteria. Deliver criterion-level findings with observed evidence and untested scope.
- Define pages, complete processes, target level, supported technologies and testing tools first. A partial review is not a full conformance assessment.

## Source and scope
- The unchanged official Recommendation is references/wcag22-official.html.txt; it contains HTML, not plain prose.
- Read each selected success criterion, definitions, level and exceptions before assigning a result.
- For a full claim, assess every applicable criterion at the claimed level and the conformance requirements.

## Procedure
1. Trace the rendered task through loading, input, error, success and recovery states; include changes after
  interaction.
2. Check meaningful alternatives for non-text content, structural relationships and the intended reading sequence.
3. Test applicable text and non-text contrast, zoom, reflow and text spacing with the actual rendered content.
4. Operate the complete process with a keyboard. Check focus order, visible focus, traps and author-created
  obstruction.
5. Inspect accessible names, roles, values and states, including changes announced to assistive technology.
6. Check labels, input instructions, error identification, permitted correction and applicable error-prevention
  safeguards.
7. For WCAG 2.2 additions, inspect dragging alternatives, target size/spacing, consistent help and redundant entry.
8. Inspect accessible authentication under criterion 3.3.8 and, when AAA is in scope, 3.3.9; apply their exact
  exceptions.
9. Pair automated detection with manual interaction and applicable assistive-technology checks.
10. For each finding, record criterion ID and level, tested state, reproduction steps, expected result and observed result. Mark other states NOT TESTED.

## Keep the task contract
- Do not apply numeric thresholds without their criterion definitions and exceptions.
- Do not infer usability or complete conformance from a scanner score, a screenshot or the presence of ARIA
  attributes.
- User research and COGA can expose additional barriers; they do not silently alter the normative WCAG test.
- No production mutation, credential handling or user test is authorised merely by this review skill.

## Verify and deliver
- For a conformance claim, check full pages, complete processes, accessibility-supported use and non-interference.
- Keep PASS, FAIL, NOT APPLICABLE and NOT TESTED distinct; state the assessment boundary and evidence gaps.
- Recheck changed states after a repair. Report reproducible failures first, then unchecked criteria.

## Worked distinction
A modal looks correct but traps keyboard focus after its close button disappears.
Test the live modal states and recovery. A static source check cannot establish keyboard completion.

## Lean communication kernel (standalone fallback)
If root `AGENTS.md` is loaded, it governs. Otherwise apply these rules to communication. This skill’s source-specific procedure runs only for its task, not every reply.
- Lead with the supported result and next action. Use short, active ASD-STE100-inspired technical wording and CDC-style familiar words. Keep how-to, reference and explanation apart when Diátaxis separation helps.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Never call an unchecked result compliant or complete.
- In normative text, keep BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check (NASA).
- Before a hazardous action, show the verified risk and an ANSI-style warning. For critical steps, use a WHO-style hold point and OSHA-style safe-state check; give the FDA-style expected result, failure sign and recovery when failure is plausible. These analogies do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining) and floor percentage from durable counts; keep the PASS/FAIL/BLOCKED verdict separate. A failed, blocked, skipped or untested item counts only when classified with evidence. With no defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain a difficult mechanism from foundations (Feynman). Use SEI CERT-style compliant/noncompliant contrast for code or configuration only when useful. Do not force examples or sections on simple tasks.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
