---
name: guidance-rfc9413
description: "Maintain protocol clarity instead of hidden tolerance."
---
# RFC 9413 protocol robustness

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task scope and permissions
- Review a parser or protocol change when tolerance, ambiguity or interoperability affects maintenance.
- This guidance does not require universal rejection of extension fields.
- Limit work to the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and assessment limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb. Preserve this boundary unless an authorised decision explicitly changes it.

## Assessment procedure
1. Identify the actual protocol specification, extension points, implementations and interoperability evidence.
2. Separate permitted extensibility from undocumented acceptance of malformed or ambiguous input.
3. Identify tolerance that hides sender defects, produces divergent interpretations or obstructs future changes.
4. Prefer a specification or sender correction when it resolves the problem. Avoid accumulating invisible parser exceptions instead.
5. Use the actual protocol rules to define explicit handling of malformed, unknown and future-version input.
6. Keep required unknown-field tolerance when the protocol defines it. Generic strictness must not override the contract.
7. If compatibility requires a temporary exception, record its exact case, reason, owner and retirement condition.
8. Test independent implementations and relevant negative cases. Happy-path parsing alone does not prove interoperability.
9. Collect only necessary diagnostic evidence. Avoid logging sensitive input.
10. Report the long-term maintenance trade-off and unresolved ambiguity. RFC 9413 is IAB guidance, not an Internet Standards Track protocol.

## Verification and recovery
- **Worked check (illustrative, not executed):** A parser silently accepts two contradictory spellings of a field without a documented compatibility need.
- **Expected:** Identify the ambiguity and define explicit compatibility or rejection behaviour from the maintained contract.
- **If blocked:** If the protocol owner or normative unknown-field rule is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Completion and stopping rules
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
