import 'package:flutter/material.dart';
import '../models/alarm_model.dart'; // ⭐ IMPORT ONLY
import '../services/notification_service.dart';

class AlarmProvider extends ChangeNotifier {
  final List<AlarmModel> _alarms = [];

  List<AlarmModel> get alarms => _alarms;

  void addAlarm(AlarmModel alarm) {
    _alarms.add(alarm);
    NotificationService.scheduleAlarm(
      id: alarm.id.hashCode,
      dateTime: alarm.getDateTime(),
      title: alarm.label,
    );
    notifyListeners();
  }

  void toggleAlarm(String id) {
    final index = _alarms.indexWhere((a) => a.id == id);
    if (index != -1) {
      _alarms[index].isActive = !_alarms[index].isActive;
      notifyListeners();
    }
  }

  void deleteAlarm(String id) {
    final alarm = _alarms.firstWhere((a) => a.id == id);

    NotificationService.cancel(alarm.id.hashCode); // ⭐ CANCEL NOTIFICATION

    _alarms.removeWhere((a) => a.id == id);
    notifyListeners();
  }
}