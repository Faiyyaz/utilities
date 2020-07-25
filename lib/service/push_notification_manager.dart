import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' as platform;

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      //TODO : Requesting notification permission here
      if (platform.Platform.isIOS) {
        _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(),
        );
      }
      _firebaseMessaging.autoInitEnabled();
      _initialized = true;
    }
  }

  Future<void> firebaseConfigure({
    onMessage: Function,
    onLaunch: Function,
    onResume: Function,
  }) async {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        onMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        onLaunch(message);
      },
      onResume: (Map<String, dynamic> message) async {
        onResume(message);
      },
    );
  }

  Future<String> getFirebaseToken() {
    return _firebaseMessaging.getToken();
  }

  Future<bool> clearInstance() async {
    bool isCleared = await _firebaseMessaging.deleteInstanceID();
    return isCleared;
  }
}
