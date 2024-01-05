import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Diary'),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text('How are you today?'),
            const SizedBox(height: 20),
            TextField(
              maxLines: 20,
              decoration: InputDecoration(
                hintText: 'Start typing here...',
                labelText: 'Start typing here...',
                alignLabelWithHint: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ));
  }
}
