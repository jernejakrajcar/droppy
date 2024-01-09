import 'package:isar/isar.dart';
import 'package:droppy/entities/diary_entry.dart';

part 'diary.g.dart';

@Collection()
class Diary {
  Id id = Isar.autoIncrement;

  @Backlink(to: 'diary')
  final entries = IsarLinks<DiaryEntry>();
}
