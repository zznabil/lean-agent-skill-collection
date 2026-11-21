# Edit instructions without losing the contract

Use this procedure to draft or edit skills, agent policies, workflows, prompts, checklists, handoffs or user procedures. The reader can be a person or executing agent. It does not require three communication skills to load for every task.

## Before changing the words

Identify reader, task, input, expected result and authority from the request and existing material. Inspect current instructions and callers. Keep unresolved requirements explicit; do not invent defaults to fill gaps.

Preserve each rule's trigger, actor, action, object, scope, requirement strength, exception, order, failure response and completion evidence. Keep links, resource paths, source references and adoption decisions. Keep watched, deferred and rejected sources in their existing states. Retain exact identifiers, commands, schemas, numbers, quoted source text and status names unless authorised to change them.

## Rewrite a decision, not an aspiration

For a rule with a consequential choice, use this shape:

```text
When <observable condition>, <actor> MUST/SHOULD/MAY <action on a named object>.
Verify <observable result>.
If <failure or unknown result>, <permitted recovery or stop>.
Exception: <existing authorised exception>.
```

Use only the fields that the rule needs. Do not invent thresholds, permissions, or failure modes to fill the template. Use ordinary verbs in ordinary prose. Use BCP 14 wording for normative requirements. Preserve the original strength. A MUST is not a SHOULD. An exception is not a default. Untested is not passed.

When a reference changes the action, name what words such as "it", "appropriate", "relevant" or "complete" refer to. Resolve the reference from the source or surrounding workflow. If the source does not resolve it, flag the missing decision. Do not replace it with plausible advice.

## Make the instructions usable

Place prerequisites and warnings before the action they constrain. Give each step one main action or tightly coupled group. Place the expected result and recovery next to that step. Split dense explanations into coherent blocks. Preserve their conditions and execution order. Keep the essential path visible. Do not let conditional detail hide a mandatory step.

Use one term per concept within a scope. For a difficult decision, give a small worked example. Explain why it meets the rule. The example illustrates the rule; it does not replace other cases. For an agent reader, use an execution example or counterexample. Do not require a lesson or quiz for the human user.

Remove repeated explanation only if the same reader still receives the full rule in the same task context. Matching text in two standalone skills can protect separate contexts. Do not treat those copies as redundant on wording alone. Before removing a local fallback or reference because another skill or root policy contains it, verify that the relevant host loads that source.

## Check the rewrite

Compare source and revision in both directions. Check that each original obligation still has an owner and applicable entry point. Check that each new obligation has explicit authority. Check the normal path, the failure or unknown-result path, and a nearby case where the rule must not activate. Verify links, commands, and structured examples. Check copied standalone references for drift.

For consequential changes, obtain the independent review and intended-reader task evidence that the existing contract requires. For agent instructions, record the loaded files and the agent's actual actions. A source-preservation test proves a textual property. It does not prove comprehension, model obedience, host activation, or formal standards conformance.

## Worked distinction

**Vague:** "Check everything and finish."

**Operational:** "Before declaring completion, run the required checks on the current revision, including standing Definition of Done checks when present. A failed or unrun required check prevents completion unless an authorised scope change removes it. Report the result and any next permitted action."

**Why:** The second version names the requirement sources, timing, observable evidence, and exception. It does not require every repository test for every task.

**Near miss:** A documentation-only change does not justify a production mutation. Verification still follows the actual task contract and existing permissions.

## Source roles

Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve language, voice, exact tokens and formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful. Lead with the answer or action, decisive evidence and material limits. Number ordered actions, retain required items and restore relevant state after interruption. Omit routine recaps; TL;DR first only if useful. Never invent estimates or diagnose readers.

Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Before risky or failure-prone actions, place warnings first. Add hold points and safe-state checks where needed. State expected results, failure signs, and recovery for those actions. Explain difficult mechanisms simply. Use noncompliant/compliant pattern contrasts when useful. These are condition-triggered execution rules, not additional default prose drivers.

Keep domain-specific sources when the task requires their domain. Do not use them as default prose drivers. Do not claim formal conformance from stylistic use.
