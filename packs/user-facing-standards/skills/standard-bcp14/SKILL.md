---
name: standard-bcp14
description: "Write or review normative requirements using BCP 14."
---
# BCP 14: normative requirement words
## Use
- Use this procedure when a document adopts BCP 14. Return testable requirements, permissions and prohibitions with obligations and exceptions intact.
- Read the complete requirement and scope first. Ordinary conversation and quotations do not acquire BCP 14 meanings merely by containing these words.
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
8. Identify the actor and condition, then the action and observable result. Flag unresolved consequential choices. Do not guess.
## Keep the task contract
- Style edits do not authorise changes from SHOULD to MUST or MUST to SHOULD. They do not authorise exception removal.
- Permission to edit a requirement does not grant permission to execute it.
- Do not allow controlled-language checkers to replace fixed normative terms mechanically.
## Verify and deliver
- Compare the original and revised sets of obligations, prohibitions, permissions and exceptions in both directions.
- Check a normal case and an exception case. Explicitly report conflicts and missing authority.
- Return requirement text first, or scoped findings naming the affected clause and proposed repair.
## Worked distinction
Source: "The client SHOULD retry once; it MUST NOT retry after cancellation."
Split the wording for clarity without changing either keyword or the one-retry limit. The retry remains a recommendation, not an obligation.
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
Consult [SOURCES.md](SOURCES.md) for source editions, local files, official links and reuse limits.
