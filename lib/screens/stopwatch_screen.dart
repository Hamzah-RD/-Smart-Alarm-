import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen>
    with SingleTickerProviderStateMixin {
  Duration duration = Duration.zero;
  bool running = false;

  void start() {
    setState(() => running = true);

    Future.doWhile(() async {
      if (!running) return false;

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        duration += const Duration(seconds: 1);
      });

      return running;
    });
  }

  void stop() {
    setState(() => running = false);
  }

  void reset() {
    setState(() {
      duration = Duration.zero;
      running = false;
    });
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  @override
  Widget build(BuildContext context) {
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Stopwatch",
          style: TextStyle(color: Color(0xff111827)),
        ),
        iconTheme: const IconThemeData(color: Color(0xff111827)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ⭐ OUTER GLOW RING
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff22C55E).withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),

              // ⭐ INNER CARD
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffE5E7EB),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                    )
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      "TIME",
                      style: TextStyle(
                        color: Color(0xff6B7280),
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "$minutes:$seconds",
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111827),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ⭐ BUTTONS ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                _button(
                  label: running ? "STOP" : "START",
                  color: running
                      ? Colors.redAccent
                      : const Color(0xff22C55E),
                  onTap: running ? stop : start,
                ),

                const SizedBox(width: 15),

                _button(
                  label: "RESET",
                  color: Colors.grey,
                  onTap: reset,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}