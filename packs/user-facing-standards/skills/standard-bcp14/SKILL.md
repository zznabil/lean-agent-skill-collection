---
name: standard-bcp14
description: "Write or review normative requirements using BCP 14."
---
# BCP 14: normative requirement words

## Use
- Use for requirements, permissions and prohibitions where the document adopts BCP 14.
- Do not apply its uppercase convention to ordinary conversation or quoted material that does not adopt it.
- Read the complete requirement, its scope and its existing exceptions before drafting or reviewing.

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
8. Make the requirement testable from its named condition and observable result; identify an unresolved choice
  rather than guessing.

## Preserve the boundary
- A style edit does not authorise upgrading SHOULD to MUST, downgrading MUST to SHOULD or deleting an exception.
- Do not infer permission to execute a requirement from permission to edit its wording.
- Do not let a controlled-language checker replace these fixed normative terms mechanically.

## Check and finish
- Compare old and new obligation, prohibition, permission and exception sets in both directions.
- Review a normal case and an exception case. Report conflicts and missing authority explicitly.
- Return the requirement text first, or scoped findings with the affected clause and proposed repair.

## Worked distinction
Source: "The client SHOULD retry once; it MUST NOT retry after cancellation."
A clearer split keeps both keywords and the one-retry limit. It does not make the retry mandatory.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
