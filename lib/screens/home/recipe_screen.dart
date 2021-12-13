import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otbokhly_app/models/recipe_model.dart';
import 'package:otbokhly_app/screens/details_screen.dart';
import 'package:otbokhly_app/screens/home/favourites_screen.dart';
import 'package:otbokhly_app/screens/home/food_analyzer_screen.dart';
import 'package:otbokhly_app/services/authentication_service.dart';
import 'package:otbokhly_app/api/spoonacular_api.dart';
import 'package:html/parser.dart';
import 'package:otbokhly_app/widgets/loading_widget.dart';
import 'package:otbokhly_app/widgets/recipes/filters_widget.dart';
import 'package:otbokhly_app/widgets/recipes/recipes_widget.dart';
import '../registration/login_screen.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const RecipeScreen(),
    const FavouritesScreen(),
    const FoodAnalyzerScreen(),
  ];
  bool _isSearching = false;
  final TextEditingController _controller = TextEditingController();

  int _numberOfRecipes(snapshot) {
    return RecipeModel.fromJson(snapshot.data).results!.length;
  }

  String _image(snapshot, index) {
    return RecipeModel.fromJson(snapshot.data).results![index].image!;
  }

  String _title(snapshot, index) {
    return RecipeModel.fromJson(snapshot.data).results![index].title!;
  }

  String _summary(snapshot, index) {
    return parse(
            parse(RecipeModel.fromJson(snapshot.data).results![index].summary!)
                .body!
                .text)
        .documentElement!
        .text;
  }

  int _aggregateLikes(snapshot, index) {
    return RecipeModel.fromJson(snapshot.data).results![index].aggregateLikes!;
  }

  int _readyInMinutes(snapshot, index) {
    return RecipeModel.fromJson(snapshot.data).results![index].readyInMinutes!;
  }

  bool _vegan(snapshot, index) {
    return RecipeModel.fromJson(snapshot.data).results![index].vegan!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 0
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.orange),
              actions: [
                InkWell(
                  child: _isSearching
                      ? const Icon(Icons.cancel)
                      : const Icon(Icons.search),
                  onTap: () => setState(() => _isSearching = !_isSearching),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: TextButton(
                        child: const Text(
                          "Sign Out",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          await AuthenticationServices().logoutUser();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Signed out!")));
                        },
                      ),
                    ),
                  ],
                ),
              ],
              title: _isSearching
                  ? TextField(
                      style: const TextStyle(color: Colors.orange),
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Search Recipes",
                        icon: InkWell(
                          child: const Icon(
                            Icons.search,
                            color: Colors.orange,
                          ),
                          onTap: () => setState(() {}),
                        ),
                      ),
                    )
                  : const Text(
                      "Recipes",
                      style: TextStyle(color: Colors.orange),
                    ),
            ),
      body: _currentIndex != 0
          ? _screens[_currentIndex]
          : FutureBuilder(
              future: SpoonacularAPI().getRecipes(_controller.text),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const LoadingWidget();
                }

                return ListView.builder(
                    itemCount: _numberOfRecipes(snapshot),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        recipe:
                                            RecipeModel.fromJson(snapshot.data),
                                        index: index,
                                        ingredients: snapshot.data,
                                      )));
                        },
                        child: RecipesWidget(
                            image: _image(snapshot, index),
                            title: _title(snapshot, index),
                            summary: _summary(snapshot, index),
                            aggregateLikes: _aggregateLikes(snapshot, index),
                            readyInMinutes: _readyInMinutes(snapshot, index),
                            vegan: _vegan(snapshot, index)),
                      );
                    });
              }),
      floatingActionButton: _currentIndex != 0
          ? null
          : FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return FiltersWidget(context: context);
                    });
              },
              backgroundColor: Colors.orange,
              child: const Icon(
                Icons.restaurant,
                color: Colors.white,
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: "Recipes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Food Analyzer",
          ),
        ],
      ),
    );
  }
}
