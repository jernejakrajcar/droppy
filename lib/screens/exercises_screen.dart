import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 154, 187, 222),
      appBar: AppBar(
        title: const Text('Exercises'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 154, 187, 222),
      ),
      body: Center(
        child: Container(
          width: 360, // Adjust the width as needed
          height: 360, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 154, 187, 222),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: 4, // 2x2 grid, so 2 rows and 2 columns
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, imgLink(index));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            getImgName(index), // Replace with your image paths
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        getTitle(index), // Replace with your text
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

String getImgName(int imgInt) {
  String s = "assets/";
  switch (imgInt) {
    case 0:
      return s + "yoga_icon.png";
    case 1:
      return s + "meditation_icon.png";
    case 2:
      return s + "breathing_icon.png";
    case 3:
      return s + "grateful_icon.png";
  }
  print("error in Image index number");
  return "";
}

String imgLink(int imgInt) {
  switch (imgInt) {
    case 0:
      return "/yoga";
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

String getTitle(imgInt) {
  switch (imgInt) {
    case 0:
      return "Yoga";
    case 1:
      return "Meditation";
    case 2:
      return "Breathing";
    case 3:
      return "Grateful";
  }
  print("error in Image Name index number");
  return "";
}

