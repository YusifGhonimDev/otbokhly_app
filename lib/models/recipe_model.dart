class RecipeModel {
  List<Results>? results;

  RecipeModel({this.results});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? title;
  String? image;
  String? summary;
  String? sourceUrl;
  int? aggregateLikes;
  int? readyInMinutes;
  bool? vegan;
  bool? vegetarian;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  List<ExtendedIngredients>? extendedIngredients;

  Results({
    this.vegan,
    this.aggregateLikes,
    this.readyInMinutes,
    this.title,
    this.image,
    this.summary,
    this.sourceUrl,
    this.cheap,
    this.dairyFree,
    this.glutenFree,
    this.vegetarian,
    this.veryHealthy,
    this.extendedIngredients,
  });

  Results.fromJson(Map<String, dynamic> json) {
    vegan = json['vegan'];
    aggregateLikes = json['aggregateLikes'];
    readyInMinutes = json['readyInMinutes'];
    title = json['title'];
    image = json['image'];
    summary = json['summary'];
    sourceUrl = json['sourceUrl'];
    cheap = json['cheap'];
    dairyFree = json['dairyFree'];
    glutenFree = json['glutenFree'];
    vegetarian = json['vegetarian'];
    veryHealthy = json['veryHealthy'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = <ExtendedIngredients>[];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients!.add(ExtendedIngredients.fromJson(v));
      });
    }
  }
}

class ExtendedIngredients {
  String? image;
  String? consistency;
  String? originalString;
  String? originalName;
  double? amount;
  String? unit;

  ExtendedIngredients({
    this.image,
    this.consistency,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    consistency = json['consistency'];
    originalString = json['originalString'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
  }
}
