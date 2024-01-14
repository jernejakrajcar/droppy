import 'package:droppy/screens/diary_screen.dart';
import 'package:droppy/screens/exercises/grateful_screen.dart';
import 'package:droppy/screens/exercises_screen.dart';
import 'package:droppy/screens/mood_tracker_screen.dart';
import 'package:droppy/screens/relaxation_games_screen.dart';

import 'package:droppy/screens/exercises/yoga_screen.dart';
import 'package:droppy/screens/exercises/meditation_screen.dart';
import 'package:droppy/screens/exercises/breathing_screen.dart';
import 'package:droppy/screens/yoga/stretching_screen.dart';
import 'package:droppy/data/questions_data.dart';

import 'package:flutter/material.dart';
import 'package:droppy/services/isar_service.dart';

void main() async {
  runApp(const MyApp());
  IsarService isarService = IsarService();
  QuestionData questionData = QuestionData(isarService: isarService);

  await questionData.addPreparedQuestions();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Droppy Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 136, 195, 243)),
        useMaterial3: true,
      ),
      initialRoute: '/dnevnik',
      routes: {
        '/': (context) => const MyHomePage(title: "DROPPY"),
        '/dnevnik': (context) => const DiaryScreen(),
        '/moodTracker': (context) => const MoodTrackerScreen(),
        '/vaje': (context) => const ExercisesScreen(),
        '/igre': (context) => const GamesScreen(),
        '/yoga': (context) => const YogaScreen(),
        '/meditation': (context) => const MeditationScreen(),
        '/breathing': (context) => const BreathingScreen(),
        '/grateful': (context) => const GratefulScreen(),
        '/stretching': (context) => const StretchingScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.

        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 154, 187, 222), // Adjust the opacity and color as needed

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Center(
          // Your existing content goes here
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200, // Set the desired width
                height: 200, // Set the desired height
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/droppy.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 89, 130, 197), // Set the background color of the box
                  border:
                      Border.all(color: Colors.black), // Set the border color
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius
                ),
                padding: const EdgeInsets.all(20), // Add padding to the container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth:
                          double.infinity, // Set a fixed width for the buttons
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/igre');
                        },
                        child: const Text('Relaxation Games'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/moodTracker');
                        },
                        child: const Text('Mood Tracker'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/vaje');
                        },
                        child: const Text('Exercises'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/dnevnik');
                        },
                        child: const Text('Diary'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
