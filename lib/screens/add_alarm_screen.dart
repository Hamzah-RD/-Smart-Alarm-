import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/alarm_model.dart';
import '../providers/alarm_provider.dart';
import '../theme/theme.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  final TextEditingController labelController = TextEditingController();

  bool mathChallenge = true;
  bool photoChallenge = true;
  bool selfieChallenge = true;

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Add Alarm",
            style: TextStyle(color: textPrimary)),
        iconTheme: const IconThemeData(color: textPrimary),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ⭐ TIME CARD
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text("Alarm Time",
                    style: TextStyle(color: textSecondary, fontSize: 12)),

                const SizedBox(height: 10),

                Text(
                  selectedTime.format(context),
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                  ),
                  onPressed: pickTime,
                  child: const Text("Change Time",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ⭐ LABEL
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: TextField(
              controller: labelController,
              decoration: const InputDecoration(
                labelText: "Alarm Label",
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ⭐ CHALLENGES
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              children: [

                CheckboxListTile(
                  title: const Text("Math Challenge"),
                  value: mathChallenge,
                  activeColor: primaryGreen,
                  onChanged: (v) => setState(() => mathChallenge = v!),
                ),

                CheckboxListTile(
                  title: const Text("Photo Challenge"),
                  value: photoChallenge,
                  activeColor: primaryGreen,
                  onChanged: (v) => setState(() => photoChallenge = v!),
                ),

                CheckboxListTile(
                  title: const Text("Selfie Challenge"),
                  value: selfieChallenge,
                  activeColor: primaryGreen,
                  onChanged: (v) => setState(() => selfieChallenge = v!),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ⭐ SAVE BUTTON (FULLY FIXED)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              minimumSize: const Size(double.infinity, 55),
            ),

            onPressed: () {
              final provider =
              Provider.of<AlarmProvider>(context, listen: false);

              provider.addAlarm(
                AlarmModel(
                  id: DateTime.now()
                      .millisecondsSinceEpoch
                      .toString(),

                  time: selectedTime,
                  label: labelController.text.isEmpty
                      ? "Alarm"
                      : labelController.text,

                  mathChallenge: mathChallenge,
                  photoChallenge: photoChallenge,
                  selfieChallenge: selfieChallenge,
                ),
              );

              Navigator.pop(context);
            },

            child: const Text(
              "Save Alarm",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}