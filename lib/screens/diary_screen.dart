import 'dart:math';
import 'package:droppy/entities/diary_entry.dart';
import 'package:droppy/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:droppy/entities/question.dart';
import 'package:isar/isar.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late String currentQuestion = '';
  late Id currentQuestionId = 0;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    //currentQuestion = _generateRandomQuestion();
    _textEditingController = TextEditingController();
    _loadQuestions();
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
        var today = DateTime.now();
        String formattedData =
            "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
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
            const SizedBox(height: 30),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 120),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 214, 233, 255),
                          borderRadius: BorderRadius.circular(
                              10), // Dodajte border-radius tukaj
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        width: MediaQuery.of(context).size.width * 0.57,
                        height: 120,
                        child: Text(
                          currentQuestion,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            ListView(
              padding: EdgeInsets.all(15),
              children: [
                const SizedBox(height: 110),
                TextField(
                  controller: _textEditingController,
                  maxLines: 18,
                  decoration: InputDecoration(
                    labelText: formattedData,
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
                    _saveDiaryEntry(builderContext, _textEditingController.text,
                        currentQuestion);
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

  Future<void> _loadQuestions() async {
    List<Question> questions = await IsarService().getAllQuestions();
    print(questions[1].text);

    if (questions.isEmpty) {
      // If there are no questions, return a default message
      setState(() {
        currentQuestion = "Hi.";
      });
    } else {
      Random random = Random();
      int questionIndex = random.nextInt(questions.length);

      setState(() {
        currentQuestion = questions[questionIndex].text;
        currentQuestionId = questions[questionIndex].id;
      });
    }
  }

  String _generateRandomQuestion() {
    _loadQuestions();
    return currentQuestion;
  }

  /*String _generateRandomQuestion() {
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
  }*/

  void _saveDiaryEntry(
      BuildContext context, String text, String currentQuestion) async {
    DateTime currentDate = DateTime.now();

    DiaryEntry newDiaryEntry = DiaryEntry(
      entryDate: currentDate,
      content: text,
      questionId: currentQuestionId,
    );
    print("To je QUESTION ID: ");
    print(currentQuestionId);
    // Set the question ID in the Diary Entry
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
