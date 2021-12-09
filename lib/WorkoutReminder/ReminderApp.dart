import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:perfect_body/WorkoutReminder/screens/add_new_medicine/Add_New_Reminder_Workout.dart';
import 'package:perfect_body/WorkoutReminder/screens/add_new_workout_reminder/add_new_workout_reminder.dart';
import 'package:perfect_body/WorkoutReminder/screens/home/home.dart';

class ReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Popins",
          primaryColor: Color.fromRGBO(7, 190, 200, 1),
          textTheme: TextTheme(
              headline1: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 38.0,
                    fontFamily: "Popins",
                  ),
              headline5: ThemeData.light().textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                    fontFamily: "Popins",
                  ),
              headline3: ThemeData.light().textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: "Popins",
                  ))),
      routes: {
        
        "/": (context) => Home(),
        "/add_new_medicine": (context) => AddNewReminderWorkout(),
      },
      initialRoute: "/",
    );
  }
}
