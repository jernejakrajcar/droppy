import 'package:flutter/material.dart';


class YogaScreen extends StatelessWidget {
  const YogaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 187, 222),
      ),
      body: Container(
        color: const Color.fromARGB(255, 164, 187, 223),
        child: const Center(
          child: Column(
            children: [
              // Top Container for Image
              YogaImageContainer(),
              // Bottom Container with Rectangle and Yoga Items
              YogaBottomContainer(),
              // Container for Undo Image
              UndoImageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class YogaImageContainer extends StatelessWidget {
  const YogaImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(-124.0, -10.0)..rotateZ(0.0),
          child: Container(
            width: 140, // Adjusted width to match YogaImageContainer
            height: 150, // Adjusted height to match YogaImageContainer
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


class YogaBottomContainer extends StatelessWidget {
  const YogaBottomContainer({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the specified route using imgLink method
              Navigator.pushNamed(context, imgLink(0));
            },
            child: const YogaItemWidget('Stretching', '10 min'),
          ),
          const YogaItemWidget('Advanced', '20 min'),
          const YogaItemWidget('Beginner', '15 min'),
          const YogaItemWidget('De-stress', '5 min'),
        ],
      ),
    );
  }
}

class YogaItemWidget extends StatelessWidget {
  final String title;
  final String duration;

  const YogaItemWidget(this.title, this.duration, {super.key});

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
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        // Navigate to ExercisesScreen on tap
        Navigator.of(context).pop(); // You can use pop to go back to the previous screen
      },
      child: Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          const Positioned(
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

String imgLink(int imgInt) {
  switch (imgInt) {
    case 0:
      return "/stretching";
    case 1:
      return "/meditation";
    case 2:
      return "/breathing";
    case 3:
      return "/grateful";
  }
  print("error in Image link index number");
  return "";
}
