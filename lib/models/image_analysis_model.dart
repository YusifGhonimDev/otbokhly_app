class ImageAnalysisModel {
  Nutrition? nutrition;
  Category? category;
  List<Recipes>? recipes;

  ImageAnalysisModel({this.nutrition, this.category, this.recipes});

  ImageAnalysisModel.fromJson(Map<String, dynamic> json) {
    nutrition = json['nutrition'] != null
        ? Nutrition.fromJson(json['nutrition'])
        : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
  }
}

class Nutrition {
  Calories? calories;
  Calories? fat;
  Calories? protein;
  Calories? carbs;

  Nutrition({this.calories, this.fat, this.protein, this.carbs});

  Nutrition.fromJson(Map<String, dynamic> json) {
    calories =
        json['calories'] != null ? Calories.fromJson(json['calories']) : null;
    fat = json['fat'] != null ? Calories.fromJson(json['fat']) : null;
    protein =
        json['protein'] != null ? Calories.fromJson(json['protein']) : null;
    carbs = json['carbs'] != null ? Calories.fromJson(json['carbs']) : null;
  }
}

class Calories {
  num? value;
  String? unit;

  Calories({this.value, this.unit});

  Calories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }
}

class Category {
  String? name;
  num? probability;

  Category({this.name, this.probability});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    probability = json['probability'];
  }
}

class Recipes {
  num? id;
  String? title;
  String? imageType;
  String? url;

  Recipes({this.id, this.title, this.imageType, this.url});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageType = json['imageType'];
    url = json['url'];
  }
}
