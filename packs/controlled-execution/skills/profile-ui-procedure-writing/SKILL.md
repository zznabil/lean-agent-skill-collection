---
name: profile-ui-procedure-writing
description: "Render concise, input-neutral UI procedures."
---
# UI procedure writing profile

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use to render an already-correct UI procedure. Preserve prerequisites, warnings, exact labels, conditions, results and recovery. Prefer input-neutral verbs such as `Select`, `Open` and `Enter` when accurate. Do not invent product behavior or accessibility conformance.

## Steps
1. Put prerequisites and material warnings before numbered actions, especially before a consequential commitment.
2. Start each step with an imperative. Name the interface location and exact visible control label when the user must navigate.
3. Include every required action. Combine actions only when they occur together naturally and cannot fail independently.
4. State the expected result after a consequential action. Put its failure sign and recovery beside the step.
5. Avoid mouse-only words when keyboard, touch or assistive technology can perform the same action.
6. Walk the rendered journey in order with the actual interface and supported input modes.

## Step form
`In LOCATION, ACTION. EXPECTED RESULT.` Use a separate sentence for `If FAILURE, RECOVERY.`

## Worked distinction
**Device-specific:** Click the Advanced button on the right.

**Input-neutral:** On the **Security** tab, select **Advanced**.

The second form names the location and control without assuming a mouse; rendered-interface verification remains necessary.

## Verify and recover
If a label, location or expected result is unverified, hold publication, inspect the interface and correct the step. Return the ready-to-use procedure and any unresolved product uncertainty; do not claim that an unwalked task finished.

Source details and access limits: [SOURCES.md](SOURCES.md).
