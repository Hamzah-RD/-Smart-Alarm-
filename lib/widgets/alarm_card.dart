import 'package:flutter/material.dart';

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
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Alarm")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // TIME CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(blurRadius: 10, color: Colors.black12)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedTime.format(context),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: pickTime,
                  child: const Text("Pick Time"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // LABEL INPUT
          TextField(
            controller: labelController,
            decoration: InputDecoration(
              labelText: "Alarm Label",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // CHALLENGES
          CheckboxListTile(
            title: const Text("Math Challenge"),
            value: mathChallenge,
            onChanged: (v) {
              setState(() => mathChallenge = v!);
            },
          ),

          CheckboxListTile(
            title: const Text("Photo Challenge"),
            value: photoChallenge,
            onChanged: (v) {
              setState(() => photoChallenge = v!);
            },
          ),

          CheckboxListTile(
            title: const Text("Selfie Challenge"),
            value: selfieChallenge,
            onChanged: (v) {
              setState(() => selfieChallenge = v!);
            },
          ),

          const SizedBox(height: 30),

          // SAVE BUTTON
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              print("Alarm Saved");
              print(labelController.text);
            },
            child: const Text("Save Alarm"),
          ),
        ],
      ),
    );
  }
}