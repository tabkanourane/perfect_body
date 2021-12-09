// model that represents a nutrient with a name, its value per serving of food
// and what unit it is measured in. Ex. Nutrient("Carbohydrates", 10, "g");
class Nutrient {
  final String name;
  final double val;
  final String measurement;

  Nutrient(this.name, this.val, this.measurement);
}
