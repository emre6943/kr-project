# Data sources

Domain: **diseases** — scope: diseases, symptoms, causes, and what they affect.

The raw downloads live in `raw/`, which is gitignored because `doid.owl` alone is 29 MB.
Run `./fetch.sh` to download them again.

These are sources of facts and term IDs, not ontologies to import whole: the knowledge base we
hand in must be our own modelling.

| Source | Gives us | License | Version checked |
|---|---|---|---|
| [Human Disease Ontology (DOID)](https://disease-ontology.org) | 14,939 diseases; `has_symptom`, `has_material_basis_in` (cause) and `located_in` (anatomy) as OWL axioms | CC0 | release 2026-10-29 |
| [Symptom Ontology (SYMP)](https://github.com/DiseaseOntology/SymptomOntology) | 1,020 symptom terms in a hierarchy; DOID's symptom vocabulary | CC0 | release 2026-07-30 |
| [Wikidata](https://www.wikidata.org) | symptoms (P780), cause (P828), anatomy, ICD codes, labels | CC0 | queried 2026-11-09 |
| [UBERON](https://obophenotype.github.io/uberon/) | organ → organ-system hierarchy, for "affects" | CC BY 4.0 | not downloaded |
| [NCBI Taxonomy](https://www.ncbi.nlm.nih.gov/taxonomy) | pathogen hierarchy (e.g. Influenzavirus A → virus) | public | not downloaded |
| [MedlinePlus](https://medlineplus.gov) | plain-language symptom pages, to check hand-entered facts | public domain | not checked |

Wikidata is thin on our scope: of 6,512 diseases, 324 have symptoms, 391 a cause and only 83 both
(`wikidata-coverage.rq`). DOID is the main source; Wikidata fills gaps.

Not used: HPO disease annotations (`phenotype.hpoa`). They cover only rare diseases
(OMIM/Orphanet) and record symptom frequencies, which the spec asks us to avoid.
