import 'package:droppy/entities/diary_entry.dart';
import 'package:droppy/entities/exercise.dart';
import 'package:droppy/entities/diary.dart';
import 'package:droppy/entities/question.dart';
// import 'package:droppy/lib/entities/mood_tracker.dart';
// import 'package:droppy/lib/entities/relaxation_games.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;
  late Isar isar;

  IsarService() {
    db = openDB();
    //cleanDb();
    initializeExercises();
    initializeDiaryEntry();
    initializeDiary();
    initializeQuestions();
  }
  Future<void> initializeExercises() async {
    isar = await db;
    final exercises = getAllExercises();
  }

  Future<void> initializeDiaryEntry() async {
    isar = await db;
    final diaryEntrys = getAllDiaries();
  }

  Future<void> initializeDiary() async {
    isar = await db;
    final diarys = getAllDiaries();
  }

  Future<void> initializeQuestions() async {
    isar = await db;
    final questions = getAllQuestions();
  }

  Future<void> saveExercise(Exercise newExercises) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.exercises.putSync(newExercises));
  }

  Future<void> saveDiaries(DiaryEntry newEntry) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.diaryEntrys.putSync(newEntry));
  }

  Future<void> saveQuestion(Question newQuestion) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.questions.putSync(newQuestion));
  }

  Future<Exercise?> getExerciseByName(String name) async {
    isar = await db;
    final query = isar.exercises.where().filter().nameEqualTo(name).build();
    final result = await query.findFirst();

    return result;
  }

  Future<Exercise> getExercise() async {
    throw UnimplementedError();
  }

  Future<DiaryEntry> getDiary() async {
    throw UnimplementedError();
  }

  Future<List<Exercise>> getAllExercises() async {
    final isar = await db;
    final exerciseQuery = isar.exercises.where();
    print(exerciseQuery);
    return exerciseQuery.findAll();
  }

  Future<List<Diary>> getAllDiaries() async {
    final isar = await db;
    final diaryQuery = isar.diarys.where();
    print(diaryQuery);
    return diaryQuery.findAll();
  }

  Future<List<DiaryEntry>> getAllDiaryEntries() async {
    final isar = await db;
    final diaryEntryQuery = isar.diaryEntrys.where();
    print(diaryEntryQuery);
    return diaryEntryQuery.findAll();
  }

  Future<List<Question>> getAllQuestions() async {
    final isar = await db;
    final questionsQuery = isar.questions.where();
    print(questionsQuery);
    return questionsQuery.findAll();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Question?> getQuestionById(int id) async {
    final isar = await db;
    return isar.questions.get(id);
  }

  Future<Question?> getQuestionByText(String text) async {
    final isar = await db;
    final query = isar.questions.where().filter().textEqualTo(text).build();
    return query.findFirst();
  }

  Future<Exercise?> getExerciseById(int id) async {
    final isar = await db;
    return isar.exercises.get(id);
  }

  Future<DiaryEntry?> getDiaryById(int id) async {
    final isar = await db;
    return isar.diaryEntrys.get(id);
  }

  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/isar-db';

    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    print(path);

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ExerciseSchema, DiaryEntrySchema, DiarySchema, QuestionSchema],
        inspector: true,
        directory: path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
