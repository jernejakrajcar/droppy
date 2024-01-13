import 'package:flutter/material.dart';

class StretchingScreen extends StatelessWidget {
  const StretchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stretching'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: Color.fromARGB(255, 164, 187, 223),
        child: Center(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(130.0, 50.0)..rotateZ(0.0),
          child: Container(
            width: 140, // Adjusted width to match StretchingImageContainer
            height: 150, // Adjusted height to match StretchingImageContainer
            decoration: BoxDecoration(
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

  const StretchingItemWidget(this.title, this.duration);

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

class UndoImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to YogaScreen on tap
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
            Positioned(
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
