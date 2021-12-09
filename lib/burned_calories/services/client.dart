import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodClient {
  var url =
      "https://api.nal.usda.gov/fdc/v1/foods/list?api_key=OwOopadFaacSp65Vps9UTkNTWlVUXOFFMOy6jgsf";

  foodQueryForId(String food) async {
    List<dynamic> listOfFdcids;
    List<dynamic> listOfNames;
    url = url + '&query=' + food + "&pageSize=10";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      listOfFdcids =
          json.decode(response.body).map((val) => extractFdcids(val)).toList();
      listOfNames = json
          .decode(response.body)
          .map((val) => extractDescriptionName(val))
          .toList();
    } else {
      throw Exception("Please try again");
    }
    // Future<List<int>>
    Map<dynamic, dynamic> nameIds =
        new Map.fromIterables(listOfNames, listOfFdcids);
    print(nameIds);
  }

  foodQueryWithId(int fcdid) async {
    url = 'https://api.nal.usda.gov/fdc/v1/food/' +
        fcdid.toString() +
        '?api_key=OwOopadFaacSp65Vps9UTkNTWlVUXOFFMOy6jgsf';
    var response = await http.get(url);
    // Future<List<int>>
    if (response.statusCode == 200) {
      print(response.body);
      // return TrackedFood.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to retrieve foods");
    }
  }

  String extractDescriptionName(Map<String, dynamic> rawJson) {
    var description =
        rawJson.containsKey('description') ? rawJson['description'] : '';
    description = description + rawJson.containsKey('brandOwner')
        ? rawJson['brandOwner']
        : '';
    return description;
  }

  int extractFdcids(Map<String, dynamic> rawJson) {
    return rawJson.containsKey('fdcId') ? rawJson['fdcId'] : '000';
  }
}
