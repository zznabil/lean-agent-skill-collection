---
name: standard-asd-ste100
description: "Write, edit or review technical English with ASD-STE100."
---
# ASD-STE100: technical-English pass
## Use
- Apply this procedure to a requested STE pass or a technical passage explicitly selected for ASD-STE100. Return edited text or rule-linked findings. Do not issue a conformance certificate.
- Choose draft, edit or review. Read the complete target and governing requirements before edits. Apply this procedure to human or agent instructions only within the selected task.
- Edit language, not required procedural behaviour. Do not execute the procedure. Do not restyle code, identifiers, commands, exact quotations or a requested creative voice.
## Source and limits
- Consult [ASD-STE100 Issue 9][standard]. Use Part 1 for writing rules and Part 2 for the dictionary.
- If the linked copy is unavailable, use [official access] or request an authorised copy.
- Consult the project's terminology source for technical nouns and technical verbs that Section 1 permits.
- This file provides a working procedure. It does not provide the full standard, its dictionary or a conformance certificate.
- Obtain the applicable rules, dictionary and project terminology before a full STE assessment.
- If these sources are unavailable, make only supported edits. Identify unchecked items. Do not invent dictionary approval.
## Meaning safeguards
- Preserve facts, conditions, negation, actors, quantities, units, exceptions, order, concurrency, warnings and recovery actions.
- Retain required checks, source links, resource paths, authority boundaries and completion evidence.
- Do not change uncertainty to certainty, advice to obligation, or permission to capability.
- Do not mechanically replace MAY with CAN or SHOULD with MUST in a requirements contract.
- Keep fixed normative terms when necessary. Report language conflicts. Do not silently weaken or strengthen requirements.
- Resolve unclear references from the source. If the source cannot resolve a reference, flag the missing decision.
- Remove repetition only if every required rule still reaches its reader at the required step.
## Vocabulary and names: Section 1
- Check each word's approved meaning, part of speech and permitted forms in the dictionary.
- Use words outside the dictionary only under applicable technical-noun or technical-verb rules.
- Familiarity or a linter pass does not prove that a technical term qualifies.
- Use established project terms consistently. Do not merge distinct operations under one term because they appear similar.
- Select short, clear terms for new concepts. Exclude slang and regional expressions from technical terms.
- Check noun and verb permissions separately. Approval for one function does not approve the other.
- Use US spelling unless the governing publication directive specifies another variety, as Rule 1.14 permits. Retain specified British spelling and exact quoted spelling when those directives apply.
## Noun groups: Section 2
- Limit multi-word nouns to three words. Do not shorten exact identifiers to meet this limit.
- Give a longer technical name in full first. Then define a shorter form or clarify it with valid hyphens.
- Do not invent hyphens to hide unclear noun groups or manipulate word counts.
## Verbs: Section 3
- Use dictionary-approved forms: imperative, infinitive, simple present, simple past, simple future or adjectival past participle.
- Replace perfect, progressive and other complex verb constructions. Preserve time, certainty and responsibility.
- Use active voice for procedures. Retain passive voice in descriptions only if the actor is unknown.
- Do not invent actors to remove passive voice. An adjectival past participle does not necessarily indicate passive voice.
- Replace unnecessary noun constructions with approved action verbs.
- Use a verb's -ing form only in a permitted technical noun or its modifier. Check dictionary exceptions separately.
## Sentences and procedures: Sections 4 and 5
- Write complete sentences. Expand contractions and retain necessary articles. Resolve ambiguous references only if the source identifies them. Otherwise flag the missing referent.
- Put necessary conditions before commands. Separate each condition from its command with a comma.
- Give imperative instructions. Present ordered work in ordered steps.
- Give one instruction per sentence unless actions must occur together. Do not convert concurrent actions to sequential steps.
- Limit procedural and safety sentences to 20 words. Information-only notes can contain 25 words.
- Split long sentences. Keep each condition, limit, exception and warning with the action it controls.
- Present complex information in vertical lists. Connect related statements explicitly.
- Use a NOTE only for information. Put required actions in instructions, not only in notes.
## Descriptions and safety: Sections 6 and 7
- Present information in logical order. Limit each paragraph to one topic and six sentences.
- Limit descriptive sentences to 25 words. Check clarity even when a sentence meets this limit.
- Start safety text with the required risk label: WARNING for injury, CAUTION for damage.
- State the command or condition before the hazard. Place this text before the affected action. Do not invent hazards.
- Preserve mandated warning text when exact wording is required. Report conflicts to the responsible author for resolution.
## Punctuation, counting and revision: Sections 8 and 9
- Exclude semicolons from edited prose. This skill does not ban em dashes.
- Use parentheses and hyphens only where their meaning and the standard permit them.
- Count words under Rules 8.4-8.7. Include lists, parentheses, numbers, units, names and hyphenated groups as those rules require.
- Do not present whitespace or line-based counts as exact STE word counts.
- Do not create unapproved phrasal verbs. Keep the specified meanings of dictionary-approved phrases.
- If a replacement changes meaning or grammar, rewrite the sentence. Do not substitute words individually.
- Apply consistent terminology and style throughout the target passage.
## Verify and deliver
- Compare the source and revision in both directions. Check for lost requirements and invented claims, conditions or permissions.
- Check the applicable rules above. Look up unresolved dictionary entries and rule exceptions.
- For a full STE assessment, check all 53 writing rules for applicability. Do not check only this condensed procedure.
- For procedures, check normal, failure and exception paths. Check links and retain literal text.
- Use linters as aids. Inspect findings in context. Do not remove meaning to improve a score.
- Make one correction pass and recheck. If issues remain, list them for review. Do not loop.
- For draft/edit, return the text first. Follow it with only material exceptions and the actual verification scope.
- For review, give the passage, rule, defect and proposed repair. Do not rewrite the complete document without permission.
- Do not label unverified text STE-compliant. Identify unchecked vocabulary, intentional exceptions and required human review.
- For safety-critical use, this language pass does not replace technical validation or qualified review.
## Preservation example
- Source: "The client SHOULD retry once. It MUST NOT retry after cancellation."
- Preserve the recommendation, one-retry limit and prohibition. Do not substitute MUST for SHOULD to satisfy a word checker.
- This example checks meaning preservation. It does not establish complete dictionary compliance.
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If loaded, root `AGENTS.md` governs. Do not claim root activation without evidence. Run this skill's source-specific procedure only for its task, not for every reply.
- Use ASD-STE100-inspired short, active technical sentences. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Lead with the supported result and next action.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Do not call unchecked results compliant or complete.
- For normative text, retain BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, identify one actor, action and observable check.
- Before hazardous actions, state the verified risk and give a warning. At critical steps, use a hold point and safe-state check. When failure is plausible, give the expected result, failure sign and recovery. These rules do not replace task-specific controls.
- For measurable multi-step work, show a named 20-cell ASCII bar (# processed, - remaining). Derive the floor percentage from durable counts. Report PASS/FAIL/BLOCKED separately. Count failed, blocked, skipped or untested items only after classification with evidence. Without a defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. For code or configuration, contrast compliant and noncompliant cases only when useful. Do not force examples or sections on simple tasks.
[standard]: https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf
[official access]: https://www.asd-ste100.org/STE_downloads.html
Design input: [Chelebi's kit](https://www.chele.bi/videos/the-cure-for-ai-slop). These adaptations do not constitute STE rules.
