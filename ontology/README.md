# OWL ontology — `food.omn`

The OWL half of the project, in Manchester syntax (the syntax Protégé shows and the lectures use).
Open it in **Protégé 5.6.9** (File → Open), then Reasoner → **HermiT** → Start reasoner and set
the class hierarchy to **Inferred**.

Protégé does not notice when the file changes on disk: close and reopen it after a `git pull`.
Saving from Protégé may rewrite the whole file in its own layout, so agree in the team chat
before two people edit it at once.

## What is in it (2026-11-14)

| Part | Contents |
|---|---|
| Top level | `Food` ⊒ `Ingredient`, `Dish` (disjoint); `Cuisine` (disjoint from `Food`) |
| Ingredient categories | `PlantIngredient` (`Vegetable`, `Fruit`, `Grain`, `Legume`), `Mushroom`, `Meat` (`RedMeat`, `Poultry`, `Offal`), `Seafood`, `Dairy`, `Egg`. The six top categories are pairwise disjoint |
| Ingredients | 49 concrete ingredients as classes, e.g. `Eggplant ⊑ Vegetable`, `Lavash ⊑ Bread ⊑ Grain`, `LambIntestine ⊑ Lamb ⊓ Offal` |
| Properties | `hasIngredient` (Dish → Ingredient), `hasCuisine` (Dish → Cuisine) |
| Cuisines | individuals `TurkishCuisine`, `ItalianCuisine`, `AmericanCuisine`, `BritishCuisine`, all different |
| Dish families | `Kebab`, `Borek`, `Gozleme`, `Pizza`, `Burger`: what every member has, no closure |
| Dishes | 30 dishes, each with its ingredients (`hasIngredient some X`) and a closure axiom (`hasIngredient only (X or Y …)`) |
| Defined classes | `MeatDish`, `SeafoodDish`, `MushroomDish`, `VegetarianDish`, `VeganDish`, `TurkishDish`, `ItalianDish` |

Totals: 106 classes, 2 object properties, 4 individuals, 7 complex definitions.

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

## What HermiT infers

Checked with HermiT (via ROBOT) on 2026-11-14: consistent, and no unsatisfiable classes.

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

- **≥ 50 names**: met (106 classes).
- **≥ 10 complex definitions**: 7 so far.
- **All of ALC + 5 constructs beyond it**: ALC is covered (`and`, `or`, `not`, `some`, `only`).
  Beyond ALC so far: only **nominals** (`value TurkishCuisine`); domain and range do not count,
  since ALC can already express them. Candidates
  for the rest: inverse properties (`isIngredientOf`), a sub-property (`hasMainIngredient ⊑
  hasIngredient`), a transitive property (a dish contains a sauce that contains milk), number
  restrictions (`min 3 hasIngredient Vegetable`), and a property chain for recommendations
  (`likes ∘ isIngredientOf`).

## Next

- People and their likes, dislikes and restrictions (the recommendation part).
- The second formalism (datalog in Nemo), lectures 8–9.
