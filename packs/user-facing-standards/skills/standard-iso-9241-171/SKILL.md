---
name: standard-iso-9241-171
description: "Review software accessibility across a complete user task."
---
# ISO 9241-171: accessible software use

## Use
- Use this routine to review software accessibility across a complete task on its actual platform. Do not limit the review to web colour or spelling. Deliver findings for each environment and list untested combinations.
- Draft, edit or review as requested. First read the target, users, task and authorised scope.

## Source and scope
- Target edition: ISO 9241-171:2025, Edition 2. See SOURCES.md for official access and source status.
- The author did not have the full licensed normative text when creating this prototype. This folder does not bundle that text.
- These steps apply Lean guidance to the published scope. They do not reproduce the standard’s clauses.
- For clause-level or conformance work, first obtain an authorised copy. Read the applicable clauses and exceptions. Without that copy, use only supported application guidance and mark standard-specific requirements unchecked.

## Procedure
1. Identify supported platforms, input methods, output modes, assistive technologies and user tasks.
2. Trace operation with relevant alternatives to the default input and output method.
3. Inspect programmatic access to controls, labels, focus, values and status through the platform accessibility interface.
4. Check that presentation, timing and interaction preferences remain usable and persistent where supported.
5. Verify that required information does not depend on a single inaccessible sensory cue.
6. Test focus movement, navigation, data entry, errors and recovery through the complete relevant process.
7. Check interoperability with the stated assistive technologies in the supported environment.
8. Record the outcome for each tested platform and assistive-technology combination. List untested combinations. Do not generalise from one success.
9. After repair, recheck the affected interaction. Preserve non-accessibility functional requirements.

## Keep the task contract
- Preserve facts, quantities, terms, permissions, prohibitions, conditions, exceptions, warnings and required links.
- Do not invent requirements, numerical thresholds, clause numbers, user needs or evidence to make a checklist appear complete.
- A review or language edit does not authorise execution, deployment, source acquisition fees or user-data collection.
- These human-oriented principles can inform agent instructions. They do not prove how an agent will interpret those instructions.

## Verify and deliver
- Check the actual task and a relevant failure or recovery path. Use intended-user evidence when available.
- Distinguish source-verified clause findings, Lean design suggestions and unchecked items.
- Return the artifact or scoped findings first. State material limits and the evidence needed to resolve them.
- Do not claim formal conformance from this short routine, a readability score or an unexecuted review plan.

## Worked distinction
A native application announces button names but never announces validation errors.
Test the complete input-and-recovery task, not only initial control discovery.

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
