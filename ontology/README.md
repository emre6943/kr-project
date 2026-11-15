# OWL ontology — `food.omn`

The OWL half of the project, in Manchester syntax (the syntax Protégé shows and the lectures use).
Open it in **Protégé 5.6.9** (File → Open), then Reasoner → **HermiT** → Start reasoner and set
the class hierarchy to **Inferred**.

Protégé does not notice when the file changes on disk: close and reopen it after a `git pull`.
Saving from Protégé may rewrite the whole file in its own layout, so agree in the team chat
before two people edit it at once.

## What is in it (2026-11-15)

| Part | Contents |
|---|---|
| Top level | `Food` ⊒ `Ingredient`, `Dish` (disjoint); `Cuisine` (disjoint from `Food`); `Person` (disjoint from `Food` and `Cuisine`) |
| Ingredient categories | `PlantIngredient` (`Vegetable`, `Fruit`, `Grain`, `Legume`), `Mushroom`, `Meat` (`RedMeat`, `Poultry`, `Offal`), `Seafood`, `Dairy`, `Egg`. The six top categories are pairwise disjoint |
| Ingredients | 49 concrete ingredients as classes, e.g. `Eggplant ⊑ Vegetable`, `Lavash ⊑ Bread ⊑ Grain`, `LambIntestine ⊑ Lamb ⊓ Offal` |
| Properties | `hasIngredient` (Dish → Ingredient), its inverse `isIngredientOf`, `hasCuisine` (Dish → Cuisine), `likes` (Person → Food) |
| Cuisines | individuals `TurkishCuisine`, `ItalianCuisine`, `AmericanCuisine`, `BritishCuisine`, all different |
| Dish families | `Kebab`, `Borek`, `Gozleme`, `Pizza`, `Burger`: what every member has, no closure |
| Dishes | 30 dishes, each with its ingredients (`hasIngredient some X`) and a closure axiom (`hasIngredient only (X or Y …)`) |
| Defined classes | `MeatDish`, `SeafoodDish`, `MushroomDish`, `VegetarianDish`, `VeganDish`, `TurkishDish`, `ItalianDish` |
| People | `VegetarianPerson`, `VeganPerson ⊑ VegetarianPerson` (primitive); individuals for team members and friends: `Emre`, `Saketh`, `V` |
| Suggestion profiles | `SuggestionForEmre`, `SuggestionForSaketh`, `SuggestionForV`: one defined class per person |

Totals: 112 classes, 4 object properties, 7 individuals, 10 complex definitions.

## Modelling decisions

- **Ingredients and dishes are classes**, not individuals (the pattern of the lecture's Pizza
  ontology): `Eggplant` is a kind of `Vegetable`, and a dish is defined by what it contains.
- **Culinary, not botanical, categories**: a tomato is a `Vegetable`. **Mushrooms are not plants**,
  so `Mushroom` is its own category, disjoint from `PlantIngredient`.
- **Grain products count as grain** (`Bread`, `Pide`, `Lavash`, `Yufka`, `Pasta`, `PizzaDough`).
- **`TurkeyMeat`**, not `Turkey`, so the poultry is never confused with the cuisine.
- **Closure axioms make vegetarian/vegan inferable.** Under the open-world assumption, a dish
  that only says `hasIngredient some Cheese` might still contain meat. The closure axiom states
  the full ingredient list, so the reasoner can conclude what is *not* in the dish. The dish
  families (`Borek`, `Pizza`, …) deliberately have no closure, so they are never classified as
  vegetarian.
- Leaf ingredients are not yet disjoint from each other (nothing says `Eggplant ⊓ Tomato ⊑ ⊥`).

## People and suggestions

- **A diet is stated, not inferred**: `VegetarianPerson` and `VeganPerson` are primitive classes,
  and `VeganPerson ⊑ VegetarianPerson`.
- **Likes point at an ingredient class or a dish class** (both are `Food`): `Emre` has types
  `likes some Eggplant` and `likes some Iskender`.
- **OWL cannot turn a person's likes into suggestions on its own.** Ingredients and dishes are
  classes, so no property chain can walk from a person to a dish. The workaround is one defined
  **profile class** per person, which the reasoner fills with dishes. It works but does not
  scale: every new person needs a new class. In datalog one general rule covers everyone, which
  is a central point for the comparison.
- **A liked dish becomes suggestions through a logical notion of similarity**: the same family
  (İskender and Beyti are kebabs) or the same cuisine (pizza is Italian). Never a score.

| Person | Diet and likes | Profile | Inferred suggestions |
|---|---|---|---|
| `Emre` | no diet; likes eggplant, meat, İskender, Beyti, burgers | `Dish ⊓ (∃hasIngredient.(Eggplant ⊔ Meat) ⊔ Kebab ⊔ Burger)` | every MeatDish (12 dishes), plus Karniyarik, ImamBayildi, ChickpeaBurger |
| `Saketh` | vegetarian; likes potato, spinach | `VegetarianDish ⊓ ∃hasIngredient.(Potato ⊔ Spinach)` | PatatesliBorek, PatatesliGozleme, IspanakliBorek, IspanakliGozleme |
| `V` | no diet; likes pizza | `Dish ⊓ (Pizza ⊔ ∃hasCuisine.{ItalianCuisine})` | MargheritaPizza, MushroomPizza, SpaghettiBolognese, MushroomRisotto |

- FishAndChips has potato but also cod, so it is not suggested to Saketh.
- ImamBayildi reaches Emre through eggplant, and ChickpeaBurger through the burger family, even
  though it has no meat: the profile is a disjunction, so one matching reason is enough.
- **İskender reaches Emre through `Meat`, but would not reach someone who only likes lamb.** Its
  axiom is `∃hasIngredient.(Lamb ⊔ Beef)`: it contains lamb *or* beef, so it does not follow that
  it contains lamb, but it does follow that it contains meat. A good example of what disjunction
  does and does not entail.
- The reasoner also infers `SuggestionForV ≡ ItalianDish`, because every pizza is Italian.

## What HermiT infers

Checked with HermiT (via ROBOT) on 2026-11-15, after the people update: consistent, and no unsatisfiable classes.

| Inferred class | Dishes |
|---|---|
| `VeganDish` (and so `VegetarianDish`) | ChickpeaBurger, ImamBayildi, PatatesliBorek, PatatesliGozleme |
| `VegetarianDish` only | IspanakliBorek, IspanakliGozleme, MargheritaPizza, Menemen, MercimekCorbasi, MushroomPizza, MushroomRisotto, Omelette, PeynirliBorek, PeynirliGozleme, Pilav, SigaraBoregi, SuBoregi |
| `MeatDish` | AdanaKebab, Beyti, Cheeseburger, Hamburger, Iskender, Karniyarik, KiymaliBorek, KiymaliGozleme, Kokorec, SpaghettiBolognese, Steak, Tandir |
| `SeafoodDish` | FishAndChips |
| `MushroomDish` | MushroomPizza, MushroomRisotto |
| `TurkishDish` | every Kebab, Börek and Gözleme (inherited from the family), plus Kokorec, Karniyarik, ImamBayildi, Menemen, MercimekCorbasi, Pilav |
| `ItalianDish` | both pizzas, SpaghettiBolognese, MushroomRisotto |

`VeganDish ⊑ VegetarianDish` is inferred, not stated: it follows from the disjointness of the
ingredient categories.

## Against the grading scheme

- **≥ 50 names**: met (112 classes).
- **≥ 10 complex definitions**: met (7 dish categories + 3 suggestion profiles).
- **All of ALC + 5 constructs beyond it**: ALC is covered (`and`, `or`, `not`, `some`, `only`).
  Beyond ALC so far: **nominals** (`value TurkishCuisine`) and **inverse properties**
  (`isIngredientOf`); domain and range do not count, since ALC can already express them.
  **3 more needed.** Candidates: a sub-property (`hasMainIngredient ⊑ hasIngredient`), a
  transitive property (a dish contains a sauce that contains milk), qualified number restrictions
  (`min 3 hasIngredient Vegetable`), and a property chain (if people or dishes become
  individuals).

## Next

- **Allergies, later**: an `allergicTo` property and profiles that exclude the allergen.
- **Dish-to-dish suggestions** ("likes İskender, so suggest …"), and one general suggestion rule
  for every person: both belong in **datalog** (Nemo, lectures 8–9), where they are single rules.
- Dislikes, if needed, via negation as failure in datalog.
