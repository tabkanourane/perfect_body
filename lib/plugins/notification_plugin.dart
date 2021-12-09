import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:perfect_body/models/notification_data.dart';

class NotificationPlugin {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationPlugin() {
    _initializeNotifications();
  }
BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(BuildContext context) async{
    this._context = context;
    //-----------------------------| Inicialize local notifications |--------------------------------------
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    return flutterLocalNotificationsPlugin;
    //======================================================================================================
  }
  void _initializeNotifications() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final initializationSettingsAndroid =
        AndroidInitializationSettings('secondary_icon');
    final initializationSettingsIOS = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
      android:initializationSettingsAndroid,
      iOS:initializationSettingsIOS,
    );
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
  }
  // Future onSelectNotification(String payload) async {
  //   showDialog(
  //     context: _context,
  //     builder: (_) {
  //       return new AlertDialog(
  //         title: Text("PayLoad"),
  //         content: Text("Payload : $payload"),
  //       );
  //     },
  //   );
  // }

  Future<void> showWeeklyAtDayAndTime(
      Time time, Day day, int id, String subtitle1, String description) async {
    // final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //   'show weekly channel id',
    //   'show weekly channel name',
    //   'show weekly description',
    // );
    // final iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
      // androidPlatformChannelSpecifics,
      // iOSPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      id,
      subtitle1,
      description,
      day,
      time,
      platformChannelSpecifics,
    );
  }

  Future<void> showDailyAtTime(
      Time time, int id, String subtitle1, String description) async {
    // final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //   'show weekly channel id',
    //   'show weekly channel name',
    //   'show weekly description',
    // );
    // final iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
      // androidPlatformChannelSpecifics,
      // iOSPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      subtitle1,
      description,
      time,
      platformChannelSpecifics,
    );
  }

  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    final pendingNotifications =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return pendingNotifications;
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> scheduleAllNotifications(
      List<NotificationData> notifications) async {
    for (final notification in notifications) {
      await showDailyAtTime(
        Time(notification.hour, notification.minute),
        notification.notificationId,
        notification.subtitle1,
        notification.description,
      );
    }
  }
}