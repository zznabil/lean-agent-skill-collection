---
name: standard-wcag22
description: "Audit web accessibility against selected WCAG 2.2 criteria."
---
# WCAG 2.2: scoped accessibility verification
## Use
- Use this skill to assess a named web page, flow or change against selected WCAG 2.2 criteria. Report criterion-level findings, observed evidence and untested scope.
- First define the pages, complete processes, target level, supported technologies and testing tools. A partial review is not a full conformance assessment.
## Source and scope
- references/wcag22-official.html.txt contains the unchanged official Recommendation in HTML, not plain prose.
- Before assigning a result, read each selected success criterion, its definitions, level and exceptions.
- For a full claim, assess every applicable criterion at the claimed level. Assess the conformance requirements too.
## Procedure
1. Trace the rendered task through loading, input, error, success and recovery states. Include changes after interaction.
2. Check meaningful alternatives for non-text content. Check structural relationships and the intended reading sequence.
3. Test applicable text and non-text contrast, zoom, reflow and text spacing against the actual rendered content.
4. Use a keyboard to operate the complete process. Check focus order, visible focus, traps and author-created obstruction.
5. Inspect accessible names, roles, values and states. Include changes announced to assistive technology.
6. Check labels, input instructions, error identification, permitted correction and applicable error-prevention safeguards.
7. For WCAG 2.2 additions, inspect dragging alternatives, target size/spacing, consistent help and redundant entry.
8. Inspect accessible authentication under criterion 3.3.8. Also inspect criterion 3.3.9 when AAA is in scope. Apply their exact exceptions.
9. Combine automated detection with manual interaction and applicable assistive-technology checks.
10. For each finding, record the criterion ID and level, tested state, reproduction steps, expected result and observed result. Mark other states NOT TESTED.
## Keep the task contract
- Apply numeric thresholds only with their criterion definitions and exceptions.
- Do not infer usability or complete conformance from a scanner score, a screenshot or ARIA attributes.
- User research and COGA can expose additional barriers. They do not silently change the normative WCAG test.
- This review skill alone does not authorise production mutation, credential handling or a user test.
## Verify and deliver
- For a conformance claim, check full pages, complete processes, accessibility-supported use and non-interference.
- Distinguish PASS, FAIL, NOT APPLICABLE and NOT TESTED. State the assessment boundary and evidence gaps.
- After a repair, recheck changed states. Report reproducible failures before unchecked criteria.
## Worked distinction
A modal appears correct, but it traps keyboard focus after its close button disappears.
Test the live modal states and recovery. A static source check cannot establish keyboard completion.
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
