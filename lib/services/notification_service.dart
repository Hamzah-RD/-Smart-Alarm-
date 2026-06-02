import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final  FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();
  static Future init() async {
    const android =AndroidInitializationSettings('@mipmap/ic_launche');
    const settings=InitializationSettings(android: android);
    await _plugin.initialize(settings);
  }
  static Future showAlarmNotification(String title) async {
    const androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _plugin.show(0, title, "Wake up!", details);
  }
}