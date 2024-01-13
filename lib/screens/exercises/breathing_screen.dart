import 'package:flutter/material.dart';

class BreathingScreen extends StatelessWidget {
  const BreathingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breathing'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 154, 187, 222), // Adjust the opacity and color as needed

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: const Center(
          child: Column(
            children: [
              // Top Container for Image
              BreathingImageContainer(),
              // Bottom Container with Rectangle and Breathing Items
              BreathingBottomContainer(),
              // Container for Undo Image
              UndoBreathingImageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class BreathingImageContainer extends StatelessWidget {
  const BreathingImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(-124.0, -10.0)..rotateZ(0.0),
          child: Container(
            width: 140, // Adjusted width to match BreathingImageContainer
            height: 150, // Adjusted height to match BreathingImageContainer
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/droppy_horizontally.png"), // Updated to use local image
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BreathingBottomContainer extends StatelessWidget {
  const BreathingBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 395,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF5982C5), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BreathingItemWidget('Mindful breathing', '3 min'),
          BreathingItemWidget('Calm', '6 min'),
          BreathingItemWidget('Focus', '2 min'),
          BreathingItemWidget('Awake', '1 min'),
        ],
      ),
    );
  }
}

class BreathingItemWidget extends StatelessWidget {
  final String title;
  final String duration;

  const BreathingItemWidget(this.title, this.duration, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF5982C5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            duration,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class UndoBreathingImageContainer extends StatelessWidget {
  const UndoBreathingImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to GratefulScreen on tap
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            // Container for the white border
            Positioned(
              top: 20,
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            // Container for the image
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/Undo.png',
                width: 100,
                height: 100,
              ),
            ),
            // Arrow pointing to the middle of the white border
            const Positioned(
              top: 50,
              left: 75,
              child: Icon(
                Icons.arrow_drop_up,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
