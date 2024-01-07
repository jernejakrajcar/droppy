import 'dart:math';

import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/droppy.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(
                255, 154, 187, 222), // Adjust the opacity and color as needed
          ),
          ListView(
            padding: EdgeInsets.all(15),
            children: [
              const SizedBox(height: 100),
              Text(
                _generateRandomQuestion(),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 20,
                decoration: InputDecoration(
                  labelText: '05/01/2024 ',
                  hintText: 'Start typing here...',
                  filled: true,
                  fillColor: Colors.white,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String _generateRandomQuestion() {
    // Generate a random question
    Random random = Random();
    int questionNum = random.nextInt(10);

    switch (questionNum) {
      case 0:
        return "Hi, how are you feeling today?";
      case 1:
        return "Hi, has anything good happened today?";
      case 2:
        return "Hi, have you met someone new?";
      case 3:
        return "Nice to see you. What do you want to talk about?";
      case 4:
        return "Hi, What are your plans for the week?";
      case 5:
        return "Are you getting enough rest and sleep lately?";
      case 6:
        return "Is there something stressing you out?";
      case 7:
        return "Would you like to share any recent challenges or accomplishments in your life?";
      case 8:
        return "I wanted to ask you if there is something you wish to do but don't have time for?";
      case 9:
        return "How would you rate your overall stress level on a scale from 1 to 10?";
    }

    return "Hi.";
  }
}
