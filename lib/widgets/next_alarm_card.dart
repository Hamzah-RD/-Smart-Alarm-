import 'package:flutter/material.dart';
import '../theme/theme.dart';

class NextAlarmCard extends StatelessWidget {
  const NextAlarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        // ⭐ PREMIUM GRADIENT (SOFT + MODERN)
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff22C55E), // soft green
            Color(0xff004c1d), // deeper green
          ],
        ),

        // ⭐ GLOW SHADOW
        boxShadow: [
          BoxShadow(
            color: const Color(0xff00c147).withOpacity(0.25),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          // LABEL ROW
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),

              const Text(
                "NEXT ALARM",
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // TIME
          const Text(
            "07:30",
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          // TITLE
          const Text(
            "Wake Up Challenge 🌅",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}