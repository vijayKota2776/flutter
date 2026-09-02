import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Stop Watch", home: StopWatchScreen());
  }
}

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => StopWatchScreenState();
}

class StopWatchScreenState extends State<StopWatchScreen> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;

  void start() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          seconds++;
          if (seconds == 60) {
            seconds = 0;
            minutes++;
          }
          if (minutes == 60) {
            minutes = 0;
            hours++;
          }
        });
      });
    }
  }

  void stop() {
    timer?.cancel();
  }

  void reset() {
    stop();
    setState(() {
      hours = 0;
      minutes = 0;
      seconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String h = hours.toString().padLeft(2, '0');
    String m = minutes.toString().padLeft(2, '0');
    String s = seconds.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text("Stop Watch")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$h:$m:$s", style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: start, child: const Text("Start")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: stop, child: const Text("Stop")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: reset, child: const Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
