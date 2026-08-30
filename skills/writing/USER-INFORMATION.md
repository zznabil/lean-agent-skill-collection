# Human-usable information

Use this reference for substantial instructions, manuals, onboarding, embedded help, forms, warnings, UI text, errors, recovery guidance, or other information that users must act on. It is conditional detail, not a reason to expand a simple reply.

## Source roles

- **IEC/IEEE 82079-1:2019:** general information-for-use quality, process, and empirical evaluation. Edition 3 is under development.
- **ISO/IEC/IEEE 26514:2022:** software-specific user-information needs, structure, content, format, delivery, and maintenance.
- **ISO/IEC/IEEE 26513:2017:** testing and reviewing information for users. Edition 2 is at final-draft stage; re-review when published.
- **ISO/IEC 23859:2023:** written UI text that is easy to read and understand, including creation, adaptation, and evaluation.
- **ISO 21801-1:2020:** cognitive accessibility across systems.
- **ISO 9241-112:2025** and **ISO 9241-171:2025:** information presentation and accessible software.
- **ISO/IEC 29138-1:2018** and **ISO/IEC 29138-4:2026:** user accessibility needs and their application to requirements and evaluation.
- **ISO 704:2022:** concepts, terms, designations, and definitions.
- **ASD-STE100 Issue 9**, **ISO 24495-1**, and **W3C COGA:** technical clarity, plain-language usability, and cognitive readability.

These are independently summarized influences. Use the authoritative source for regulated work or a conformance claim.

## Precedence

When rules conflict, prefer:

```text
factual and safety-critical meaning
→ actual user accessibility need and task success
→ plain, concrete wording
→ structure, orientation, and recovery
→ stable terminology
→ tone and stylistic preference
```

Do not simplify away a warning, condition, exception, or technical distinction that changes action or risk.

## Design contract

1. **Name the user and task.** Record prior knowledge, context of use, device or medium, constraints, risk, and the decision or action the information must support.
2. **Trace accessibility needs.** For material barriers use:
   `user accessibility need → barrier → requirement → evidence`.
   Do not treat one diagnosis as a universal user profile.
3. **Layer the information.**
   - **Essential:** purpose, critical action, safety, and recovery.
   - **Guided:** examples, explanations, alternate representations, and troubleshooting.
   - **Expert:** edge cases, internals, complete reference, and advanced controls.
   Do not hide required steps behind optional detail.
4. **Keep the task visible.** Users should know where they are, what is complete, what is current, what remains, and which important choices were made when the medium permits it.
5. **Reduce hidden memory.** Repeat or expose information needed for the current decision. Do not force the user to remember a value, condition, or instruction from an earlier screen when it can be shown safely.
6. **Use stable terms.** One concept gets one preferred term within a scope. Define an unavoidable technical term near first use. Preserve established domain language unless it is inaccurate or exclusionary.

## Procedure template

Use only the fields that help:

```text
Outcome
Before you start
Progress or current state
Action
Expected result
If it did not work
Next
```

Each step should contain one main action or one tightly coupled action group. Put warnings, prerequisites, costs, irreversible effects, and data-loss risk before the commitment point.

## Error and recovery template

```text
What happened
What the user can do next
What happened to their work or data
Where to get more detail
```

Do not use a generic failure message when the system knows the affected object, safe next action, or data state. Do not blame the user.

## Cognitive-accessibility checks

For critical information, ask:

- Can the user identify the purpose and primary next action?
- Are prerequisites available before they are needed?
- Are labels, controls, and terms concrete, familiar, and consistent?
- Does each step expose one main action?
- Can the user resume after distraction, interruption, error, or navigation away?
- Is important state visible instead of hidden in memory?
- Does the result confirm what changed and what remains?
- Are recovery and data preservation explicit?
- Are costs, risks, and irreversible consequences visible before commitment?
- Does hierarchy, spacing, and grouping expose the structure?
- Are alternate or adapted representations available when the user need requires them?

## Easy-to-Read mode

Use Inclusion Europe Easy-to-Read only when the user requests it or the intended audience and task justify it. It is not a synonym for “shorter” or “plain English.”

- Use a dedicated representation rather than silently flattening the general version.
- Involve people from the intended audience in drafting or review.
- Do not use the European Easy-to-Read logo or claim the material meets the rules without the required intended-user proofreading and attribution.
- Preserve access to fuller information when users need it.

## Evaluation

The strongest test is the real task with the intended audience. Separate:

```text
Find        → time to the needed information
Understand  → correct paraphrase or teach-back
Act         → task completion and first-attempt success
Recover     → successful resume after interruption or error
Avoid harm  → wording-attributable errors and missed warnings
Need rescue → hints, help requests, and escalation
Include     → outcome gaps between target and general users
```

Use independent review for consequential information. The CDC Clear Communication Index can diagnose main-message, action, language, number, design, and risk issues. PEMAT-style review can separate understandability from actionability. Do not import their domain-specific score threshold as a universal software release gate.

A readability formula measures surface text features. It does not prove findability, comprehension, actionability, recovery, accessibility, or task success.
