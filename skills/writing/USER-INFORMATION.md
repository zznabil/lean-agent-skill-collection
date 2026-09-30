# Human-usable information

Use this reference for substantial instructions, manuals, onboarding, embedded help, forms, warnings, UI text, errors, recovery guidance, or other information that users must act on. The communication kernel below remains the default. Apply the sources below to this scoped task, not to ordinary prose. This conditional detail does not justify expanding a simple reply.

## Communication kernel

Use ASD-STE100-inspired short active technical sentences. Use ISO 704-inspired stable terms for distinct concepts. Use Diátaxis to separate actions, reference facts, and explanations when useful. If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. These influences do not establish formal standards conformance.

## Source roles

- **IEC/IEEE 82079-1:2019:** Addresses general information-for-use quality, process, and empirical evaluation. Edition 3 is under development.
- **ISO/IEC/IEEE 26514:2022:** Addresses software-specific user-information needs, structure, content, format, delivery, and maintenance.
- **ISO/IEC/IEEE 26513:2017:** Addresses testing and review of information for users. Edition 2 is at final-draft stage. Re-review it when published.
- **ISO/IEC 23859:2023:** Addresses readable and understandable written UI text, including its creation, adaptation, and evaluation.
- **ISO 21801-1:2020:** Addresses cognitive accessibility across systems.
- **ISO 9241-112:2025** and **ISO 9241-171:2025:** Address information presentation and accessible software.
- **ISO/IEC 29138-1:2018** and **ISO/IEC 29138-4:2026:** Address user accessibility needs and their application to requirements and evaluation.
- **ISO 704:2022:** Addresses concepts, terms, designations, and definitions.
- **ASD-STE100 Issue 9**, **ISO 24495-1**, and **W3C COGA:** Address technical clarity, plain-language usability, and cognitive readability.

These summaries describe independent source influences. Consult the authoritative source for regulated work or a conformance claim.

## Precedence

Resolve conflicting rules in this order:

```text
factual and safety-critical meaning
→ actual user accessibility need and task success
→ plain, concrete wording
→ structure, orientation, and recovery
→ stable terminology
→ tone and stylistic preference
```

Do not remove a warning, condition, exception, or technical distinction to simplify text if that removal changes action or risk.

## Design contract

1. **Name the user and task.** Record prior knowledge, context of use, device or medium, constraints, and risk. Record the decision or action that the information must support.
2. **Trace accessibility needs.** For material barriers, use:
   `user accessibility need → barrier → requirement → evidence`.
   Do not use one diagnosis as a universal user profile.
3. **Layer the information.**
   - **Essential:** Include purpose, critical action, safety, and recovery.
   - **Guided:** Include examples, explanations, alternate representations, and troubleshooting.
   - **Expert:** Include edge cases, internals, complete reference, and advanced controls.
   Do not conceal required steps in optional detail.
4. **Keep the task visible.** When the medium permits, users should know their location in the task, completed work, current work, remaining work, and important choices already made.
5. **Reduce hidden memory.** Repeat or display information needed for the current decision. Do not require users to recall a value, condition, or instruction from an earlier screen when you can show it safely.
6. **Use stable terms.** Use one preferred term for each concept within a scope. Define unavoidable technical terms near first use. Keep established domain language unless it is inaccurate or exclusionary.

## Procedure template

Include only useful fields:

```text
Outcome
Before you start
Progress or current state
Action
Expected result
If it did not work
Next
```

Each step should give one main action or one tightly coupled action group. Place warnings, prerequisites, costs, irreversible effects, and data-loss risks before the commitment point.

## Error and recovery template

```text
What happened
What the user can do next
What happened to their work or data
Where to get more detail
```

If the system knows the affected object, safe next action, or data state, do not substitute a generic failure message. Do not blame the user.

## Cognitive-accessibility checks

For critical information, check these questions:

- Can the user find the purpose and primary next action?
- Can the user access prerequisites before needing them?
- Are labels, controls, and terms concrete, familiar, and consistent?
- Does each step show one main action?
- Can the user resume after distraction, interruption, error, or navigation away?
- Can the user see important state instead of having to remember it?
- Does the result confirm changes and remaining work?
- Does the information state recovery and data preservation explicitly?
- Can the user see costs, risks, and irreversible consequences before commitment?
- Do hierarchy, spacing, and grouping show the structure?
- Can the user access alternate or adapted representations when the user need requires them?

## Easy-to-Read mode

Apply Inclusion Europe Easy-to-Read only when the user requests it or the intended audience and task justify it. It does not mean “shorter” or “plain English.”

- Provide a dedicated representation. Do not silently flatten the general version.
- Involve people from the intended audience in drafting or review.
- Do not use the European Easy-to-Read logo or claim that the material meets the rules without the required intended-user proofreading and attribution.
- Keep fuller information accessible when users need it.

## Evaluation

Test the real task with the intended audience for the strongest evidence. Separate these measures:

```text
Find        → time to the needed information
Understand  → correct paraphrase or teach-back
Act         → task completion and first-attempt success
Recover     → successful resume after interruption or error
Avoid harm  → wording-attributable errors and missed warnings
Need rescue → hints, help requests, and escalation
Include     → outcome gaps between target and general users
```

Use independent review for consequential information. For this user-information evaluation task, the CDC Clear Communication Index can diagnose main-message, action, language, number, design, and risk issues. PEMAT-style review can distinguish understandability from actionability. Do not apply their domain-specific score thresholds as universal software release gates.

A readability formula measures surface text features only. It does not prove findability, comprehension, actionability, recovery, accessibility, or task success.
