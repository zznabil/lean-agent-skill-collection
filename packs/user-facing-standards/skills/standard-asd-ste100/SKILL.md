---
name: standard-asd-ste100
description: "Write, edit or review technical English with ASD-STE100."
---
# ASD-STE100: technical-English pass

## Task and boundary
- Use when the user requests STE or the current task selects this standard for a technical passage.
- Apply to human instructions, agent instructions and technical descriptions, not automatically to every reply.
- Choose draft, edit or review from the request. Read the complete target and its governing requirements first.
- Edit language only. Do not execute the procedure being edited or change its required behaviour.
- Do not restyle code, identifiers, commands, exact quotations or a deliberately requested creative voice.

## Source and limits
- Use [ASD-STE100 Issue 9][standard], Part 1 for rules and Part 2 for the dictionary.
- If the linked copy is unavailable, use [official access] or request an authorised copy.
- Use the project's terminology source for technical nouns and technical verbs permitted by Section 1.
- This file is a working procedure, not the full standard, its dictionary or a conformance certificate.
- Before a full STE assessment, obtain the applicable rules, dictionary and project terminology.
- If these are unavailable, make only supported edits and state what remains unchecked. Never invent dictionary approval.

## Preserve meaning first: Lean safeguards
- Retain facts, conditions, negation, actors, quantities, units, exceptions, order, concurrency, warnings and recovery actions.
- Keep required checks, source links, resource paths, authority boundaries and the evidence needed for completion.
- Do not turn uncertainty into certainty, advice into obligation, or permission into capability.
- Do not mechanically replace MAY with CAN or SHOULD with MUST in a requirements contract.
- Retain fixed normative terms when necessary. Report a language conflict rather than silently weakening or strengthening the requirement.
- Resolve an unclear reference from the source. If the source cannot resolve it, flag the missing decision.
- Remove repetition only when every required rule still reaches its reader at the required step.

## Vocabulary and names: Section 1
- For each word, check its approved meaning, part of speech and permitted forms in the dictionary.
- Use a term outside that dictionary only under the applicable technical-noun or technical-verb rules.
- A familiar word or a linter pass does not prove that a technical term qualifies.
- Use established project terms consistently. Do not replace distinct operations with one word merely because they look similar.
- Choose short, clear terms for new concepts. Do not use slang or regional expressions as technical terms.
- Check separate noun and verb permissions. Approval for one function does not automatically approve the other.
- Use US spelling unless the governing publication directive specifies another variety, as permitted by Rule 1.14.
- Keep specified British spelling and exact quoted spelling when those directives apply.

## Noun groups: Section 2
- Limit a multi-word noun to three words. Do not shorten an exact identifier to meet this limit.
- For a longer technical name, give the full name first. Then define a shorter form or clarify with valid hyphens.
- Do not invent hyphens merely to disguise an unclear noun group or manipulate a word count.

## Verbs: Section 3
- Use dictionary-approved forms: imperative, infinitive, simple present, simple past, simple future or adjectival past participle.
- Replace perfect, progressive and other complex verb constructions without changing time, certainty or responsibility.
- Use active voice in procedures. In descriptions, retain passive voice only when the actor is unknown.
- Do not invent an actor to remove passive voice. An adjectival past participle is not automatically passive.
- Use an approved verb for an action instead of an unnecessary noun construction.
- Use a verb's -ing form only in a permitted technical noun or its modifier. Check dictionary exceptions separately.

## Sentences and procedures: Sections 4 and 5
- Keep grammar complete. Expand contractions, retain necessary articles and name ambiguous referents.
- Keep a necessary condition before its command and separate the condition from the command with a comma.
- Use imperative instructions. Show ordered work as ordered steps.
- Give one instruction per sentence unless the actions must occur together. Do not turn concurrent actions into sequential steps.
- Use at most 20 words per procedural or safety sentence. Information-only notes can use 25.
- Split long sentences without separating a condition, limit, exception or warning from the action it controls.
- Use vertical lists for complex information and explicit connectors for related statements.
- A NOTE gives information only. Put a required action in an instruction, not only inside a note.

## Descriptions and safety: Sections 6 and 7
- Introduce information in a logical sequence. Keep one topic per paragraph and at most six sentences per paragraph.
- Use at most 25 words per descriptive sentence. A sentence within the limit can still be unclear.
- Start safety text with the required risk label: WARNING for injury, CAUTION for damage.
- State the command or condition, then the hazard. Put this text before the affected action. Never invent hazards.
- Keep mandated warning text unchanged when exact wording is required. Report conflicts for the responsible author to resolve.

## Punctuation, counting and revision: Sections 8 and 9
- Do not use semicolons in the edited prose. This skill does not introduce an em-dash ban.
- Use parentheses and hyphens only where their meaning and the standard permit them.
- Apply Rules 8.4-8.7 for word counts, including lists, parentheses, numbers, units, names and hyphenated groups.
- Do not report a whitespace or line-based counter as an exact STE word count.
- Do not create unapproved phrasal verbs. Dictionary-approved phrases retain their specified meanings.
- If a replacement changes meaning or grammar, rewrite the sentence instead of replacing words one at a time.
- Keep terminology and style consistent across the target passage.

## Check and finish
- Compare source and revision in both directions: no lost requirement and no invented claim, condition or permission.
- Check the applicable rules above and look up any unresolved dictionary entry or rule exception.
- For a full STE assessment, check all 53 writing rules for applicability, not only this condensed procedure.
- Check normal, failure and exception paths for a procedure. Check links and preserve literal text.
- A linter is an aid. Inspect its findings in context and do not delete meaning to improve its score.
- Make one correction pass, then recheck. If issues remain, list them for review instead of looping.
- Draft/edit: return the text first, then only material exceptions and the actual verification scope.
- Review: give the passage, rule, defect and proposed repair. Do not rewrite the whole document without permission.
- Do not label unverified text STE-compliant. Identify unchecked vocabulary, intentional exceptions and required human review.
- For safety-critical use, this language pass does not replace technical validation or qualified review.

## Preservation example
- Source: "The client SHOULD retry once. It MUST NOT retry after cancellation."
- Keep the recommendation, one-retry limit and prohibition. Do not replace SHOULD with MUST to satisfy a word checker.
- This example tests preserved meaning, not complete dictionary compliance.

[standard]: https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf
[official access]: https://www.asd-ste100.org/STE_downloads.html
Design input: [Chelebi's kit](https://www.chele.bi/videos/the-cure-for-ai-slop). Its adaptations are not STE rules.
