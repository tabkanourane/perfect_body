import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:perfect_body/burned_calories/model/user.dart';
import 'package:perfect_body/burned_calories/screens/mealpage/macrostile.dart';
import 'package:perfect_body/burned_calories/screens/mealpage/meallist.dart';
import 'package:perfect_body/burned_calories/services/database.dart';
import 'package:provider/provider.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key key}) : super(key: key);

  @override
  _MealPage createState() => _MealPage();
}

class _MealPage extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var tracker = Provider.of<Tracker>(context);

    Widget loading() {
      if (tracker != null) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(flex: 1, child: MacroTile()),
              Expanded(flex: 2, child: MealList())
            ],
          ),
        );
      } else {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CircularProgressIndicator(),
        );
      }
    }

    return StreamProvider<Tracker>.value(
      value: DatabaseService(uid: user.uid).tracker,
      child: loading(),
    );
  }
}
