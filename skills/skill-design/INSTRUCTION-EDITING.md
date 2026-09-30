# Edit instructions without losing the contract

Use this reference to draft or edit a skill, agent policy, workflow, prompt, checklist, handoff, or user procedure. The reader can be a person or an executing agent. This reference is an authoring procedure. It does not require loading three communication skills for every task.

## Before changing the words

Identify the reader, task, input, expected result, and authority from the request and existing material. Inspect the current instructions and their callers. Mark unresolved requirements as unresolved. Do not silently invent a default to complete a paragraph.

Preserve each existing rule's trigger, actor, action, object, scope, requirement strength, exception, order, failure response, and completion evidence. Keep its links, resource paths, source references, and adoption decision. Keep watched, deferred, and rejected sources in their existing states. Keep exact identifiers, commands, schemas, numbers, quoted source text, and status names unless their change is authorised.

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

**Operational:** "Before declaring completion, read the task's acceptance ledger and standing Definition of Done. Execute their applicable checks on the current revision. A failed or unrun required check prevents completion unless an authorised scope change removes that requirement. Report the actual result and next permitted action."

**Why:** The second version names the requirement sources, timing, observable evidence, and exception. It does not require every repository test for every task.

**Near miss:** A documentation-only change does not justify a production mutation. Verification still follows the actual task contract and existing permissions.

## Source roles

Use only three default communication drivers: ASD-STE100-inspired short, active technical sentences; ISO 704-inspired stable concepts and terminology; and Diátaxis purpose separation when helpful. These are stylistic guides, not formal conformance claims.

Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Before risky or failure-prone actions, place warnings first. Add hold points and safe-state checks where needed. State expected results, failure signs, and recovery for those actions. Explain difficult mechanisms simply. Use noncompliant/compliant pattern contrasts when useful. These are condition-triggered execution rules, not additional default prose drivers.

Keep domain-specific sources when the task requires their domain. Do not use them as default prose drivers. Do not claim formal conformance from stylistic use.
