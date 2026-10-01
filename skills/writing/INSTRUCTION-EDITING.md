# Edit instructions without losing the contract

Use this reference to draft or edit a skill, agent policy, workflow, prompt, checklist, handoff, or user procedure. The reader can be a person or an executing agent. This procedure supports authoring. It does not require three communication skills to load for every task.

## Before changing the words

Identify the reader, task, input, expected result, and authority. Use the request and existing material. Inspect the current instructions and their callers. Mark unresolved requirements as unresolved. Do not invent a default to complete a paragraph.

Keep each rule's trigger, actor, action, object, scope, requirement strength, exception, order, failure response, and completion evidence. Keep links, resource paths, source references, and adoption decisions. Keep watched, deferred, and rejected sources in their existing states. Do not change exact identifiers, commands, schemas, numbers, quoted source text, or status names without authorisation.

## Rewrite a decision, not an aspiration

For a rule with a consequential choice, use this structure:

```text
When <observable condition>, <actor> MUST/SHOULD/MAY <action on a named object>.
Verify <observable result>.
If <failure or unknown result>, <permitted recovery or stop>.
Exception: <existing authorised exception>.
```

Include only fields that the rule needs. Do not invent thresholds, permissions, or failure modes to fill the template. Use ordinary verbs in ordinary prose. Use BCP 14 wording for normative requirements. Keep the original requirement strength. A MUST is not a SHOULD. An exception is not a default. An untested result is not a passed result.

Identify the referent of "it", "appropriate", "relevant", or "complete" when that choice changes the action. Use the source or surrounding workflow to resolve the reference. If neither resolves it, flag the missing decision. Do not substitute plausible advice.

## Make the instructions usable

Place prerequisites and warnings before the action they constrain. Give each step one main action or one tightly coupled action group. Place the expected result and recovery beside that step. Split dense explanations into coherent blocks. Keep their conditions and execution order. Keep the essential path visible. Do not hide mandatory steps in conditional detail.

Use one term for each concept within a scope. For a difficult decision, give a small worked example. Explain why the example meets the rule. An example illustrates a rule; it does not replace other cases. For an agent reader, give an execution example or counterexample. Do not require a lesson or quiz for the human user.

Remove repeated explanations only if the same reader still receives the full rule in the same task context. Matching text in two standalone skills is not redundant if each copy protects a different skill. Before removing a local fallback or reference, verify that the relevant host loads its replacement source. Its presence in another skill or root policy is not enough.

## Check the rewrite

Compare the source and revision in both directions. Each original obligation must retain an owner and an applicable entry point. Each new obligation must have explicit authority. Check the normal path and the failure or unknown-result path. Check a nearby case where the rule must not activate. Verify links, commands, and structured examples. Check copied standalone references for drift.

For consequential changes, obtain the independent review and intended-reader task evidence that the existing contract requires. For agent instructions, record the loaded files and the agent's actual actions. A source-preservation test proves a textual property only. It does not prove comprehension, model obedience, host activation, or formal standards conformance.

## Worked distinction

**Vague:** "Check everything and finish."

**Operational:** "Before declaring completion, read the task's acceptance ledger and standing Definition of Done. Execute their applicable checks on the current revision. A failed or unrun required check prevents completion unless an authorised scope change removes that requirement. Report the actual result and next permitted action."

**Why:** The operational version identifies requirement sources, timing, observable evidence, and the exception. It does not require every repository test for every task.

**Near miss:** A documentation-only change does not authorise a production mutation. Verify against the actual task contract and existing permissions.

## Source roles

Use the communication kernel below as the default. Do not restore discarded default standards through this editing procedure. Apply a specialised source when the task requires its domain, including through an implicit task trigger. Stylistic use does not establish formal conformance.

For normative requirements, preserve BCP 14 force and exceptions. Important requirements name one actor, one action and an observable verification target. Before risky actions, place warnings before hazards. Before critical or irreversible steps, add a hold point. Verify the actual safe state before destructive or hazardous work. Anticipate plausible errors; state the expected result, failure sign and permitted recovery or stop. For difficult decisions, use the example or counterexample guidance above when useful. These execution controls apply to their task conditions; they are not default communication frameworks.

## Communication kernel

Use ASD-STE100-inspired short active technical sentences and direct verbs. Use ISO 704-inspired terminology: keep one preferred term for each concept within a scope and distinguish related concepts. Use Diátaxis to separate actions, reference facts, and explanations when that separation helps. If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. These influences do not establish formal standards conformance.
