import 'package:flutter/material.dart';
import '../theme/theme.dart';

class WorldClockScreen extends StatelessWidget {
  const WorldClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "World Clock",
          style: TextStyle(color: textPrimary),
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          _buildCity("Karachi", "PKT", "07:30 AM"),
          _buildCity("London", "GMT", "02:30 AM"),
          _buildCity("New York", "EST", "09:30 PM"),
          _buildCity("Tokyo", "JST", "11:30 AM"),
          _buildCity("Dubai", "GST", "04:30 AM"),
        ],
      ),
    );
  }

  Widget _buildCity(String city, String zone, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              Text(
                zone,
                style: const TextStyle(
                  color: textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          Text(
            time,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}