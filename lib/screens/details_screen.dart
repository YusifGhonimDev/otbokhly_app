import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:otbokhly_app/database/database.dart';
import 'package:otbokhly_app/models/recipe_model.dart';
import 'package:otbokhly_app/widgets/details/ingredients_widget.dart';
import 'package:otbokhly_app/widgets/details/instructions_widget.dart';
import 'package:otbokhly_app/widgets/details/overview_widget.dart';

class DetailsScreen extends StatefulWidget {
  final RecipeModel? recipe;
  final int? index;
  final dynamic ingredients;

  const DetailsScreen({Key? key, this.recipe, this.index, this.ingredients})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Database _db = Database();
  final List<Map<String, dynamic>>? _favRecipes = [];
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.orange),
          title: const Text(
            "Details",
            style: TextStyle(color: Colors.orange),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.star,
                color: _isPressed ? Colors.yellow : null,
              ),
              onPressed: () {
                setState(() {
                  _favRecipes!.add({
                    "sourceUrl":
                        widget.recipe!.results![widget.index!].sourceUrl,
                    "image": widget.recipe!.results![widget.index!].image,
                    "title": widget.recipe!.results![widget.index!].title,
                    "summary": parse(parse(
                                widget.recipe!.results![widget.index!].summary!)
                            .body!
                            .text)
                        .documentElement!
                        .text,
                    "aggregateLikes":
                        widget.recipe!.results![widget.index!].aggregateLikes,
                    "readyInMinutes":
                        widget.recipe!.results![widget.index!].readyInMinutes,
                    "vegan": widget.recipe!.results![widget.index!].vegan,
                    "vegeterian":
                        widget.recipe!.results![widget.index!].vegetarian,
                    "gluttenFree":
                        widget.recipe!.results![widget.index!].glutenFree,
                    "healthy":
                        widget.recipe!.results![widget.index!].veryHealthy,
                    "dairyFree":
                        widget.recipe!.results![widget.index!].dairyFree,
                    "cheap": widget.recipe!.results![widget.index!].cheap,
                    "ingredients": widget.ingredients["results"][widget.index]
                        ["extendedIngredients"]
                  });
                  _db.addFavourites(_favRecipes);
                  _isPressed = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to favourites!")));
                });
              },
            ),
            const SizedBox(width: 15)
          ],
          bottom: const TabBar(
            labelColor: Colors.orange,
            tabs: [
              Tab(text: "Overview"),
              Tab(text: "Ingredients"),
              Tab(text: "Instructions"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewWidget(recipe: widget.recipe, index: widget.index),
            IngredientsWidget(recipe: widget.recipe, index: widget.index),
            InstructionsWidget(recipe: widget.recipe, index: widget.index)
          ],
        ),
      ),
    );
  }
}

class FavouriteDetailsScreen extends StatefulWidget {
  final List? recipe;
  final int? index;

  const FavouriteDetailsScreen({Key? key, this.recipe, this.index})
      : super(key: key);

  @override
  State<FavouriteDetailsScreen> createState() => _FavouriteDetailsScreenState();
}

class _FavouriteDetailsScreenState extends State<FavouriteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.orange),
          backgroundColor: Colors.white,
          actions: const [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            SizedBox(width: 15)
          ],
          elevation: 0,
          title: const Text(
            "Details",
            style: TextStyle(color: Colors.orange),
          ),
          bottom: const TabBar(
            labelColor: Colors.orange,
            tabs: [
              Tab(text: "Overview"),
              Tab(text: "Ingredients"),
              Tab(text: "Instructions"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FavouritesOverviewWidget(
                recipe: widget.recipe, index: widget.index),
            FavouritesIngredientsWidget(
                ingredients: widget.recipe, index: widget.index),
            FavouritesInstructionsWidget(
                instructions: widget.recipe, index: widget.index)
          ],
        ),
      ),
    );
  }
}
