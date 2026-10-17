---
name: writing
description: "Draft or edit instructions, UI text, errors, help, emails, documentation, reports, and other prose for clarity, accessibility, evidence, and task fit while preserving meaning and the requested voice."
---
# Writing

Choose **draft** or **edit**. Help the reader find, understand, and use the information.

For user-facing text, default to familiar language that does not assume technical knowledge. Respect requested expert detail and the reader's stated needs. Do not infer ability from a diagnosis or impose a universal reading age. Use respectful language for the intended audience.

## Communication kernel

Apply this kernel to the skill, companions, examples, generated text and surrounding reply. For agent instructions, the executing agent is the reader.
Trusted root `AGENTS.md` governs when loaded; otherwise use this standalone fallback. Never claim root activation without evidence.
1. **Language — ASD-STE100-inspired.** Use short, active sentences, direct verbs and concrete words. Keep one main idea or action per sentence when practical.
2. **Terminology — ISO 704-inspired.** Use one preferred term per concept. Distinguish related concepts and explain necessary unfamiliar terms near first use.
   Preserve exact labels, commands, identifiers and quotations; explain them alongside.
3. **Structure — Diátaxis.** Separate tutorial, how-to, reference and explanation when useful; do not force categories into short answers.
Lead with the answer or action. Use only necessary detail. Omit routine Summary headings and closing recaps.
Use TL;DR only when it helps a long response, and place it first. These influences do not establish formal conformance; other frameworks remain task-selected.

## Draft or edit

1. **Identify the need.** Establish the reader, task, result, evidence, medium and requested voice. Inspect supplied context before asking.
2. **Expose the point.** Lead with the supported answer or action when the requested form allows. Remove filler, praise, request restatement and repetition.
3. **Make meaning explicit.** Use familiar, literal words. Resolve unclear pronouns, abbreviations and assumptions. Name actors and actions; illustrate difficult ideas when helpful.
4. **Make action manageable.** Use short paragraphs, useful headings and lists. Number ordered steps; give each one main action or tightly coupled group.
   Put prerequisites, warnings, costs and irreversible effects before the action. Include needed expected results and safe recovery.
5. **Reduce memory demands.** Keep decision information nearby. Repeat necessary conditions rather than require recall.
   Keep essential steps visible; place optional explanation afterwards without omitting requested expert depth.
6. **Preserve the contract.** Retain facts, actors, negation, numbers, conditions, exceptions, permissions, requirement strength, uncertainty, evidence limits, quotations and exact machine-sensitive text.
   Preserve format and voice without weakening factual or safety-critical meaning. Do not expand scope.

## Check before delivery

- Verify material claims, names, dates, numbers, calculations, quotations, citations, and links.
- Compare the source and revision in both directions. Check what disappeared and what was added.
- Check that the reader can find the point and, where relevant, identify the next action, expected result, and recovery.
- Check consistent terms and exact labels. Do not turn an unknown outcome into a failure or success.
- Treat readability scores and Vale checks as clues, not proof of comprehension or accessibility.

Deliver the finished text. Flag only material unresolved claims, decisions, or verification limits. Do not add Summary or TL;DR to the drafted text unless requested.

## Supporting references

Read [USER-INFORMATION.md](USER-INFORMATION.md) for substantial manuals, onboarding, embedded help, forms, UI text, warnings, errors, or recovery guidance. Use its audience-specific design and evaluation checks. Easy-to-Read is a specialised adaptation that requires intended-reader involvement; do not claim verification or certification from this skill.

Read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md) for skills, agent policies, prompts, workflows, checklists, handoffs, or consequential procedures. Preserve requirement strength, source links, resources, exceptions, and completion evidence.
