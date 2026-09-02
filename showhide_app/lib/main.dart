import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Show Hide App", home: ShowHideScreen());
  }
}

class ShowHideScreen extends StatefulWidget {
  const ShowHideScreen({super.key});

  @override
  State<ShowHideScreen> createState() => ShowHideScreenState();
}

class ShowHideScreenState extends State<ShowHideScreen> {
  bool visible = true;

  void show() {
    setState(() {
      visible = true;
    });
  }

  void hide() {
    setState(() {
      visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Show Hide Screen")),
      body: Center(
        child: Column(
          children: [
            visible ? const Text("Flutter Developer") : const Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: show, child: const Text("Show")),
                TextButton(onPressed: hide, child: const Text("Hide")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
