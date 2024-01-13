import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

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
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
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
            SizedBox(height: 20),
            Expanded(
              child: _buildDiaryEntries(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiaryEntries() {
    // Add your logic here to fetch and display diary entries based on _selectedDay
    // Fetch the diary entries for the selected day from your Isar database.
    // Display the entries in a ListView or another appropriate widget.
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'Diary entries for $_selectedDay will be displayed here.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
