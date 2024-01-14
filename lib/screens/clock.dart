import 'dart:async';

import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  final int initialSeconds;

  CountdownScreen({required this.initialSeconds});

  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  late Timer _timer;
  int _secondsLeft = 0;

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.initialSeconds;
    startCountdown();
  }

  void startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsLeft == 0) {
          _timer.cancel(); // Stop the timer when it reaches 0 seconds
          // You can add code here to perform actions when the countdown is finished.
        } else {
          _secondsLeft--;
        }
      });
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      appBar: AppBar(
        title: Text('Countdown Timer'),
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(_secondsLeft),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Handle the back button tap here
                Navigator.pop(context);
              },
              child: Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors
                          .blue), // Optional: add a border to make it look like a button
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}
