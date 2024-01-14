import 'package:flutter/material.dart';
import 'package:droppy/screens/clock.dart';

class StretchingScreen extends StatelessWidget {
  const StretchingScreen({Key? key}) : super(key: key);

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
  const StretchingImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(130.0, 50.0)
            ..rotateZ(0.0),
          child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/droppy.png"),
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
  const StretchingBottomContainer({Key? key}) : super(key: key);

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
          StretchingItemWidget(
            title: 'Downward dog',
            duration: '45 sec',
            onTap: () {
              // Navigate to the CountdownScreen with an initial duration of 45 seconds
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownScreen(initialSeconds: 45),
                ),
              );
            },
          ),
          StretchingItemWidget(
            title: 'Warrior',
            duration: '1 min',
            onTap: () {
              // Navigate to the CountdownScreen with an initial duration of 45 seconds
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownScreen(initialSeconds: 60),
                ),
              );
            },
          ),
          StretchingItemWidget(
            title: 'Tree pose',
            duration: '35 sec',
            onTap: () {
              // Navigate to the CountdownScreen with an initial duration of 45 seconds
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownScreen(initialSeconds: 35),
                ),
              );
            },
          ),
          StretchingItemWidget(
            title: 'Corpse pose',
            duration: '2 min',
            onTap: () {
              // Navigate to the CountdownScreen with an initial duration of 45 seconds
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownScreen(initialSeconds: 120),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class StretchingItemWidget extends StatelessWidget {
  final String title;
  final String duration;
  final VoidCallback? onTap;

  const StretchingItemWidget({
    required this.title,
    required this.duration,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
