# Lean remaining-standards prototype pack

## Start here

This ZIP contains **70 source-specific routines**, completing the historical register together with the previous 27 user-facing routines. It is an optional prototype library, not a replacement for canonical release profiles or a claim that all 97 entries are adopted.

Read [CATALOG.md](CATALOG.md), select the routine for the actual task, then read its `SKILL.md` and `SOURCES.md`. The existing task skill still owns the work. Do not install every routine merely because it exists.

- `skills/`: **63** optional application routines. Each still has a task-specific trigger; some require explicit project adoption.
- `gated-skills/`: **7** off-default guard/watch/selection routines. Keep this directory outside automatic discovery unless deliberately testing that specific guard.
- Every `SKILL.md` has **57–62 physical lines**, including frontmatter and blank lines. Descriptions are at most 60 characters.
- `official/` under a skill: available original publisher/author references, with their notices. Not every source has an available or redistributable PDF.

No hook, runtime, installer or automatic prompt injection is added. A description and a trigger in prose do not guarantee a host enforces the intended selection policy. When trusted root `AGENTS.md` is loaded, its communication policy governs every selected skill. A direct standalone skill install without root policy uses the self-contained lean communication kernel fallback in its `SKILL.md`; each routine also keeps its own scoped steps, worked check and missing-evidence recovery. This does not claim that a host loaded root policy. Loading a language/standard routine does not grant permission to execute an attack, publish a release, mutate production or edit trusted instructions.

## PDF and source coverage

There are **26 PDF files representing 24 unique documents** across **20 entries**. The unique originals total **1984 pages**. Repeated copies keep required sources local to independently used skills. These are original bytes, not web-to-PDF conversions. The set includes formal publications, guidance, an author research draft, a NASA workshop record and a potential-errata sheet; they are not all normative standards.

### Source-byte safety
Bundled PDFs are preserved source bytes and may contain active-content markers. Do not execute embedded content; open them only in a patched, sandboxed viewer or inspect them offline. This pack does not sanitize source bytes or claim they are safe.

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

These read-only checks use the Python standard library and mutate only temporary copies. `CHECKSUMS.sha256` lists every pack file except itself. The embedded `SOURCE-BASELINE.sha256` covers every file except the mutable ledgers and `audit/validate_bundle.py`; the validator pins that baseline, so refreshing a checksum inventory alone cannot redefine content, rights or controls. A standalone extraction still requires trusted validator bytes.
The repository's `UPSTREAM-CHECKSUMS.sha256` separately pins this pack's checksum ledger. Pack-local validation does not prove the root integration pin is current; update that root pin only through its authorised owner after pack changes. `build_zip.py` excludes generated bytecode and verifies a temporary archive before atomically replacing its destination.
`audit/EXECUTED-RESULTS.json` records observed structural checks; the 210 cases in `audit/acceptance-cases.json` are authored, not executed model evaluations. No invocation probability, semantic equivalence, comprehension gain or formal conformance is claimed.

## Preservation and use

Installing this optional pack does not itself alter canonical task skills, release-profile membership, root safeguards, user-facing release packs or trusted user instructions. Copy only selected skill folders into a host's documented directory after checking discovery rules; keep skill-local source files with their owner. Repository changes outside this pack are separate from that installation boundary.

The companion all-97 ZIP keeps this pack separate from the PR16-derived user-facing standards pack, now the integrated pack with its documented CAST repair. It does not install 97 active skills as one profile.
