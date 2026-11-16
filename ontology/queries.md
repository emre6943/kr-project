# Manual ontology regression checks

Open food.omn in Protege, select HermiT, and start the reasoner. Confirm that the
ontology is consistent and that no named class other than owl:Nothing is unsatisfiable.
In the DL Query tab, enter each expression below. Select Subclasses and disable
Direct to include indirect subclasses. Ignore owl:Nothing in result comparisons.

These results are expected from the current axioms; they have not yet been verified
with HermiT. This is a manual checklist, not an automated test suite.

## Suggestion profiles

| DL Query | Expected concrete dish subclasses (complete set) |
|---|---|
| `SuggestionForV` | MargheritaPizza, MushroomPizza, SpaghettiBolognese, MushroomRisotto, TuscanChicken, HummusWithVegetables |
| `SuggestionForSaketh` | PatatesliBorek, PatatesliGozleme, IspanakliBorek, IspanakliGozleme |
| `SuggestionForEmre` | AdanaKebab, Beyti, Cheeseburger, Hamburger, Iskender, Karniyarik, KiymaliBorek, KiymaliGozleme, Kokorec, SpaghettiBolognese, Steak, Tandir, TuscanChicken, ImamBayildi, ChickpeaBurger |

The V query should additionally return the named categories Pizza, Spaghetti and
ItalianDish. The Emre query should additionally return MeatDish, Kebab and Burger.
These categories are not extra concrete recipes. No other named categories are expected.
FishAndChips must not be inferred as a suggestion for Saketh.

## Diet and ingredient checks

| DL Query | Expected concrete dish subclasses (complete set) |
|---|---|
| `VeganDish` | ChickpeaBurger, ImamBayildi, PatatesliBorek, PatatesliGozleme |
| `Spaghetti` | SpaghettiBolognese |
| `Dish and (hasIngredient some Chicken)` | TuscanChicken |
| `Dish and (hasIngredient some Pesto)` | None |

There is no recipe with an asserted pesto ingredient yet. V liking pesto does not
create such a recipe. TuscanChicken should also appear as a subclass of MeatDish.
HummusWithVegetables must not be inferred as VeganDish or VegetarianDish: without
a closure axiom its additional ingredients are unknown. Lack of classification
is not proof that it is non-vegan or non-vegetarian.

## Liked foods

For `Person and (likes some Pesto)`, select Instances: expect V only.
For `Person and (likes some Spaghetti)`, select Instances: expect V only.
These instance queries check the likes assertions, independently of suggestion profiles.