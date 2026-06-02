import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AlarmProvider extends ChangeNotifier {
  final Box box = Hive.box('alarms');

  List get alarms => box.values.toList();

  void addAlarm(Map alarm) {
    box.put(alarm['id'], alarm);
    notifyListeners();
  }

  void deleteAlarm(String id) {
    box.delete(id);
    notifyListeners();
  }

  void toggleAlarm(String id, bool value) {
    final alarm = Map.from(box.get(id));
    alarm['isEnabled'] = value;
    box.put(id, alarm);
    notifyListeners();
  }
}