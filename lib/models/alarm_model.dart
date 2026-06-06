import 'package:flutter/material.dart';

class AlarmModel {
  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
  }
  String id;
  TimeOfDay time;
  String label;
  bool isActive;

  bool mathChallenge;
  bool photoChallenge;
  bool selfieChallenge;

  AlarmModel({
    required this.id,
    required this.time,
    required this.label,
    this.isActive = true,
    this.mathChallenge = false,
    this.photoChallenge = false,
    this.selfieChallenge = false,
  });
}