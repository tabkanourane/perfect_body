import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/NavigationDrawer/NavigationDrawerWidget.dart';
import 'package:perfect_body/WaterTrack/homepage.dart';
import 'package:perfect_body/Workouts/WorkoutPage/AbsArm.dart';
import 'package:perfect_body/Workouts/WorkoutPage/ButtLeg.dart';
import 'package:perfect_body/Workouts/WorkoutPage/Fitness.dart';
import 'package:perfect_body/Workouts/page/home_page_FullBody.dart';

class FullBody extends StatefulWidget {
  @override
  _FullBodyState createState() => _FullBodyState();
}

class _FullBodyState extends State<FullBody> {
  // final couleur = const HexColor.from( 149, 194, 222,0);
  final List<String> _listItem = [
    'assets/ButtLeg.jpg',
    'assets/AbsArm.jpg',
    'assets/fitness.jpg',
  ];
  final List<String> _listItemNames = [
    'Butt & leg',
    'abs & arm',
    'Lose Weight & keep fit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Lose Weight",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.teal, size: 30),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/FullBody.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Full Body",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Positioned(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageFullBody()),
                            );
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.teal),
                            child: Center(
                              child: Text(
                                'Day 1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.2, 5.4, 4.2, 0),
                    child: Image.asset(
                      'assets/time-background-concept-vintage-classic-alarm-clock-yellow-empty-management-comcept-174343445.jpg',
                      // height: 500,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Text(
                          "2-7 min fast workout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Not enough time? \n 2-7 minutes to do anything anywhere",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                      ],
                    ),
                    bottom: 30,
                    left: -75,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Expanded(
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map(
                      (item) => InkWell(
                        onTap: () {
                          switch (item) {
                            case 'assets/ButtLeg.jpg':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ButtLeg()),
                              );
                              break;
                            case 'assets/AbsArm.jpg':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AbsArm()),
                              );
                              break;
                            case 'assets/fitness.jpg':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fitness()),
                              );
                              break;
                            default:
                          }
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(item), fit: BoxFit.cover),
                            ),
                            child: Transform.translate(
                              offset: Offset(20, -50),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 63),
                                child: Text(
                                  _listItemNames[_listItem.indexOf(item)],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(149, 194, 222, 70),
                  // image: DecorationImage(
                  //     image: AssetImage('assets/AbsArm.jpg'),
                  //     fit: BoxFit.cover),
                ),
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     gradient:
                  //         LinearGradient(begin: Alignment.bottomRight, colors: [
                  //       Colors.black.withOpacity(.4),
                  //       Colors.black.withOpacity(.2),
                  //     ])),
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Positioned(
                        child: Column(
                          children: [
                            Text(
                              "Water Tracker",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Water is the fuel of the \nmuscles",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        top: 10,
                        right: 60,
                        width: MediaQuery.of(context).size.width,
                        // height: 30,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Positioned(
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage('assets/waterReminder.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        //   child: Center(
                        //     child: Text(
                        //       'Day 1',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20),
                        //     ),
                        //   ),
                        left: 230,
                        top: 10,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Positioned(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 130,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.teal),
                            child: Center(
                              child: Text(
                                'Drink',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        bottom: 20,
                        left: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
