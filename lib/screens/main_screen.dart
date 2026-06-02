import 'package:flutter/material.dart';
import 'package:smart_alarm_app/screens/stopwatch_screen.dart';
import 'home_screen.dart';
import 'activity_screen.dart';
import 'world_clock_screen.dart';
import '../widgets/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ActivityScreen(),
    StopwatchScreen(),
    WorldClockScreen(),
  ];

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}