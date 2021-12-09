import 'package:json_annotation/json_annotation.dart';

part 'tracked_food.g.dart';

@JsonSerializable()
class TrackedFood {
  // TODO: could make nutrient class
  final String name;
  // final double _calories;
  final String carbohydrates;
  final String protein;
  final String fat;
  // final double _calcium;
  // final double _fiber;
  // final double _cholesterol;
  // final double _iron;
  // final double _potassium;
  // final double _sodium;
  // final double _vitaminA;
  // final double _vitaminC;
  String unit;
  String serving;

  TrackedFood(
      this.name,
      // this._calories,
      this.carbohydrates,
      this.protein,
      this.fat,
      // this._calcium,
      // this._fiber,
      // this._cholesterol,
      // this._iron,
      // this._potassium,
      // this._sodium,
      // this._vitaminA,
      // this._vitaminC,
      this.serving,
      this.unit);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      "serving": serving,
      "unit": unit,
      // 'calories': _calories,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      // 'calcium': _calcium,
      // 'fiber': _fiber,
      // 'cholesterol': _cholesterol,
      // 'iron': _iron,
      // 'potassium': _potassium,
      // 'sodium': _sodium,
      // 'vitaminA': _vitaminA,
      // 'vitaminC': _vitaminC,
    };
  }

  String calculateCalories() {
    return ((((double.parse(carbohydrates) + double.parse(protein)) * 4) +
            (double.parse(fat) * 9)))
        .round()
        .toString();
  }

  // has the values: servingSize, servingSizeUnit, brandedFoodCategory, labelNutrients
  factory TrackedFood.fromFDCJsonfoodNutrients(Map<String, dynamic> json) {
    // var name;
    // var serving;
    // var unit;
    var carbs;
    var protein;
    var fat;
    // var calcium;
    // var fiber;
    // var cholesterol;
    // var iron;
    // var potassium;
    // var sodium;
    // var vitaminA;
    // var vitaminC;

    List foodNutrients = json['foodNutrients'];
    int count = 3;
    for (int i = 0; i < foodNutrients.length; i++) {
      if (count > 0) {
        switch (foodNutrients[i]['name']) {
          case "Total lipid (fat)":
            fat = foodNutrients[i]['amount'];
            count = count - 1;
            break;
          case 'Carbohydrate, by difference':
            carbs = foodNutrients[i]['amount'];
            count = count - 1;
            break;
          case 'Protein':
            protein = foodNutrients[i]['amount'];
            count = count - 1;
            break;
        }
      } else {
        break;
      }
    }

    return TrackedFood(
        // name
        json['description'].toString() +
            "," +
            (json.containsKey('brandOwner') ? '' : json['brandOwner']),
        // serving
        '1',
        // servingSizeUnit
        'serving',
        // carbohydrates
        carbs == null ? 0 : carbs,
        // protein
        protein == null ? 0 : protein,
        // fat
        fat == null ? 0 : fat);
  }

  // has the values: servingSize, servingSizeUnit, brandedFoodCategory, labelNutrients
  factory TrackedFood.fromFDCJsonLabelNutrients(Map<String, dynamic> json) {
    return TrackedFood(
        // name
        json['name'].toString() + json['brandedFoodCategory'].toString(),
        // serving
        json['servingSize'],
        // servingSizeUnit
        json['servingSizeUnit'],
        // carbohydrates
        json['labelNutrients']['carbohydrates']['value'],
        // protein
        json['labelNutrients']['protein']['value'],
        // fat
        json['labelNutrients']['fat']['value']);
  }

  // should have values: foodPortions
  getServing(TrackedFood food, Map<String, dynamic> json) {
    food.serving = json['foodPortions'][0]['gramWeight'];
    food.unit = 'g';
  }

  factory TrackedFood.fromJson(Map<String, dynamic> json) =>
      _$TrackedFoodFromJson(json);

  Map<dynamic, dynamic> toJson() => _$TrackedFoodToJson(this);
}
