import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 154, 187, 222), // Adjust the opacity and color as needed

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255,
                      255), // Set the background color of the box
                  border: Border.all(
                      color: Color.fromARGB(
                          255, 89, 130, 197)), // Set the border color
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius
                ),
                //=========USEBINA V KONTENERJU!!!===========
              )
            ],
          ),
        ),
      ),
    );
  }
}
