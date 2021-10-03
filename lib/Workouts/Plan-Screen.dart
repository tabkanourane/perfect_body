import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/WorkoutPage/AbsArm.dart';
import 'package:perfect_body/Workouts/WorkoutPage/ButtLeg.dart';
import 'package:perfect_body/Workouts/WorkoutPage/Fitness.dart';
import 'package:perfect_body/Workouts/WorkoutPage/FullBody.dart';

// import 'package:perfect_body/my_flutter_app_icons.dart';
// import 'package:perfect_body/rounded_button.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 150,
              child: Center(
                child: Text(
                  'Choose your workout PLAN ',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 25,
                  child: Text(
                    'choose your best plan and start your fit',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Full Body',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Butt & Leg',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'abs & arm',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            // child: Container(
            //   child: Column(
            //     children: [
            //       RoundedButton(
            //         text: "Full Body",
            //         icon: Icon(MyFlutterApp.body_icon),
            //         press: () => selectedItem(context, 0),
            //       ),
            //       SizedBox(
            //         height: 8,
            //       ),
            //       RoundedButton(
            //         text: "Butt & Leg",
            //         icon: Icon(MyFlutterApp.butt_icon),
            //       ),
            //       SizedBox(
            //         height: 8,
            //       ),
            //       RoundedButton(
            //         text: "abs & arm",
            //         icon: Icon(MyFlutterApp.lose_belly_icon),
            //       ),
            //       SizedBox(
            //         height: 8,
            //       ),
            //     ],
            //   ),
            // ),
          ),
          Container(
              child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fitness()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullBody(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ButtLeg(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AbsArm(),
        ));
        break;
    }
  }
}
