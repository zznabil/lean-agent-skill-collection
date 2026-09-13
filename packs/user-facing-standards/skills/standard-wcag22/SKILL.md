---
name: standard-wcag22
description: "Audit web accessibility against selected WCAG 2.2 criteria."
---
# WCAG 2.2: scoped accessibility verification

## Use
- Use when a web page, application flow or its change needs a WCAG 2.2 accessibility assessment.
- Define the pages, complete processes, target level, supported technologies and available testing tools.
- A partial review is useful, but must not be presented as a full conformance assessment.

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
10. Record criterion ID, level, state, reproduction steps, expected result and observed evidence for every finding.

## Preserve the boundary
- Do not apply numeric thresholds without their criterion definitions and exceptions.
- Do not infer usability or complete conformance from a scanner score, a screenshot or the presence of ARIA
  attributes.
- User research and COGA can expose additional barriers; they do not silently alter the normative WCAG test.
- No production mutation, credential handling or user test is authorised merely by this review skill.

## Check and finish
- For a conformance claim, check full pages, complete processes, accessibility-supported use and non-interference.
- Keep PASS, FAIL, NOT APPLICABLE and NOT TESTED distinct; state the assessment boundary and evidence gaps.
- Recheck changed states after a repair. Report reproducible failures first, then unchecked criteria.

## Worked distinction
A modal looks correct but traps keyboard focus after its close button disappears.
Test the live modal states and recovery. A static source check cannot establish keyboard completion.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
