import 'package:isar/isar.dart';

part 'question.g.dart';

@Collection()
class Question {
  Id id = Isar.autoIncrement;

  @Index()
  String text;

  Question({required this.text});
}
