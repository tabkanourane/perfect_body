import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:perfect_body/WorkoutReminder/models/pill.dart';
import 'workout_reminder_card.dart';

class WorkoutReminderList extends StatelessWidget {
  final List<Pill> listOfMedicines;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  WorkoutReminderList(
      this.listOfMedicines, this.setData, this.flutterLocalNotificationsPlugin);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => WorkoutReminderCard(
          listOfMedicines[index], setData, flutterLocalNotificationsPlugin),
      itemCount: listOfMedicines.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
