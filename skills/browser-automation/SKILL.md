---
name: browser-automation
description: "Build or run authorized browser automation, real-user QA, data entry, or extraction with stable locators, explicit state, bounded retries, and evidence of the user-visible result."
---

# Browser Automation

For applicable interfaces, use **WCAG 2.2**, **WAI-ARIA Authoring Practices**, and **ISO 9241-110/210/112-inspired** human-centred interaction and information-presentation checks. Prefer native semantics before custom ARIA.

1. Confirm the authorized site, account, environment, user promise, journeys, and allowed side effects.
2. Use an isolated profile or clean context by default. Use a real signed-in profile only when required and authorized; do not copy cookies, tokens, or unrelated session data.
3. Establish the real runtime path. Start permitted local services, then inspect the rendered page, accessibility tree, or screenshot before choosing selectors. Wait for a meaningful ready condition, not a fixed sleep.
4. Start critical journeys from known state. Test reload, reopen, stale state, session expiry, and interruption when persistence or recovery matters.
5. Use semantic or stable locators. Keep actions small and verify navigation or mutation through visible state, DOM, accessibility tree, network, console, saved files, screenshots, or target-system read-back.
6. Exercise the few states most likely to fail across representative viewports or window sizes: loading, empty, error, disabled, focus, resize, invalid input, slow or failed network, cancellation, and recovery. For interactive accessibility scope, verify keyboard operation, focus order, accessible name, role, state, and visible result.
7. Retry only known transient failures. Record intent before a consequential submission; after an uncertain result, inspect state before retrying.
8. Capture concise reproducible evidence without secrets. For reference-driven interface work, compare rendered output side by side or with an overlay and fix the largest meaningful mismatch first. Source inspection is not proof that a user journey works.
9. Convert durable manually observed behavior into the smallest regression test with semantic locators and an outcome assertion.
10. Report `PASS`, `FAIL`, or `BLOCKED` per independent journey, with environment and evidence.

Do not bypass access controls, anti-abuse systems, CAPTCHA, or consent. Do not purchase, publish, send, delete, or mutate production without explicit authorization.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
