import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note1.mp3');
                audio.play();
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.orange,
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note2.mp3');
                audio.play();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.yellow,
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note3.mp3');
                audio.play();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.green,
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note4.mp3');
                audio.play();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.lightBlue,
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note5.mp3');
                audio.play();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: const Color.fromARGB(255, 14, 26, 114),
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note6.mp3');
                audio.play();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                color: Colors.purple,
              ),
              onPressed: () {
                Audio audio = Audio.load('assets/sounds/note7.mp3');
                audio.play();
              },
            ),
          ),
        ],
      )),
    );
  }
}
