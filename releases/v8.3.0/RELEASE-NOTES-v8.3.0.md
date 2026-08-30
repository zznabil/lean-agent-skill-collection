# Lean Agent Skill Collection V8.3.0 — Usable Instructions & Cognitive Accessibility

V8.3.0 keeps 23 canonical skills and adds no routed skill.

## Highlights

- Adds one conditional `writing/USER-INFORMATION.md` reference for substantial instructions, manuals, onboarding, embedded help, forms, warnings, UI text, errors, and recovery guidance.
- Makes the user, task, context, purpose, prerequisites, expected result, recovery, consequences, orientation, and terminology explicit when they change success.
- Adds current ISO/IEC 23859:2023, ISO 21801-1:2020, ISO 9241-112:2025, ISO 9241-171:2025, ISO/IEC 29138-1/-4, ISO 704:2022, IEC/IEEE 82079-1:2019, and ISO/IEC/IEEE 26514/26513 as scoped sources.
- Improves `teach` with CAST UDL 3.0, the IES practice guide, cognitive-load reduction, worked examples, self-explanation, transfer, and conditional retrieval.
- Treats Easy-to-Read as a specialized intended-user-reviewed mode.
- Treats CDC CCI, PEMAT, and readability formulas as diagnostics rather than proof.

## Compatibility

- Same 23 skills and six profiles as V8.2.0.
- No dependency, service, hook, executable, provider requirement, or automatic trusted-state mutation.
- `writing` gains one local support file, which is packaged with every profile that contains `writing`.

## Validation boundary

The release includes 48 static scenarios and an 18-pass source audit. Live host routing, comprehension, task success, accessibility conformance, and human satisfaction remain unmeasured.
