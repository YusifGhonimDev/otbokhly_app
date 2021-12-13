import 'package:flutter/material.dart';
import 'package:otbokhly_app/helpers/diet_filter.dart';
import 'package:otbokhly_app/helpers/dish_filter.dart';
import 'package:otbokhly_app/helpers/meal_filter.dart';
import 'package:otbokhly_app/screens/home/recipe_screen.dart';

class FiltersWidget extends StatefulWidget {
  final BuildContext? context;

  const FiltersWidget({Key? key, this.context}) : super(key: key);

  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Meal Type",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Main Course"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          mainCourse = isClicked;
                          mainCourseSelected();
                        });
                      },
                      selected: mainCourse,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Side Dish"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          sideDish = isClicked;
                          sideDishSelected();
                        });
                      },
                      selected: sideDish,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Dessert"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          dessert = isClicked;
                          dessertSelected();
                        });
                      },
                      selected: dessert,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Appetizer"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          appetizer = isClicked;
                          appetizerSelected();
                        });
                      },
                      selected: appetizer,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Salad"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          salad = isClicked;
                          saladSelected();
                        });
                      },
                      selected: salad,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Bread"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          bread = isClicked;
                          breadSelected();
                        });
                      },
                      selected: bread,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Breakfast"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          breakfast = isClicked;
                          breakfastSelected();
                        });
                      },
                      selected: breakfast,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Soup"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          soup = isClicked;
                          soupSelected();
                        });
                      },
                      selected: soup,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Beverage"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          beverage = isClicked;
                          beverageSelected();
                        });
                      },
                      selected: beverage,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Sauce"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          sauce = isClicked;
                          sauceSelected();
                        });
                      },
                      selected: sauce,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Marinade"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          marinade = isClicked;
                          marinadeSelected();
                        });
                      },
                      selected: marinade,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Fingerfood"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          fingerfood = isClicked;
                          fingerfoodSelected();
                        });
                      },
                      selected: fingerfood,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Snack"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          snack = isClicked;
                          snackSelected();
                        });
                      },
                      selected: snack,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Drink"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          drink = isClicked;
                          drinkSelected();
                        });
                      },
                      selected: drink,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Diet Type",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Gluten Free"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          glutenFree = isClicked;
                          glutenFreeSelected();
                        });
                      },
                      selected: glutenFree,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Ketogenic"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          ketoGenic = isClicked;
                          ketoGenicSelected();
                        });
                      },
                      selected: ketoGenic,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Vegeterian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          vegeterian = isClicked;
                          vegeterianSelected();
                        });
                      },
                      selected: vegeterian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Lacto-Vegeterian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          lactoVegeterian = isClicked;
                          lactoVegeterianSelected();
                        });
                      },
                      selected: lactoVegeterian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Ovo-Vegeterian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          ovoVegeterian = isClicked;
                          ovoVegeterianSelected();
                        });
                      },
                      selected: ovoVegeterian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Vegan"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          vegan = isClicked;
                          veganSelected();
                        });
                      },
                      selected: vegan,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Pescetarian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          pescetarian = isClicked;
                          pescetarianSelected();
                        });
                      },
                      selected: pescetarian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Paleo"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          paleo = isClicked;
                          paleoSelected();
                        });
                      },
                      selected: paleo,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Primal"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          primal = isClicked;
                          primalSelected();
                        });
                      },
                      selected: primal,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Low FODMAP"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          lowFODMAP = isClicked;
                          lowFODMAPSelected();
                        });
                      },
                      selected: lowFODMAP,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Whole30"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          whole30 = isClicked;
                          whole30Selected();
                        });
                      },
                      selected: whole30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Dish Type",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("African"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          african = isClicked;
                          africanIsSelected();
                        });
                      },
                      selected: african,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("American"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          american = isClicked;
                          americanIsSelected();
                        });
                      },
                      selected: american,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("British"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          british = isClicked;
                          britishIsSelected();
                        });
                      },
                      selected: british,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Cajun"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          cajun = isClicked;
                          cajunIsSelected();
                        });
                      },
                      selected: cajun,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Caribbean"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          caribbean = isClicked;
                          carribeanIsSelected();
                        });
                      },
                      selected: caribbean,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Chinese"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          chinese = isClicked;
                          chineseIsSelected();
                        });
                      },
                      selected: chinese,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Eastern European"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          easternEuropean = isClicked;
                          easternEuropeanIsSelected();
                        });
                      },
                      selected: easternEuropean,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("European"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          european = isClicked;
                          europeanIsSelected();
                        });
                      },
                      selected: european,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("French"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          french = isClicked;
                          frenchIsSelected();
                        });
                      },
                      selected: french,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("German"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          german = isClicked;
                          germanIsSelected();
                        });
                      },
                      selected: german,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Greek"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          greek = isClicked;
                          greekIsSelected();
                        });
                      },
                      selected: greek,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Indian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          indian = isClicked;
                          indianIsSelected();
                        });
                      },
                      selected: indian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Irish"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          irish = isClicked;
                          irishIsSelected();
                        });
                      },
                      selected: irish,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Italian"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          italian = isClicked;
                          italianIsSelected();
                        });
                      },
                      selected: italian,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Japanese"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          japanese = isClicked;
                          japaneseIsSelected();
                        });
                      },
                      selected: japanese,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Jewish"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          jewish = isClicked;
                          jewishIsSelected();
                        });
                      },
                      selected: jewish,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Korean"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          korean = isClicked;
                          koreanIsSelected();
                        });
                      },
                      selected: korean,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Latin American"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          latinAmerican = isClicked;
                          latinAmericanIsSelected();
                        });
                      },
                      selected: latinAmerican,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Mediterranean"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          mediterranean = isClicked;
                          mediterraneanIsSelected();
                        });
                      },
                      selected: mediterranean,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Mexican"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          mexican = isClicked;
                          mexicanIsSelected();
                        });
                      },
                      selected: mexican,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Middle Eastern"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          middleEastern = isClicked;
                          middleEasternIsSelected();
                        });
                      },
                      selected: middleEastern,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Nordic"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          nordic = isClicked;
                          nordicIsSelected();
                        });
                      },
                      selected: nordic,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Southern"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          southern = isClicked;
                          southernIsSelected();
                        });
                      },
                      selected: southern,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Spanish"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          spanish = isClicked;
                          spanishIsSelected();
                        });
                      },
                      selected: spanish,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Thai"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          thai = isClicked;
                          thaiIsSelected();
                        });
                      },
                      selected: thai,
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      selectedColor: Colors.orange,
                      label: const Text("Vietnamese"),
                      onSelected: (isClicked) {
                        stateSetter(() {
                          vietnamese = isClicked;
                          vietnameseIsSelected();
                        });
                      },
                      selected: vietnamese,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    stateSetter(() {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecipeScreen()));
                    });
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ),
                  minWidth: double.infinity,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
