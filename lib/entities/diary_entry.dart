import 'package:droppy/entities/diary.dart';
import 'package:isar/isar.dart';
import 'package:droppy/entities/question.dart';

part 'diary_entry.g.dart';

@Collection()
class DiaryEntry {
  Id id = Isar.autoIncrement;

  late DateTime entryDate;
  late String content;

  final diary = IsarLink<Diary>();
  final question = IsarLink<Question>();

  DiaryEntry({required this.entryDate, required this.content});
}
