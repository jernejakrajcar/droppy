import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
