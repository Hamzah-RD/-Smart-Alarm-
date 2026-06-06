import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/next_alarm_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/alarm_tile.dart';
import '../providers/alarm_provider.dart'; // ⭐ ADDED

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // ⭐ ADDED: PROVIDER CONNECTION
    final alarmProvider = Provider.of<AlarmProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF8FAFC),
              Color(0xffF8FAFC),
            ],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [

                const SizedBox(height: 12),

                const Text(
                  "SUNDAY, 01 JUNE",
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Good Morning, Hamza ☀️",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),

                const SizedBox(height: 20),

                const NextAlarmCard(),

                const SizedBox(height: 20),

                const Row(
                  children: [
                    StatsCard(value: "4", label: "Active", icon: Icons.alarm),
                    StatsCard(value: "12", label: "Done", icon: Icons.check),
                    StatsCard(
                      value: "7",
                      label: "Streak",
                      icon: Icons.local_fire_department,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Alarms",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111827),
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Color(0xff22C55E)),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // ⭐ FIXED: DYNAMIC LIST
                ...alarmProvider.alarms.map((alarm) {
                  return AlarmTile(
                    time: alarm.time.format(context),
                    title: alarm.label,
                    active: alarm.isActive,

                    // ⭐ CONNECTED ACTIONS
                    onToggle: () {
                      alarmProvider.toggleAlarm(alarm.id);
                    },

                    onDelete: () {
                      alarmProvider.deleteAlarm(alarm.id);
                    },
                  );
                }).toList(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}