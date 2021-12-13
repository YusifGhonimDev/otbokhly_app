import 'package:flutter/material.dart';
import 'package:otbokhly_app/constants/constants.dart';
import 'package:otbokhly_app/models/recipe_model.dart';

class IngredientsWidget extends StatelessWidget {
  final RecipeModel? recipe;
  final int? index;

  const IngredientsWidget({Key? key, this.recipe, this.index})
      : super(key: key);

  String name(index) {
    return recipe!
        .results![this.index!].extendedIngredients![index].originalName!;
  }

  String amount(index) {
    return "${recipe!.results![this.index!].extendedIngredients![index].amount!} ${recipe!.results![this.index!].extendedIngredients![index].unit!}";
  }

  String type(index) {
    return recipe!
        .results![this.index!].extendedIngredients![index].consistency!;
  }

  int numberOfIngredients(index) {
    return recipe!.results![index!].extendedIngredients!.length;
  }

  String info(index) {
    return recipe!
        .results![this.index!].extendedIngredients![index].originalString!;
  }

  String image(index) {
    return "$ingredientEndPoint${recipe!.results![this.index!].extendedIngredients![index].image!}";
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numberOfIngredients(index),
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Image.network(image(index)),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name(index),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(amount(index)),
                      const SizedBox(height: 10),
                      Text(type(index)),
                      const SizedBox(height: 10),
                      Text(info(index))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FavouritesIngredientsWidget extends StatelessWidget {
  final dynamic ingredients;
  final int? index;

  const FavouritesIngredientsWidget({Key? key, this.ingredients, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients![index]["ingredients"].length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Image.network(
                    "$ingredientEndPoint${ingredients[this.index]["ingredients"][index]["image"]}"),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ingredients[this.index]["ingredients"][index]
                            ["nameClean"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          "${ingredients[this.index]["ingredients"][index]["amount"]} ${ingredients[this.index]["ingredients"][index]["unit"]}"),
                      const SizedBox(height: 10),
                      Text(ingredients[this.index]["ingredients"][index]
                          ["consistency"]),
                      const SizedBox(height: 10),
                      Text(ingredients[this.index]["ingredients"][index]
                          ["originalString"])
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
