import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otbokhly_app/database/database.dart';
import 'package:otbokhly_app/models/recipe_model.dart';
import 'package:otbokhly_app/screens/details_screen.dart';
import 'package:otbokhly_app/widgets/loading_widget.dart';
import 'package:otbokhly_app/widgets/recipes/recipes_widget.dart';

class FavouritesScreen extends StatefulWidget {
  final RecipeModel? recipe;
  final int? index;

  const FavouritesScreen({Key? key, this.recipe, this.index}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final Database _db = Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.orange),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AlertDialog(
                        title: const Text("Delete Favourite Recipes"),
                        content: const Text(
                            "Are you sure that you want to delete your favourite recipes?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _db.deleteFavourites();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Recipes deleted!")));
                              });
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(CupertinoIcons.trash),
          )
        ],
        title: const Text(
          "Favourites",
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([_db.getUsername(), _db.getFavList()]),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const LoadingWidget();
          } else {
            return Column(
              children: [
                const SizedBox(height: 10),
                Text("${snapshot.data[0]}'s favourite recipes.",
                    style: GoogleFonts.architectsDaughter(fontSize: 20)),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data[1].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavouriteDetailsScreen(
                                  recipe: snapshot.data[1],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: RecipesWidget(
                            image: snapshot.data[1][index]["image"],
                            aggregateLikes: snapshot.data[1][index]
                                ["aggregateLikes"],
                            readyInMinutes: snapshot.data[1][index]
                                ["readyInMinutes"],
                            summary: snapshot.data[1][index]["summary"],
                            title: snapshot.data[1][index]["title"],
                            vegan: snapshot.data[1][index]["vegan"],
                          ),
                        );
                      }),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
