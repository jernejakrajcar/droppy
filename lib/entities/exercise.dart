import 'package:isar/isar.dart';

part 'exercise.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;

  String name;
  String description;

  Exercise({required this.name, required this.description});
}
