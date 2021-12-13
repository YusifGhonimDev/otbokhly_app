import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:html/parser.dart';
import 'package:otbokhly_app/models/recipe_model.dart';

class OverviewWidget extends StatelessWidget {
  final RecipeModel? recipe;
  final int? index;

  const OverviewWidget({Key? key, this.recipe, this.index}) : super(key: key);

  bool get isVegeterian => recipe!.results![index!].vegetarian!;
  bool get isGluttenFree => recipe!.results![index!].glutenFree!;
  bool get isHealthy => recipe!.results![index!].veryHealthy!;
  bool get isVegan => recipe!.results![index!].vegan!;
  bool get isDairyFree => recipe!.results![index!].dairyFree!;
  bool get isCheap => recipe!.results![index!].cheap!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Stack(
              children: [
                Image.network(
                  recipe!.results![index!].image!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 200),
                    Column(
                      children: [
                        const Icon(CupertinoIcons.heart),
                        Text(recipe!.results![index!].aggregateLikes!
                            .toString()),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Icon(CupertinoIcons.clock),
                        Text(recipe!.results![index!].readyInMinutes!
                            .toString()),
                      ],
                    ),
                    const SizedBox(width: 10, height: 10)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                recipe!.results![index!].title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    buildInfo("Vegeterian", isVegeterian ? Colors.green : null,
                        isVegeterian ? Colors.green : null),
                    buildInfo(
                        "Gluten Free",
                        isGluttenFree ? Colors.green : null,
                        isGluttenFree ? Colors.green : null),
                    buildInfo("Healthy", isHealthy ? Colors.green : null,
                        isHealthy ? Colors.green : null)
                  ],
                ),
                const SizedBox(height: 20),
                Row(children: [
                  buildInfo("Vegan", isVegan ? Colors.green : null,
                      isVegan ? Colors.green : null),
                  buildInfo("Dairy Free", isDairyFree ? Colors.green : null,
                      isDairyFree ? Colors.green : null),
                  buildInfo("Cheap", isCheap ? Colors.green : null,
                      isCheap ? Colors.green : null)
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                parse(parse(recipe!.results![index!].summary!).body!.text)
                    .documentElement!
                    .text),
          )
        ],
      ),
    );
  }

  Widget buildInfo(String text, dynamic iconColor, dynamic textColor) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.check_mark_circled,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}

class FavouritesOverviewWidget extends StatelessWidget {
  final List? recipe;
  final int? index;

  const FavouritesOverviewWidget({Key? key, this.recipe, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Stack(
              children: [
                Image.network(
                  recipe![index!]["image"],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 200),
                    Column(
                      children: [
                        const Icon(CupertinoIcons.heart),
                        Text(recipe![index!]["aggregateLikes"].toString()),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Icon(CupertinoIcons.clock),
                        Text(recipe![index!]["readyInMinutes"].toString()),
                      ],
                    ),
                    const SizedBox(width: 10, height: 10)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                recipe![index!]["title"],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    buildInfo(
                        "Vegeterian",
                        recipe![index!]["vegeterian"] ? Colors.green : null,
                        recipe![index!]["vegeterian"] ? Colors.green : null),
                    buildInfo(
                        "Gluten Free",
                        recipe![index!]["gluttenFree"] ? Colors.green : null,
                        recipe![index!]["gluttenFree"] ? Colors.green : null),
                    buildInfo(
                        "Healthy",
                        recipe![index!]["healthy"] ? Colors.green : null,
                        recipe![index!]["healthy"] ? Colors.green : null)
                  ],
                ),
                const SizedBox(height: 20),
                Row(children: [
                  buildInfo(
                      "Vegan",
                      recipe![index!]["vegan"] ? Colors.green : null,
                      recipe![index!]["vegan"] ? Colors.green : null),
                  buildInfo(
                      "Dairy Free",
                      recipe![index!]["dairyFree"] ? Colors.green : null,
                      recipe![index!]["dairyFree"] ? Colors.green : null),
                  buildInfo(
                      "Cheap",
                      recipe![index!]["cheap"] ? Colors.green : null,
                      recipe![index!]["cheap"] ? Colors.green : null)
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(recipe![index!]["summary"]),
          )
        ],
      ),
    );
  }

  Widget buildInfo(String text, dynamic iconColor, dynamic textColor) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.check_mark_circled,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}
