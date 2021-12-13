import 'package:dio/dio.dart';
import 'package:otbokhly_app/constants/constants.dart';
import 'package:otbokhly_app/helpers/diet_filter.dart';
import 'package:otbokhly_app/helpers/dish_filter.dart';
import 'package:otbokhly_app/helpers/meal_filter.dart';

class SpoonacularAPI {
  Future getRecipes(String query) async {
    String mealType = "";
    String dietType = "";
    String dishType = "";
    if (mainCourse) {
      mealType = "main course";
    } else if (sideDish) {
      mealType = "side dish";
    } else if (dessert) {
      mealType = "dessert";
    } else if (appetizer) {
      mealType = "appetizer";
    } else if (salad) {
      mealType = "salad";
    } else if (bread) {
      mealType = "bread";
    } else if (breakfast) {
      mealType = "breakfast";
    } else if (soup) {
      mealType = "soup";
    } else if (beverage) {
      mealType = "beverage";
    } else if (sauce) {
      mealType = "sauce";
    } else if (marinade) {
      mealType = "marinade";
    } else if (fingerfood) {
      mealType = "fingerfood";
    } else if (snack) {
      mealType = "snack";
    } else if (drink) {
      mealType = "drink";
    }
    if (glutenFree) {
      dietType = "gluten free";
    } else if (ketoGenic) {
      dietType = "ketogenic";
    } else if (vegeterian) {
      dietType = "vegeterian";
    } else if (lactoVegeterian) {
      dietType = "lacto vegeterian";
    } else if (ovoVegeterian) {
      dietType = "ovo vegeterian";
    } else if (vegan) {
      dietType = "vegan";
    } else if (pescetarian) {
      dietType = "pescetarian";
    } else if (paleo) {
      dietType = "paleo";
    } else if (primal) {
      dietType = "primal";
    } else if (lowFODMAP) {
      dietType = "low fodmap";
    } else if (whole30) {
      dietType = "whole30";
    }
    if (african) {
      dishType = "african";
    } else if (american) {
      dishType = "american";
    } else if (british) {
      dishType = "british";
    } else if (cajun) {
      dishType = "cajun";
    } else if (caribbean) {
      dishType = "caribbean";
    } else if (chinese) {
      dishType = "chinese";
    } else if (easternEuropean) {
      dishType = "eastern european";
    } else if (european) {
      dishType = "european";
    } else if (french) {
      dishType = "french";
    } else if (german) {
      dishType = "german";
    } else if (greek) {
      dishType = "greek";
    } else if (indian) {
      dishType = "indian";
    } else if (irish) {
      dishType = "irish";
    } else if (italian) {
      dishType = "italian";
    } else if (japanese) {
      dishType = "japanese";
    } else if (jewish) {
      dishType = "jewish";
    } else if (korean) {
      dishType = "korean";
    } else if (latinAmerican) {
      dishType = "latin american";
    } else if (mediterranean) {
      dishType = "mediterranean";
    } else if (mexican) {
      dishType = "mexican";
    } else if (middleEastern) {
      dishType = "middle eastern";
    } else if (nordic) {
      dishType = "nordic";
    } else if (southern) {
      dishType = "southern";
    } else if (spanish) {
      dishType = "spanish";
    } else if (thai) {
      dishType = "thai";
    } else if (vietnamese) {
      dishType = "vietnamese";
    }
    Response response = await Dio().get(
        "$apiEndPoint/recipes/complexSearch?apiKey=$apiKey&addRecipeInformation=true&fillIngredients=true&type=$mealType&diet=$dietType&cuisine=$dishType&query=$query");
    return response.data;
  }

  Future analyzeImage(url) async {
    Response response = await Dio()
        .get("$apiEndPoint/food/images/analyze?apiKey=$apiKey&imageUrl=$url");
    return response.data;
  }
}
