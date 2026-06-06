import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

  static Future init() async {
    tzdata.initializeTimeZones(); // ⭐ IMPORTANT

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(android: android);

    await _plugin.initialize(settings);
  }

  // ⭐ SCHEDULE ALARM
  static Future scheduleAlarm({
    required int id,
    required DateTime dateTime,
    required String title,
  }) async {
    await _plugin.zonedSchedule(
      id,
      title,
      "Wake up! Your alarm is ringing 🔔",
      tz.TZDateTime.from(dateTime, tz.local),

      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Alarms',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),

      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,

      matchDateTimeComponents: null,
    );
  }

  static Future cancel(int id) async {
    await _plugin.cancel(id);
  }
}