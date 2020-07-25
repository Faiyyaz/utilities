import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//TODO : THIS CALL WILL BE USED ONLY WHEN WE WANT TO SHOW IN APP NOTIFICATIONS
class LocalNotificationManager {
  LocalNotificationManager._();

  factory LocalNotificationManager() => _instance;

  static final LocalNotificationManager _instance =
      LocalNotificationManager._();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );

      InitializationSettings initializationSettings = InitializationSettings(
        initializationSettingsAndroid,
        initializationSettingsIOS,
      );

      _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: onSelectNotification,
      );

      _initialized = true;
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    //TODO : Display a dialog with the notification details, tap ok to go to another page
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      //TODO : DO WHATEVER YOU NEED TO DO WITH PAYLOAD
    }
  }

  //TODO : METHOD TO DISPLAY THE NOTIFICATION
  Future displayNotification(Map<String, dynamic> message) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'fcm_default_channel', 'Clout', 'Notifications',
            importance: Importance.Max,
            priority: Priority.High,
            icon: '@mipmap/ic_launcher');

    IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: jsonEncode(message),
    );
  }
}
