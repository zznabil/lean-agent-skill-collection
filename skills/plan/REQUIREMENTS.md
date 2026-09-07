# Requirements and consequential gaps

When drafting or changing requirements, inspect existing requests, code, examples and stakeholder evidence. Distinguish a stated requirement from an inference and an optional preference.

Only when an unresolved choice would change implementation or acceptance, present the recommended default, its main trade-off, the blocked outcome and one consolidated question. Do safe preparation first. Do not invent a question when the requirement is already clear.

Check relevant failure, recovery, accessibility and security conditions without inventing speculative features. Resolve conflicting requirements explicitly. End when the implementation boundary and completion check are clear, not when every imaginable question has been asked.

## Requirements and risk

When requirements affect implementation or acceptance, retain source, trigger, observable outcome and acceptance evidence; use conditional wording to remove ambiguity. (ISO/IEC/IEEE 29148; EARS).

For EARS requirements, choose only the pattern that expresses the actual condition:

```text
The <system> shall <response>.                         [always required]
When <event>, the <system> shall <response>.            [event]
While <state>, the <system> shall <response>.           [state]
Where <feature exists>, the <system> shall <response>.  [optional feature]
If <unwanted condition>, then the <system> shall <response>.
```

Combine state and event only when both matter. Example: `When a session expires, the API shall reject the request without creating an order.` Attach accepted and rejected examples or another observable acceptance check. These are requirement patterns, not a demand to rewrite ordinary prose. (EARS; ISO/IEC/IEEE 29148).

For consequential uncertainty, identify failure, impact, likelihood and owner; select a proportionate assessment method and monitor the mitigation or acceptance decision. (ISO 31000; IEC 31010; ISO/IEC/IEEE 16085).

Do not fabricate probabilities or turn an unknown into a low-risk score.

Only when the project already uses BDD, express agreed observable scenarios in its Gherkin conventions; otherwise plain acceptance criteria suffice. (Gherkin / BDD (not a global requirement)).

When work enters a regulated or safety-critical domain, require the applicable authoritative licensed sources, qualified review and project-specific assurance; general Lean guidance is insufficient. (Safety-critical domain standards).
