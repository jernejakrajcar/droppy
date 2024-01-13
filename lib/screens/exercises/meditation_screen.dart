import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
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
            children: [
              // Top Container for Image
              MeditationImageContainer(),
              // Bottom Container with Rectangle and Meditation Items
              MeditationBottomContainer(),
              // Container for Undo Image
              UndoMeditationImageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MeditationImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(-124.0, -10.0)..rotateZ(0.0),
          child: Container(
            width: 140, // Adjusted width to match MeditationImageContainer
            height: 150, // Adjusted height to match MeditationImageContainer
            decoration: BoxDecoration(
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

class MeditationBottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 395,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF5982C5), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MeditationItemWidget('Mindful breathing', '10 min'),
          MeditationItemWidget('Calm', '20 min'),
          MeditationItemWidget('Focus', '15 min'),
          MeditationItemWidget('Awake', '5 min'),
        ],
      ),
    );
  }
}

class MeditationItemWidget extends StatelessWidget {
  final String title;
  final String duration;

  const MeditationItemWidget(this.title, this.duration);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF5982C5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            duration,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
class UndoMeditationImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ExercisesScreen on tap
        Navigator.of(context).pop(); // You can use pop to go back to the previous screen
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            // Container for the white border
            Positioned(
              top: 20, // Adjust the top position as needed
              child: Container(
                width: 120,
                height: 60, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Set the border color to white
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(30), // More rectangular border
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
            Positioned(
              top: 50, // Adjust the top position as needed
              left: 75, // Adjust the left position to center the arrow
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
