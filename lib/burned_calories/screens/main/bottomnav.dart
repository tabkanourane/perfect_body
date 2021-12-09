import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:perfect_body/burned_calories/model/user.dart';
import 'package:perfect_body/burned_calories/screens/mealpage/mealpage.dart';
import 'package:perfect_body/burned_calories/screens/settings/settings.dart';
import 'package:perfect_body/burned_calories/screens/stats/statspage.dart';
import 'package:perfect_body/burned_calories/services/database.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    StatsPage(),
    MealPage(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return MultiProvider(
      providers: [
        StreamProvider<Tracker>.value(
          value: DatabaseService(uid: user.uid).tracker,
        ),
      ],
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height / 10.5,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.multiline_chart),
                title: Text(
                  "Stats",
                  style: TextStyle(fontFamily: "OpenSans", fontSize: 10),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(fontFamily: "OpenSans", fontSize: 10),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(fontFamily: "OpenSans", fontSize: 10),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
