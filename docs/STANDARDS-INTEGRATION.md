# V9 standards integration follow-up

## Scope

This PR is stacked on the unreleased V9.0.1 candidate at `cd199cbda5e7493c500a791bc8ce9a147d6daf2d` (PR #12). It is PR-only: no merge, tag, release or local installation. Keep 17 skills, six profiles, historical source reviews and the existing instruction ceilings.

All 97 register decisions remain accounted for: 91 scoped rules, one project-local escalation, three excluded defaults, one watched source and one deferred source. Integration means using each adopted mechanism where it matters, not activating 97 standards for every task or claiming their full implementation.

## What changed

- Direct implementation and testing now load a small local boundary reference for API/event contracts, security/identity/privacy, interactive instructions, AI/data or lifecycle risks. They no longer rely on a planning or independent-acceptance skill being selected first. Unrelated edits need no reference.
- Experiments load data-quality and AI guidance before accepting material dataset/model comparisons, not only at a later handoff. Office-file instructions retain audience, prerequisites, consequences, recovery, accessibility needs and task evaluation locally.
- Requirement authoring loads its reference even when the desired outcome is already known. EARS now supplies ubiquitous, event, state, option and unwanted-behaviour forms plus an observable session-expiry example. HTTP guidance distinguishes contract formats and preserves adopted error compatibility, status and confidentiality.
- Consolidated teaching, clarification, writing, user-information, AI cards, AI assurance, incident, review and supply-chain explanations. Place short provenance beside the concrete rule rather than appending a second summary. Retain the one-sentence communication fallback across independently loaded skills.
- BCP 14 is explicitly conditional on normative authoring; it does not turn uppercase source data into instructions. Writing retains this safeguard without depending on a global AGENTS file.

## Ownership and regression evidence

[STANDARDS-COVERAGE.json](STANDARDS-COVERAGE.json) preserves all 97 canonical source bindings. [STANDARDS-APPLICATIONS.json](STANDARDS-APPLICATIONS.json) adds 23 local routes and 64 authored task/near-miss fixtures: 48 canonical rule groups plus 16 direct-use or concrete-mechanism cases. Its duplication is evaluation data outside the agent instruction path, not another runtime controller.

The structural check verifies routes, entry-point trigger text, local mechanism anchors, all-source/canonical coverage and retained inactive decisions. New isolated controls remove a loading trigger while retaining its link, remove the EARS example, introduce a cross-profile dependency, omit an application source and promote an excluded source. The checksum regression also tests a malformed line alongside the existing empty-manifest control. Run the existing positive, damaged and restored checks on both supported PowerShell hosts; do not interpret a script's presence as a passing run.

These fixtures are author review, not live model execution, independent approval or semantic conformance. The check cannot prove that a model selects the right skill, understands the trigger or obeys the instruction. Follow a representative real task through its complete result before making those claims. Missing required evidence stays visible.

## Size and source limits

The [size report](V9-SIZE.json) is recalculated from source bytes and whitespace words. Compared with the parent candidate, skill roots fall from 5,165 to 5,110 words while the full skills tree grows from 11,914 to 12,635 words: targeted local references cost space, but the default roots shrink. AGENTS grows from 487 to 513 words; the engineering core remains 530. These are not token savings or task-success measurements.

Targeted primary-source checks on 7 September 2026: [Codex skill loading](https://developers.openai.com/codex/skills/), [EARS syntax](https://alistairmavin.com/ears/), [HTTP Problem Details](https://www.rfc-editor.org/rfc/rfc9457.html), and [BCP 14 interpretation](https://www.rfc-editor.org/rfc/rfc8174.html). Other mechanisms are distilled from the inspected collection, preserved references and adoption decisions. This is not a fresh edition/conformance audit of all 97 external sources; historical review dates stay unchanged.

## Checksum rejection repair

The first follow-up CI run passed the new integration controls but failed while exercising an empty package-checksum fixture. The repaired observer parses checksums into an explicit name map and compares explicit arrays even when no valid record exists; empty, malformed, duplicate, missing-target and mismatched-digest cases remain failures. CI now records the checked-out revision and validator blob before execution. Keep both positive and damaged archive checks; fresh results belong to the matching CI run, not this design record.
