# Backbone — DRAFT, not yet agreed

The shared vocabulary every sub-scope builds on. **Status: draft by Emre, 2026-11-09 — needs the
team's OK before anyone models against it.**

Rules once agreed:

- **Extend freely**: new subclasses, new relations, new individuals.
- **Change only together**: renaming or redefining anything below needs a quick team check.
- New diseases go into the shared list below, not into one person's file.

## Naming conventions

- Classes: `UpperCamelCase`, singular (`Disease`, `ViralDisease`).
- Relations: `lowerCamelCase`, read as a verb from subject to object (`hasSymptom`, `causedBy`).
- Individuals (specific diseases, symptoms, organs): `UpperCamelCase` (`Influenza`, `Fever`, `Lung`).
- Each disease keeps its DOID id as an annotation (`doid: "DOID:8469"`) so we can trace the source.

## Core classes

```
Disease
Symptom
Cause
├── Pathogen
│   ├── Virus
│   ├── Bacterium
│   ├── Fungus
│   └── Parasite
└── GeneticCause
AnatomicalEntity
├── Organ            (Lung, Liver, Skin, Intestine…)
└── OrganSystem      (RespiratorySystem, DigestiveSystem…)
```

## Core relations

| Relation | Domain → Range | Example |
|---|---|---|
| `hasSymptom` | Disease → Symptom | Influenza `hasSymptom` Fever |
| `causedBy` | Disease → Cause | Influenza `causedBy` InfluenzaVirusA |
| `affects` | Disease → AnatomicalEntity | Hepatitis A `affects` Liver |
| `partOf` | Organ → OrganSystem | Lung `partOf` RespiratorySystem |

## Shared disease list (candidate)

Chosen for a spread of cause types and overlapping symptoms (fever, rash, cough recur), so
"which diseases match these symptoms?" has interesting answers.

Coverage in DOID (release 2026-10-29): ✅ cause, location and symptoms all present ·
🟡 partly present, fill from Wikidata/MedlinePlus · ❌ enter by hand.

| Disease | DOID | Cause type | DOID coverage |
|---|---|---|---|
| Influenza | DOID:8469 | virus | 🟡 no location |
| COVID-19 | DOID:0080600 | virus | 🟡 cause only |
| Measles | DOID:8622 | virus | ✅ |
| Chickenpox | DOID:8659 | virus | ✅ |
| Rubella | DOID:8781 | virus | ✅ |
| Mumps | DOID:10264 | virus | 🟡 cause only |
| Hepatitis A | DOID:12549 | virus | ✅ |
| Hepatitis B | DOID:2043 | virus | 🟡 one symptom |
| Dengue | DOID:12205 | virus | 🟡 cause only |
| Common cold | DOID:10459 | virus | ❌ |
| Tuberculosis | DOID:399 | bacterium | 🟡 no symptoms |
| Lyme disease | DOID:11729 | bacterium | 🟡 no location |
| Gonorrhea | DOID:7551 | bacterium | ✅ |
| Campylobacteriosis | DOID:13622 | bacterium | ✅ |
| Cholera | DOID:1498 | bacterium | ❌ |
| Pneumonia | DOID:552 | virus **or** bacterium | ❌ |
| Meningitis | DOID:9471 | virus **or** bacterium | ❌ |
| Tinea pedis (athlete's foot) | DOID:12403 | fungus | ✅ |
| Malaria | DOID:12365 | parasite | ❌ |
| Cystic fibrosis | DOID:1485 | genetic | ❌ |
| Sickle cell anemia | DOID:10923 | genetic | ❌ |

Pneumonia and meningitis can be viral *or* bacterial: a good test for OWL disjunction and for
open- vs closed-world reasoning.

## Sub-scopes

| Scope | Owner | Adds (examples) |
|---|---|---|
| Symptoms and causes | Emre | symptom hierarchy, cause hierarchy, `ViralDisease ≡ Disease ⊓ ∃causedBy.Virus` |
| Affects (anatomy, organ systems) | ? | organ → system hierarchy, `affects` via property chain |
| ? | ? | |
| ? | ? | |

## Open questions for the team

1. Are the four core relations enough, or does anyone's scope need one in the backbone?
2. Is the disease list right? Too many infectious diseases?
3. Symptoms as individuals (`Fever`) or classes (`Fever ⊑ Symptom`)? Classes allow a hierarchy
   (`Fever ⊑ ElevatedTemperature`); decide before anyone models.
4. Who owns which scope?
