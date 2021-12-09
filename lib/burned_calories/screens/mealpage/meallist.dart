import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_body/burned_calories/model/mealmodel.dart';
import 'package:perfect_body/burned_calories/model/tracked_food.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:perfect_body/burned_calories/model/user.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:perfect_body/burned_calories/screens/search/search.dart';
import 'package:perfect_body/burned_calories/services/database.dart';
import 'package:provider/provider.dart';

class MealList extends StatefulWidget {
  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    var tracker = Provider.of<Tracker>(context);
    if (tracker != null) {
      var meals = orderMeals(tracker.mealsList);
      return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var currentMeal = meals[index];
              return generateMeal(currentMeal, index);
            },
            itemCount: meals.length),
      );
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  List<MealModel> orderMeals(List<MealModel> meals) {
    List<MealModel> orderedmeals = [null, null, null];
    for (var i = 0; i < meals.length; i++) {
      if (meals[i].mealName == "breakfast") {
        orderedmeals[0] = meals[i];
      } else if (meals[i].mealName == "lunch") {
        orderedmeals[1] = meals[i];
      } else {
        orderedmeals[2] = meals[i];
      }
    }
    return orderedmeals;
  }

  Widget foodtiles(MealModel currentMeal) {
    var widgets = <Widget>[];

    for (var i = 0; i < currentMeal.foods.length; i++) {
      TrackedFood food = currentMeal.foods[i];
      Widget foodTile = InkWell(
        onTap: () {},
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      food.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            food.carbohydrates + "C",
                            style:
                                TextStyle(fontFamily: "OpenSans", fontSize: 10),
                          ),
                          Text(
                            food.protein + "P",
                            style:
                                TextStyle(fontFamily: "OpenSans", fontSize: 10),
                          ),
                          Text(
                            food.fat + "F",
                            style:
                                TextStyle(fontFamily: "OpenSans", fontSize: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Pressed");
                              List<TrackedFood> foodToDelete = [food];
                              var user = Provider.of<User>(context);
                              var db = DatabaseService(uid: user.uid);
                              db.deleteAFood(
                                  foodToDelete, currentMeal.mealName);
                            },
                            child: Icon(
                              Icons.delete,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      food.serving + " " + food.unit,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: "OpenSans", fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      widgets.add(foodTile);
    }
    return Column(
      children: widgets,
    );
  }

  Widget generateMeal(MealModel currentMeal, int index) {
    var user = Provider.of<User>(context);
    var children2 = <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30.0) //
                    ),
              ),
              child: Text(
                currentMeal.mealName.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "OpenSans", color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StreamProvider<Tracker>.value(
                        value: DatabaseService(uid: user.uid).tracker,
                        child: CustomNavigator(
                          home: Search(
                            currentMeal.mealName,
                          ),
                          pageRoute: PageRoutes.materialPageRoute,
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      boxOutline(currentMeal),
    ];
    return StreamProvider<Tracker>.value(
      value: DatabaseService(uid: user.uid).tracker,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children2,
      ),
    );
  }

  Widget boxOutline(MealModel currentMeal) {
    if (currentMeal.foods.length == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          width: 0,
          height: 0,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0) //
              ),
        ),
        child: foodtiles(currentMeal),
      );
    }
  }
}
