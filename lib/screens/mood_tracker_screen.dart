import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
