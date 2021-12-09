import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/burned_calories/screens/stats/calories_graph.dart';
import 'package:perfect_body/burned_calories/screens/stats/carbs_graph.dart';
import 'package:perfect_body/burned_calories/screens/stats/fat_graph.dart';
import 'package:perfect_body/burned_calories/screens/stats/protein_graph.dart';
import 'package:perfect_body/burned_calories/screens/stats/weight_graph.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final weekDays = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  var currentDate = DateTime.now().day.toString() +
      "/" +
      DateTime.now().month.toString() +
      "/" +
      DateTime.now().year.toString();

  _incrementDateBackOne() {}

  _incrementDateForwardOne() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nutrition Stats",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CaloriesGraph(),
              CarbsGraph(),
              ProteinGraph(),
              FatGraph(),
              WeightGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
