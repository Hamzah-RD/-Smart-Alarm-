import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'activity_screen.dart';
import 'stopwatch_screen.dart';
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
      extendBody: true, //  IMPORTANT for modern floating nav look

      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: SafeArea(
        child: BottomNav(
          currentIndex: currentIndex,
          onTap: onTabChanged,
        ),
      ),
    );
  }
}