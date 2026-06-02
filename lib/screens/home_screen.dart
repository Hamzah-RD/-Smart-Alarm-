import 'package:flutter/material.dart';
import '../widgets/next_alarm_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/alarm_tile.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      // ⭐ MODERN SOFT BACKGROUND
     // bottomNavigationBar: const BottomNav(),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xff22C55E),
      //   child: const Icon(Icons.add),
      //   onPressed: () {},
      // ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF8FAFC), // light top
              Color(0xffF1F5F9), // soft bottom
            ],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: const [

                SizedBox(height: 12),

                // HEADER
                Text(
                  "SUNDAY, 01 JUNE",
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    letterSpacing: 1,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Good Morning, Hamza ☀️",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),

                SizedBox(height: 20),

                // NEXT ALARM CARD
                NextAlarmCard(),

                SizedBox(height: 20),

                // STATS ROW
                Row(
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

                SizedBox(height: 25),

                // SECTION TITLE
                Row(
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

                SizedBox(height: 15),

                // LIST
                AlarmTile(
                  time: "07:00",
                  title: "Morning Workout",
                  active: true,
                ),
                AlarmTile(
                  time: "08:30",
                  title: "Office Reminder",
                  active: true,
                ),
                AlarmTile(
                  time: "22:00",
                  title: "Sleep Time",
                  active: false,
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}