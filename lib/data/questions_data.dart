import 'package:droppy/services/isar_service.dart';
import 'package:droppy/entities/question.dart';

class QuestionData {
  final IsarService isarService;

  QuestionData({required this.isarService});

  Future<void> addPreparedQuestions() async {
    List<Question> preparedQuestions = [
      Question(text: "Hi, how are you feeling today?"),
      Question(text: "Hi, has anything good happened today?"),
      Question(text: "Hi, have you met someone new?"),
      Question(text: "Nice to see you. What do you want to talk about?"),
      Question(text: "Hi, What are your plans for the week?"),
      Question(text: "Are you getting enough rest and sleep lately?"),
      Question(text: "Is there something stressing you out?"),
      Question(
          text:
              "Would you like to share any recent challenges or accomplishments in your life?"),
      Question(
          text:
              "I wanted to ask you if there is something you wish to do but don't have time for?"),
      Question(
          text:
              "How would you rate your overall stress level on a scale from 1 to 10?")
    ];

    for (var question in preparedQuestions) {
      // check if the question already exists in db
      var exists = await isarService.getQuestionByText(question.text);

      if (exists == null) {
        await isarService.saveQuestion(question);
      }
    }
  }
}
