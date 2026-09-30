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
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If loaded, root `AGENTS.md` governs. Do not claim root activation without evidence. Run this skill's source-specific procedure only for its task, not for every reply.
- Use ASD-STE100-inspired short, active technical sentences. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Lead with the supported result and next action.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Do not call unchecked results compliant or complete.
- For normative text, retain BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, identify one actor, action and observable check.
- Before hazardous actions, state the verified risk and give a warning. At critical steps, use a hold point and safe-state check. When failure is plausible, give the expected result, failure sign and recovery. These rules do not replace task-specific controls.
- For measurable multi-step work, show a named 20-cell ASCII bar (# processed, - remaining). Derive the floor percentage from durable counts. Report PASS/FAIL/BLOCKED separately. Count failed, blocked, skipped or untested items only after classification with evidence. Without a defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. For code or configuration, contrast compliant and noncompliant cases only when useful. Do not force examples or sections on simple tasks.
Consult [SOURCES.md](SOURCES.md) for source editions, local files, official links and reuse limits.
