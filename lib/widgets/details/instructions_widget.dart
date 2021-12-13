import 'package:flutter/material.dart';
import 'package:otbokhly_app/models/recipe_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstructionsWidget extends StatelessWidget {
  final RecipeModel? recipe;
  final int? index;

  const InstructionsWidget({Key? key, this.recipe, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: recipe!.results![index!].sourceUrl!,
    );
  }
}

class FavouritesInstructionsWidget extends StatelessWidget {
  final List? instructions;
  final int? index;

  const FavouritesInstructionsWidget({Key? key, this.instructions, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: instructions![index!]["sourceUrl"],
    );
  }
}

class RecommendedInstructionsWidget extends StatelessWidget {
  final String? url;

  const RecommendedInstructionsWidget({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Instructions",
          style: TextStyle(color: Colors.orange),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
