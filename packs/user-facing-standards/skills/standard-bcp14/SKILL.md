---
name: standard-bcp14
description: "Write or review normative requirements using BCP 14."
---
# BCP 14: normative requirement words

## Use
- Use when a document adopts BCP 14 for requirements, permissions or prohibitions. Deliver testable wording that keeps the original obligation and exceptions.
- Read the full requirement and scope first. Ordinary conversation and quoted material do not acquire BCP 14 meanings merely because they contain these words.

## Source and scope
- Read RFC 2119 and its RFC 8174 update in references/rfc2119.txt and references/rfc8174.txt.
- RFC 8174 limits the special keyword meanings to uppercase use. Lowercase words keep their ordinary meanings.
- Other text can still be normative without these keywords. Do not infer that an uncapitalised obligation is
  optional.

## Procedure
1. Identify the actor, condition, required action, object and exception from the source contract.
2. Use MUST or REQUIRED for an absolute obligation. Use MUST NOT for an absolute prohibition.
3. Use SHOULD or RECOMMENDED for a default that permits justified exceptions after their consequences are
  understood.
4. Use SHOULD NOT or NOT RECOMMENDED for a discouraged action with the same reasoned-exception discipline.
5. Use MAY or OPTIONAL for a permitted choice. Distinguish that permission from technical ability or probability.
6. For optional implementation features, preserve interoperability with implementations that include or omit the
  feature.
7. Declare the adopted keyword convention in the document. Use it sparingly for genuine interoperability or harm
  constraints.
8. Name the actor and condition, then state the action and an observable result. If the source leaves a consequential choice unresolved, flag it instead of guessing.

## Keep the task contract
- A style edit does not authorise upgrading SHOULD to MUST, downgrading MUST to SHOULD or deleting an exception.
- Do not infer permission to execute a requirement from permission to edit its wording.
- Do not let a controlled-language checker replace these fixed normative terms mechanically.

## Verify and deliver
- Compare old and new obligation, prohibition, permission and exception sets in both directions.
- Review a normal case and an exception case. Report conflicts and missing authority explicitly.
- Return the requirement text first, or scoped findings with the affected clause and proposed repair.

## Worked distinction
Source: "The client SHOULD retry once; it MUST NOT retry after cancellation."
A clearer split keeps both keywords and the one-retry limit. It does not make the retry mandatory.

## Lean communication kernel (standalone fallback)
If root `AGENTS.md` is loaded, it governs. Otherwise apply these rules to communication. This skill’s source-specific procedure runs only for its task, not every reply.
- Lead with the supported result and next action. Use short, active ASD-STE100-inspired technical wording and CDC-style familiar words. Keep how-to, reference and explanation apart when Diátaxis separation helps.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Never call an unchecked result compliant or complete.
- In normative text, keep BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check (NASA).
- Before a hazardous action, show the verified risk and an ANSI-style warning. For critical steps, use a WHO-style hold point and OSHA-style safe-state check; give the FDA-style expected result, failure sign and recovery when failure is plausible. These analogies do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining) and floor percentage from durable counts; keep the PASS/FAIL/BLOCKED verdict separate. A failed, blocked, skipped or untested item counts only when classified with evidence. With no defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain a difficult mechanism from foundations (Feynman). Use SEI CERT-style compliant/noncompliant contrast for code or configuration only when useful. Do not force examples or sections on simple tasks.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
