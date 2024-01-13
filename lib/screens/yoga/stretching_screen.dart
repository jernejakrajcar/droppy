import 'package:flutter/material.dart';

class StretchingScreen extends StatelessWidget {
  const StretchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stretching'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: const Color.fromARGB(255, 164, 187, 223),
        child: const Center(
          child: Column(
            children: [
              // Top Container for Image
              StretchingImageContainer(),
              // Bottom Container with Rectangle and Stretching Items
              StretchingBottomContainer(),
              // Container for Undo Image
              UndoImageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class StretchingImageContainer extends StatelessWidget {
  const StretchingImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(130.0, 50.0)..rotateZ(0.0),
          child: Container(
            width: 140, // Adjusted width to match StretchingImageContainer
            height: 150, // Adjusted height to match StretchingImageContainer
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/droppy.png"), // Updated to use local image
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StretchingBottomContainer extends StatelessWidget {
  const StretchingBottomContainer({super.key});

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
          StretchingItemWidget('Downward dog', '45 sec'),
          StretchingItemWidget('Warrior', '1 min'),
          StretchingItemWidget('Tree pose', '35 sec'),
          StretchingItemWidget('Corpse pose', '2 min'),
        ],
      ),
    );
  }
}

class StretchingItemWidget extends StatelessWidget {
  final String title;
  final String duration;

  const StretchingItemWidget(this.title, this.duration, {super.key});

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

class UndoImageContainer extends StatelessWidget {
  const UndoImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to YogaScreen on tap
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
