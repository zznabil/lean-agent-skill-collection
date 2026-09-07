# Material data and AI comparisons

Use only for a decision whose reliability depends on dataset or model quality, not every numerical calculation.

Before comparison, record the data's intended use, source/licence, collection and transformations. Select quality dimensions that can change the decision: for example accuracy, completeness, consistency, timeliness or relevant coverage. Define each measure, denominator, exclusions and uncertainty; do not invent a universal data-quality score. Check duplicates, joins, units, missingness and train/test or retrieval leakage where relevant. (ISO/IEC 5259; ISO/IEC 25012; ISO/IEC 25024).

For models or AI systems, pin model/provider, prompt, tools, evaluator and dataset revisions. Separate exploratory and untouched holdout evidence; repeated tuning consumes a holdout. Inspect relevant subgroup or domain limits, failure modes and the affected people's benefits, harms and recourse. Verify tool permissions and data boundaries before a consequential experiment. Use only applicable threat cases, not the entire threat catalogue. (NIST AI RMF/GenAI Profile; NIST SP 800-218A; ISO/IEC 5338/42005; OWASP LLMSVS/AISVS; NIST AI 100-2e2025; OWASP Agentic Top 10; MITRE ATLAS).

For a reusable dataset or model result, preserve a compact existing record of identity, intended/excluded uses, provenance, access, evaluation and limitations. Use the established card/datasheet format when a handoff needs one; do not create three competing documents. Make metadata findable within authorised access, not necessarily public. Record which change invalidates the evidence. (Model Cards; Data Cards; Datasheets for Datasets; FAIR).
