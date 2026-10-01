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
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If root `AGENTS.md` is loaded, it governs. Do not claim root activation without evidence. Run this skill’s source-specific procedure only for its task, not for every reply.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. These are prose guides, not a claim of formal standards conformance.
- Lead with the supported result and next action. Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and the requested format. Never label an unchecked result compliant or complete.
- In normative text, preserve BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check.
- Before a hazardous action, show the verified risk and a warning. For critical steps, use a hold point and check the safe state. When failure is plausible, give the expected result, failure sign and recovery. These execution rules do not replace task-specific controls.
- For measurable multi-step work, show a named 20-cell ASCII bar (# processed, - remaining) and a floor percentage from durable counts. Keep the PASS/FAIL/BLOCKED verdict separate. Count a failed, blocked, skipped or untested item only after classification with evidence. Without a defensible total, report the phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. Contrast compliant and noncompliant code or configuration only when useful. Do not force examples or sections on simple tasks.
Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
