---
name: browser-automation
description: "Build or run authorized browser automation, real-user QA, data entry, or extraction with stable locators, explicit state, bounded retries, and evidence of the user-visible result."
---

# Browser Automation

For applicable interfaces, use **WCAG 2.2**, **WAI-ARIA Authoring Practices**, **ISO 9241-110/210**, current **ISO 9241-112:2025** information-presentation principles, and **ISO 9241-171:2025** software-accessibility guidance.

- Apply **ISO/IEC 23859:2023**, **ISO 21801-1:2020**, and **ISO/IEC 29138-1/-4** when UI text, cognition, or user accessibility needs can block the task.
- Prefer native semantics before custom ARIA.

1. **Authority and user journey.** Name the authorized site, account, environment, intended users, user-visible result, journeys, and allowed side effects before acting. For a material accessibility barrier, trace `user accessibility need → barrier → journey or requirement → evidence`.
2. **Session isolation.** Use an isolated profile or clean context by default. Use a real signed-in profile only when required and authorized; do not copy cookies, tokens, or unrelated session data.
3. **Runtime and readiness.** Establish the real runtime path. Start permitted local services, then inspect the rendered page, accessibility tree, or screenshot before choosing selectors. Wait for a meaningful ready condition, not a fixed sleep.
4. **Recovery and resumption.** Start critical journeys from known state. Test reload, reopen, stale state, session expiry, and interruption when persistence or recovery matters. In multistep flows, verify that a returning user can identify completed, current, and pending work and that important input is preserved.
5. **Locators and read-back.** Use semantic or stable locators. Keep actions small and verify navigation or mutation through visible state, DOM, accessibility tree, network, console, saved files, screenshots, or target-system read-back.
6. **Interaction and accessibility.** Exercise the few states most likely to fail across representative viewports or window sizes: loading, empty, error, disabled, focus, resize, invalid input, slow or failed network, cancellation, and recovery.
   - For interactive accessibility scope, verify keyboard operation, focus order, accessible name, role, state, and visible result.
   - For important UI text or errors, verify that the user can identify the purpose, next action, expected result, and whether work or data was preserved.
7. **Retry boundary.** Retry only known transient failures. Record intent before a consequential submission; after an uncertain result, inspect state before retrying.
8. **Rendered evidence.** Capture concise reproducible evidence without secrets. For reference-driven interface work, compare rendered output side by side or with an overlay and fix the largest meaningful mismatch first. Source inspection is not proof that a user journey works.
9. **Regression guard.** Convert durable manually observed behavior into the smallest regression test with semantic locators and an outcome assertion.
10. **Journey verdict.** Report `PASS`, `FAIL`, or `BLOCKED` per independent journey, with environment and evidence.

Do not bypass access controls, anti-abuse systems, CAPTCHA, or consent. Do not purchase, publish, send, delete, or mutate production without explicit authorization.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
