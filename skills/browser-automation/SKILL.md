---
name: browser-automation
description: "Build or run authorized browser automation, real-user QA, data entry, or extraction with stable locators, explicit state, bounded retries, and evidence of the user-visible result."
---
# Browser Automation
For applicable interfaces, use **WCAG 2.2**, **WAI-ARIA Authoring Practices**, and **ISO 9241-110/210**. Use current **ISO 9241-112:2025** information-presentation principles and **ISO 9241-171:2025** software-accessibility guidance.
- Apply **ISO/IEC 23859:2023**, **ISO 21801-1:2020**, and **ISO/IEC 29138-1/-4** when UI text, cognition, or user accessibility needs can block the task.
- Prefer native semantics to custom ARIA.
## Composition
For a composed task, use one primary lifecycle owner: the explicit user-designated owner; otherwise selected `get-it-done`; otherwise the unique substantive task skill after assigning support roles. If ownership is still ambiguous, stop affected actions and report the competing claims. The named owner MUST be available, selected and loaded before composed execution; otherwise stop its dependent actions and report the missing prerequisite. Safe independent inspection may continue. Availability alone proves neither selection nor loading. Alone, this skill retains its normal ownership and status rules.
When supporting, execute only authorized browser journeys and return per-journey evidence and verdicts, not task completion. Quick Mode chooses the minimum useful validation within retained criteria. Source, compilation and uninteracted screenshots are not dogfooding. Automated UAT requires a known start, user-level actions, observable failure-sensitive assertions, replayable execution and cleanup/reset; a one-off interaction is not repeatable UAT. For automated UAT, pass a positive control and reject a representative broken state before claiming the verifier works.
Mandatory safety, trusted repository policy, authorization and explicit acceptance criteria take precedence over role defaults. A supporter MUST NOT claim task completion or change permissions. Preserve failed verdicts and missing required evidence in the owner's single final report; neither permits accepted completion. Presentation changes no facts, scope or verdicts.

1. **Authority and user journey.** Before acting, name the authorized site, account, environment, intended users, user-visible result, journeys, and allowed side effects. For a material accessibility barrier, trace `user accessibility need → barrier → journey or requirement → evidence`.
2. **Session isolation.** Use an isolated profile or clean context by default. Use a real signed-in profile only when required and authorized. Do not copy cookies, tokens, or unrelated session data.
3. **Runtime and readiness.** Establish the actual runtime path. Start permitted local services. Inspect the rendered page, accessibility tree, or screenshot before choosing selectors. Wait for a meaningful ready condition. Do not use a fixed sleep as the ready condition.
4. **Recovery and resumption.** Start critical journeys from a known state. When persistence or recovery matters, test reload, reopen, stale state, session expiry, and interruption. In multistep flows, verify that a returning user can identify completed, current, and pending work. Verify that the flow preserves important input.
5. **Locators and read-back.** Use semantic or stable locators. Keep actions small. Verify navigation or mutation through visible state, DOM, accessibility tree, network, console, saved files, screenshots, or target-system read-back.
6. **Interaction and accessibility.** Across representative viewports or window sizes, exercise the few states most likely to fail: loading, empty, error, disabled, focus, resize, invalid input, slow or failed network, cancellation, and recovery.
   - When the scope includes interactive accessibility, verify keyboard operation, focus order, accessible name, role, state, and visible result.
   - For important UI text or errors, verify that the user can identify the purpose, next action, expected result, and whether the system preserved work or data.
7. **Retry boundary.** Retry only known transient failures. Record intent before a consequential submission. If the result is uncertain, inspect state before retrying.
8. **Rendered evidence.** Capture concise, reproducible evidence without secrets. For reference-driven interface work, compare rendered output side by side or with an overlay. Fix the largest meaningful mismatch first. Source inspection does not prove that a user journey works.
9. **Regression guard.** Convert durable behavior observed manually into the smallest regression test. Use semantic locators and an outcome assertion.
10. **Journey verdict.** Report `PASS`, `FAIL`, or `BLOCKED` for each independent journey. Include the environment and evidence.
Do not bypass access controls, anti-abuse systems, CAPTCHA, or consent. Do not purchase, publish, send, delete, or mutate production without explicit authorization.
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
