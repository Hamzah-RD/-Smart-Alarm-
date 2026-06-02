import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Activity",
          style: TextStyle(color: textPrimary),
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ⭐ SUMMARY CARDS
          Row(
            children: [

              _buildCard("Done", "12", Icons.check_circle),
              const SizedBox(width: 10),
              _buildCard("Missed", "3", Icons.cancel),
              const SizedBox(width: 10),
              _buildCard("Streak", "7", Icons.local_fire_department),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),

          const SizedBox(height: 15),

          // ⭐ TIMELINE
          _buildActivityItem("07:00 AM", "Morning Workout completed", true),
          _buildActivityItem("08:30 AM", "Office Alarm missed", false),
          _buildActivityItem("10:00 PM", "Sleep Alarm completed", true),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          children: [
            Icon(icon, color: primaryGreen),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: textSecondary, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String time, String title, bool success) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [

          Icon(
            success ? Icons.check_circle : Icons.cancel,
            color: success ? primaryGreen : Colors.red,
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}