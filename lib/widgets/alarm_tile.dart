import 'package:flutter/material.dart';
import '../theme/theme.dart';

class AlarmTile extends StatelessWidget {
  final String time;
  final String title;
  final bool active;

  const AlarmTile({
    super.key,
    required this.time,
    required this.title,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),

      child: Row(
        children: [

          // LEFT STATUS INDICATOR (NEW)
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: active ? primaryGreen : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          // TIME
          Text(
            time,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),

          const SizedBox(width: 16),

          // TITLE
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // STATUS TEXT (NEW)
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: active
                  ? primaryGreen.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              active ? "ON" : "OFF",
              style: TextStyle(
                fontSize: 10,
                color: active ? primaryGreen : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // SWITCH
          Switch(
            value: active,
            onChanged: (v) {},
            activeColor: primaryGreen,
          ),
        ],
      ),
    );
  }
}