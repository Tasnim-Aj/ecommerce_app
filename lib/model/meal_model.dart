class MealModel {
  String strMeal;
  String strMealThumb;
  String idMeal;

  MealModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  static MealModel fromMap(Map<String, dynamic> map) {
    return MealModel(
      strMeal: map['strMeal'],
      strMealThumb: map['strMealThumb'],
      idMeal: map['idMeal'],
    );
  }

  toMap() {
    return {
      "strMeal": strMeal,
      "strMealThumb": strMealThumb,
      "idMeal": idMeal,
    };
  }
}
