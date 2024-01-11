import 'package:flutter/material.dart';

class GratefulScreen extends StatelessWidget {
  const GratefulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grateful'),
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
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}