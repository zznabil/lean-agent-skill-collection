---
name: practice-implementation-example-traceability
description: "Separate required tasks from implementation examples."
---
# Implementation-example traceability

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine when a framework distinguishes practices and tasks from non-exclusive implementation examples. Separate required outcomes from possible implementations. A notional example is not a universal MUST. This is neither complete SSDF adoption nor a NIST conformity assessment.

## Traceability record
Record `PRACTICE`, `TASK`, `REQUIRED OUTCOME`, `NOTIONAL EXAMPLE`, `CHOSEN IMPLEMENTATION`, `WHY IT FITS`, `EVIDENCE`, `REFERENCES` and `VERSION / STATUS`.

## Steps
1. Identify the governing practice, selected task, source status and version. Distinguish final publications from drafts.
2. Extract the required outcome. Label source examples as notional unless the source explicitly requires them.
3. Choose an implementation that suits the system, risk and existing process. Retain alternatives that also meet the outcome.
4. Explain how the choice meets the outcome. Define evidence that verifies the implementation in operation.
5. Re-evaluate the mapping when the framework or system changes. Keep the prior version and evidence traceable.

## Worked distinction
**Framework task:** Protect source code from unauthorised change.

**Notional example:** Require protected branches and review.

**Chosen implementation:** A signed change pipeline with mandatory review and a different protected integration mechanism.

The implementation can satisfy the task if evidence supports the required outcome. The example alone does not restrict permitted designs.

## Verify and recover
Trace every MUST to its task or local authority, not merely an example. Hold adoption claims if source status or required outcome is unresolved. Record the missing decision. Return the practice-to-evidence map and justified alternatives.

For source details and access limits, see [SOURCES.md](SOURCES.md).
