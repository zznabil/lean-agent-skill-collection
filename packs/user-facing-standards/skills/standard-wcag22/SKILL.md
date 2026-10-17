---
name: standard-wcag22
description: "Audit web accessibility against selected WCAG 2.2 criteria."
---
# WCAG 2.2: scoped accessibility verification
## Use
- Assess a named web page, flow or change against selected WCAG 2.2 criteria. Report criterion-level findings, observed evidence and untested scope.
- First define pages, complete processes, target level, supported technologies and tools. A partial review is not a full conformance assessment.
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
10. Record each finding’s criterion ID, level, tested state, reproduction steps, expected result and observed result. Mark other states NOT TESTED.
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
Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
