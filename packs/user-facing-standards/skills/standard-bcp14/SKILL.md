---
name: standard-bcp14
description: "Write or review normative requirements using BCP 14."
---
# BCP 14: normative requirement words
## Use
- Apply this procedure when a document adopts BCP 14 for requirements, permissions or prohibitions. Return testable wording. Preserve the original obligation and exceptions.
- Read the complete requirement and scope first. Words in ordinary conversation and quoted material do not acquire BCP 14 meanings merely by appearing there.
## Source and scope
- Consult RFC 2119 and its RFC 8174 update in references/rfc2119.txt and references/rfc8174.txt.
- RFC 8174 assigns special keyword meanings only to uppercase words. Lowercase words retain ordinary meanings.
- Text without these keywords can still be normative. Do not treat an uncapitalised obligation as optional.
## Procedure
1. Extract the actor, condition, required action, object and exception from the source contract.
2. Express absolute obligations with MUST or REQUIRED. Express absolute prohibitions with MUST NOT.
3. Express defaults with SHOULD or RECOMMENDED. These defaults permit justified exceptions after their consequences are understood.
4. Express discouraged actions with SHOULD NOT or NOT RECOMMENDED. Apply the same reasoned-exception discipline.
5. Express permitted choices with MAY or OPTIONAL. Keep permission distinct from technical ability and probability.
6. For optional implementation features, retain interoperability with implementations that include or omit the feature.
7. State the adopted keyword convention in the document. Use it sparingly for genuine interoperability or harm constraints.
8. Identify the actor and condition. Then give the action and an observable result. If the source leaves a consequential choice unresolved, flag it. Do not guess.
## Keep the task contract
- Style edits do not authorise changes from SHOULD to MUST or MUST to SHOULD. They do not authorise exception removal.
- Permission to edit a requirement does not grant permission to execute it.
- Do not allow controlled-language checkers to replace fixed normative terms mechanically.
## Verify and deliver
- Compare the original and revised sets of obligations, prohibitions, permissions and exceptions in both directions.
- Check a normal case and an exception case. Explicitly report conflicts and missing authority.
- Return requirement text first. Alternatively, return scoped findings that identify the affected clause and proposed repair.
## Worked distinction
Source: "The client SHOULD retry once; it MUST NOT retry after cancellation."
Split the wording for clarity without changing either keyword or the one-retry limit. The retry remains a recommendation, not an obligation.
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
