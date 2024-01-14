import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:droppy/entities/diary_entry.dart';
import 'package:droppy/services/isar_service.dart';
import 'package:droppy/entities/question.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: <Widget>[
            TableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update focusedDay as well
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _buildDiaryEntries(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiaryEntries() {
    return FutureBuilder<List<DiaryEntry>>(
      future: IsarService().getAllDiaryEntries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Prilagodite prikaz čakanja po potrebi
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final allDiaryEntries = snapshot.data;

          if (allDiaryEntries != null && allDiaryEntries.isNotEmpty) {
            // Filtrirajte dnevniške vnose za izbrani datum (_selectedDay)
            final filteredDiaryEntries = allDiaryEntries
                .where((entry) =>
                    entry.entryDate.year == _selectedDay.year &&
                    entry.entryDate.month == _selectedDay.month &&
                    entry.entryDate.day == _selectedDay.day)
                .toList();

            if (filteredDiaryEntries.isNotEmpty) {
              return ListView.builder(
                itemCount: filteredDiaryEntries.length,
                itemBuilder: (context, index) {
                  final diaryEntry = filteredDiaryEntries[index];
                  final diaryQuestion = filteredDiaryEntries[index].questionId;

                  return Column(
                    children: [
                      FutureBuilder<Question?>(
                        future: IsarService().getQuestionById(diaryQuestion),
                        builder: (context, questionSnapshot) {
                          if (questionSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Prilagodite prikaz čakanja po potrebi
                          } else if (questionSnapshot.hasError) {
                            return Text('Error: ${questionSnapshot.error}');
                          } else {
                            final question = questionSnapshot.data;

                            if (question != null) {
                            return Container(
                              color: const Color.fromARGB(255, 154, 187, 222), 
                              padding: EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(
                                  'Question: ${question.text}',
                                  style: TextStyle(
                                    color: Colors.white, // Set text color
                                  ),
                                ),
                                // Add other information about the question if needed
                              ),
                            );
                          } else {
                            return Text('Question not found.');
                          }
                          }
                        },
                      ),
                      ListTile(
                        title: Text(diaryEntry.content),
                        // Dodajte druge informacije o vnosu, če jih želite prikazati
                      ),
                      Divider(), // Dodajte razdeljevalec med vnosi dnevnika
                    ],
                  );
                },
              );
           } else {
              return Container(
                color: const Color.fromARGB(255, 154, 187, 222), // Set the background color
                padding: EdgeInsets.all(45),
                child: Text(
                  'No diary entries for $_selectedDay.',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                  ),
                ),
              );
            } 
          } else {
            return Text('No diary entries available.');
          }
        }
      },
    );
  }
}
    /*return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Diary entries for $_selectedDay will be displayed here.',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}*/
