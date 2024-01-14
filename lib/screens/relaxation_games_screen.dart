import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxation Games'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: const Color.fromARGB(255, 154, 187, 222),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Add the image of Droppy
              Image.asset(
                'assets/droppy.png', // Adjust the image path as needed
                width: 600, // Set the desired width
                height: 600, // Set the desired height
              ),
              const SizedBox(height: 0),
              Text(
                "Coming soon!",
                style: TextStyle(
                  fontSize: 24, // Set the desired font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
