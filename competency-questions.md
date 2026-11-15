# Competency questions

Domain: **food**: ingredients and their categories, dishes made from them, and what people like.
The knowledge base should answer what a person might enjoy.

Keep every question answerable by logical reasoning: no ratings, scores, calories or
"similar taste" measures, because the spec rules out probabilistic, fuzzy and numeric domains.

## Diets

1. Is dish X vegan? Is it vegetarian?
2. Which dishes are vegan? Which are vegetarian?

## Suggestions from liked ingredients

3. A likes ingredients X and Y. Which dishes could A enjoy?
4. A is vegetarian and likes X. Which dishes could A enjoy?

## Suggestions from liked dishes

5. A likes dish X. Which other dishes could A enjoy?
   "Similar" has to be a logical notion, for example sharing a main ingredient or belonging to
   the same family (kebab, börek). A similarity score is out of scope.

## Feasibility notes

- 1–2 and 4 work in OWL directly (closure axioms plus defined classes).
- 3 works in OWL only through one defined "profile" class per person; datalog needs one general
  rule.
- 5 is awkward in OWL (dishes are classes, so OWL cannot go from a liked dish to its
  ingredients and on to other dishes) and natural in datalog.

## Later

- Allergies (`allergicTo`): "Which dishes are safe for someone allergic to X?" Not in the draft.
- Halal is deliberately excluded: it depends on slaughter and certification, not on ingredients,
  so it cannot be inferred from this model.
