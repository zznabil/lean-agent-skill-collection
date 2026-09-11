# Edit instructions without losing the contract

Use this reference when drafting or editing a skill, agent policy, workflow, prompt, checklist, handoff, or user procedure. The reader may be a person or an executing agent. This is an authoring procedure, not a requirement to load three communication skills during every task.

## Before changing the words

Identify the reader, task, input, expected result and authority from the request and existing material. Inspect the current instructions and their callers. Record an unresolved requirement as unresolved; do not silently invent a default to make the paragraph look complete.

Preserve each existing rule's trigger, actor, action, object, scope, requirement strength, exception, order, failure response and completion evidence. Preserve its links, resource paths, source references and adoption decision. A watched, deferred or rejected source stays in that state. Keep exact identifiers, commands, schemas, numbers, quoted source text and status names unless their change is authorised.

## Rewrite a decision, not an aspiration

Use this shape when a rule contains a consequential choice:

```text
When <observable condition>, <actor> MUST/SHOULD/MAY <action on a named object>.
Verify <observable result>.
If <failure or unknown result>, <permitted recovery or stop>.
Exception: <existing authorised exception>.
```

Use only the fields the rule actually needs. Do not invent thresholds, permissions or failure modes to fill a template. In ordinary prose, use ordinary verbs; BCP 14 wording belongs to normative requirements. Preserve the original strength: a MUST is not a SHOULD, an exception is not a default, and untested is not passed.

Name what words such as "it", "appropriate", "relevant" or "complete" refer to when that choice changes the action. Resolve the reference from the source or surrounding workflow. If the source cannot resolve it, flag the missing decision rather than replacing it with plausible advice.

## Make the instructions usable

Put prerequisites and warnings before the action they constrain. Keep one main action or tightly coupled group per step. Put its expected result and recovery next to that step. Split dense explanations into coherent blocks; preserve their condition and execution order. Keep the essential path visible. Conditional detail must not hide a mandatory step.

Use one term per concept within a scope. For a difficult decision, give a small worked example and explain why it meets the rule. An example illustrates the rule; it does not replace its other cases. For an agent reader, use an execution example or counterexample, not a compulsory lesson or quiz for the human user.

Remove repeated explanation only when the same reader still receives the full rule in the same task context. Two copies that protect different standalone skills are not redundant merely because their words match. Do not remove a local fallback or reference because another skill or root policy contains it; first verify that the relevant host actually loads that source.

## Check the rewrite

Compare source and revision in both directions: each original obligation still has an owner and applicable entry point; each new obligation has explicit authority. Check the normal path, failure or unknown-result path, and a nearby case in which the rule must not activate. Verify links, commands and structured examples. Check copied standalone references for drift.

For consequential changes, obtain the independent review and intended-reader task evidence required by the existing contract. For agent instructions, record which files were loaded and what the agent actually did. A source-preservation test proves a textual property; it does not prove comprehension, model obedience, host activation or formal standards conformance.

## Worked distinction

**Vague:** "Check everything and finish."

**Operational:** "Before declaring completion, read the task's acceptance ledger and standing Definition of Done. Execute their applicable checks on the current revision. A failed or unrun required check prevents completion unless an authorised scope change removes that requirement. Report the actual result and next permitted action."

**Why:** the second version names the requirement sources, timing, observable evidence and exception. It does not require every test in the repository for every task.

**Near miss:** a documentation-only change does not justify a production mutation. Verification still follows the actual task contract and existing permissions.

## Source roles

Use the collection's existing **writing** principles for purpose, evidence, terminology and information-for-use; **wait-what** for explicit meaning, proportional structure, uncertainty and recovery; and **teach** for mechanism, segmentation and worked examples. Relevant existing anchors are **ASD-STE100 Issue 9-inspired** clarity, **ISO 24495-1**, **W3C COGA**, **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514/26513**, **ISO 704**, **Diátaxis**, **Feynman-style explanation**, **CAST UDL 3.0**, the **IES** practice guide and **BCP 14**. These are proportionate source influences, not a requirement to recite them or a conformance claim.
