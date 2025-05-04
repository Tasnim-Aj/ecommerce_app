import 'package:dio/dio.dart';

import '../model/meal_model.dart';

class MealService {
  Dio dio = Dio();
  String baseUrl =
      "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian";
  late Response response;

  Future<List<MealModel>> getAll() async {
    try {
      response = await dio.get(baseUrl);
      List<MealModel> meals = [];
      for (int i = 0; i < response.data['meals'].length; i++) {
        meals.add(MealModel.fromMap(response.data['meals'][i]));
      }
      print(meals);
      return meals;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
