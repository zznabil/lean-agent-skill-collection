# Lean remaining-standards prototype pack

## Start here

This ZIP contains **70 source-specific routines**, completing the historical register together with the previous 27 user-facing routines. It is an optional prototype library, not a replacement for Lean V8.8.0, a release, a new default profile or a claim that all 97 entries are adopted.

Read [CATALOG.md](CATALOG.md), select the routine for the actual task, then read its `SKILL.md` and `SOURCES.md`. The existing task skill still owns the work. Do not install every routine merely because it exists.

- `skills/`: **63** optional application routines. Each still has a task-specific trigger; some require explicit project adoption.
- `gated-skills/`: **7** off-default guard/watch/selection routines. Keep this directory outside automatic discovery unless deliberately testing that specific guard.
- Every `SKILL.md` has **46–51 physical lines**, including frontmatter and blank lines. Descriptions are at most 60 characters.
- `official/` under a skill: available original publisher/author references, with their notices. Not every source has an available or redistributable PDF.

No hook, runtime, installer or automatic prompt injection is added. A description and a trigger in prose do not guarantee a host enforces the intended selection policy. Loading a language/standard routine does not grant permission to execute an attack, publish a release, mutate production or edit trusted instructions.

## PDF and source coverage

There are **26 PDF files representing 24 unique documents** across **20 entries**. The unique originals total **1984 pages**. Repeated copies keep required sources local to independently used skills. These are original bytes, not web-to-PDF conversions. The set includes formal publications, guidance, an author research draft, a NASA workshop record and a potential-errata sheet; they are not all normative standards.

The NIST digital-identity routine includes the overview plus proofing, authentication and federation volumes. The AI SSDF routine includes its base SSDF publication. Adversarial-ML potential updates remain a separate file. SARIF's PDF identifies its DOCX version as authoritative.

**Nineteen ISO/IEC/IEEE entries are source-gated.** Full licensed standards were not obtained. Their compact routines are Lean applications grounded in public scopes and existing Lean procedures, not complete clauses or a reconstruction of unavailable text. Obtain the exact authorised full source before a formal assessment. Do not substitute a similarly named standard or an outdated part.

Native OpenAPI, JSON Schema, SLSA, LLMSVS, AsyncAPI, CloudEvents and other permitted references are bundled in their real formats where appropriate. Partial indexes and schemas are labelled as partial. Links or images within native HTML snapshots can require online access. Unavailable/restricted PDFs remain official links with the reason recorded. No empty or unofficial substitute is called an official standard.

See [SOURCE-OBSERVATIONS.md](SOURCE-OBSERVATIONS.md) for source-identity corrections and access gaps. The original 97-row register is byte-preserved in `provenance/`; observation of a new or corrected source does not silently change adoption.

## Rights

This is a mixed-rights aggregation. New prose is CC BY-SA 4.0; audit utility code is MIT. Original documents keep their own rights. Read [LICENSE.md](LICENSE.md), [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) and the individual source notes before redistributing. A free download is not automatically a public redistribution licence.

## Verification

Run from an extracted copy with Python 3.10 or newer:

```sh
python audit/validate_bundle.py
python audit/test_validate_bundle.py
```

These read-only checks use the Python standard library. Tests mutate temporary copies, never the pack itself. `CHECKSUMS.sha256` lists all files except itself. `audit/EXECUTED-RESULTS.json` records actually run structural checks; the 210 cases in `audit/acceptance-cases.json` are **authored, not executed model evaluations**. No invocation probability, semantic equivalence, comprehension gain or formal conformance is claimed.

## Preservation and use

Keep the existing task skills, root safeguards and user-facing pack unchanged. Only copy selected skill folders into a host's documented skill directory after reviewing that host's discovery rules. Skill-local source files stay with their owner. This task did not modify PR #16, canonical main, releases, installed skills or trusted user instructions.

The companion all-97 ZIP keeps this pack separate from the byte-preserved PR16 user-facing review pack. It does not install 97 active skills as one profile.
