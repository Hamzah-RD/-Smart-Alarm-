import 'package:flutter/material.dart';
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
        title: const Text(
          "Add Alarm",
          style: TextStyle(color: textPrimary),
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ⭐ TIME CARD (HERO INPUT)
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Alarm Time",
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 12,
                  ),
                ),

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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: pickTime,
                  child: const Text("Change Time",
                      style: TextStyle(fontSize: 11,color: Colors.white),),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ⭐ LABEL CARD
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

          // ⭐ CHALLENGES CARD
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              children: [

                CheckboxListTile(
                  activeColor: primaryGreen,
                  title: const Text("Math Challenge"),
                  value: mathChallenge,
                  onChanged: (v) => setState(() => mathChallenge = v!),
                ),

                CheckboxListTile(
                  activeColor: primaryGreen,
                  title: const Text("Photo Challenge"),
                  value: photoChallenge,
                  onChanged: (v) => setState(() => photoChallenge = v!),
                ),

                CheckboxListTile(
                  activeColor: primaryGreen,
                  title: const Text("Selfie Challenge"),
                  value: selfieChallenge,
                  onChanged: (v) => setState(() => selfieChallenge = v!),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
            ),
            onPressed: () {},
            child: const Text(
              "Save Alarm",
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}