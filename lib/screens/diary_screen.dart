import 'dart:math';
import 'package:droppy/entities/diary_entry.dart';
import 'package:droppy/services/isar_service.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late String currentQuestion;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    currentQuestion = _generateRandomQuestion();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Builder(builder: (BuildContext builderContext) {
        return Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 154, 187, 222),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/droppy.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 200, height: 80),
                      Container(
                        width: 200,
                        height: 80,
                        child: Text(
                          currentQuestion,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.all(15),
              children: [
                const SizedBox(height: 110),
                TextField(
                  controller: _textEditingController,
                  maxLines: 20,
                  decoration: InputDecoration(
                    labelText: '05/01/2024 ',
                    hintText: 'Start typing here...',
                    filled: true,
                    fillColor: Colors.white,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveDiaryEntry(
                        builderContext, _textEditingController.text);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  String _generateRandomQuestion() {
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

  void _saveDiaryEntry(BuildContext context, String text) async {
    DateTime currentDate = DateTime.now();
    DiaryEntry newDiaryEntry = DiaryEntry(
      entryDate: currentDate,
      content: text,
    );

    await IsarService().saveDiaries(newDiaryEntry);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Diary entry saved successfully!')),
    );

    setState(() {
      _textEditingController.clear();
      currentQuestion = _generateRandomQuestion();
    });
  }
}
