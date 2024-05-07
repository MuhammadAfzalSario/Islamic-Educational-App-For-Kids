import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LessonOneTest extends StatelessWidget {
  LessonOneTest({super.key});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              '(ا)',
              style: TextStyle(fontSize: 100, fontFamily: 'Jameel-Noori'),
            ),
          ),
          const Text(
            'Alif',
            style: TextStyle(fontSize: 24),
          ),
          const Text(
            'الف',
            style: TextStyle(fontSize: 50, fontFamily: 'Jameel-Noori'),
          ),
          ElevatedButton(
            onPressed: () async {
              await player.setAsset('assets/audio/alif.mp3');
              player.play();
            },
            child: Icon(CupertinoIcons.play),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () {
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.mic,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
