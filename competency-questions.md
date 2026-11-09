# Competency questions

Domain: **diseases**. Team scope: diseases, symptoms, causes, and what they affect. Each member
owns one sub-scope that builds on the shared [backbone](backbone.md).

## Scope: symptoms and causes — Emre

**What this scope covers:** which symptoms each disease has, what causes each disease (virus,
bacterium, fungus, parasite or genetic), and what follows from those two facts, such as
inheriting symptoms from a parent class or inferring that a disease is infectious.

**Out of scope:** how likely a symptom or disease is (no probabilities or frequencies), severity,
treatment and drugs, and which organs a disease affects (that belongs to the "affects" scope).

**Backbone terms used:** `Disease`, `Symptom`, `Cause` and its subclasses, `hasSymptom`,
`causedBy`.

### Symptoms

 Questions:

1. What are the symptoms of disease X?
2. I have symptoms x and y. Which diseases could I have?
3. I have disease X and I am experiencing x. Is that normal?
4. If I have diseases X and Y, which symptoms will I have?

Notes:

- **Q1** is a plain lookup unless symptoms are stated on a parent class (for example, all viral
  respiratory infections cause cough), so that a subclass like influenza inherits them.
- **Q2** is the strongest question. Phrase it as "which diseases have *all* of these symptoms",
  with no ranking by likelihood.
- **Q3** shows open- vs closed-world reasoning. If x is not listed, OWL answers "unknown" and
  datalog answers "no". This is a candidate research question.
- **Q4** only merges two lists. Drop it or rephrase it.

Additional questions:

5. Which symptoms do diseases X and Y have in common?
6. Which diseases have symptom x but not symptom y? (needs negation: shows the difference between
   OWL and negation as failure in datalog)
7. Which symptom distinguishes disease X from disease Y?
8. Which diseases have no recorded symptoms? (answerable in datalog, not in OWL under the
   open-world assumption)
9. Is fever a kind of elevated temperature, and which diseases therefore have an elevated
   temperature? (tests the symptom hierarchy)

### Causes

Questions:

10. What causes disease X?
11. Which diseases are caused by a virus? By a bacterium? By a genetic mutation?
12. Is disease X infectious? (inferred: a disease caused by a pathogen is infectious)
13. Which diseases share a cause but have different symptoms?
14. Which diseases can be caused by either a virus or a bacterium? (pneumonia and meningitis;
    tests disjunction in OWL)
15. Is there a disease that is both genetic and infectious? (should be inconsistent if
    `GeneticCause` and `Pathogen` are disjoint)

### Symptoms and causes together

Additional questions:

16. Which viral diseases cause a rash?
17. I have a fever and a cough. Which of the diseases that could explain this are bacterial?
18. Do all diseases caused by the same virus family have a symptom in common?

## Scope: affects (anatomy, organ systems) — owner ?

_To be written by the owner._

## Scope: ? — owner ?

_To be written by the owner._

## Scope: ? — owner ?

_To be written by the owner._
