import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../widgets/button.dart';
import 'lesson_one_t.dart';

class LessonOne extends StatefulWidget {
  const LessonOne({Key? key}) : super(key: key);

  @override
  _LessonOneState createState() => _LessonOneState();
}

class _LessonOneState extends State<LessonOne> {
  final List<String> letters = [
    'Alif (ا)',
    'Baʼ (ب)',
    'Taʼ (ت)',
    'Sawʼ (ث)',
    'Jim (ج)'
  ];
  int currentIndex = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      var audioFiles = [
        'salam.mp3',
        'audio_file_for_ba.mp3',
        'audio_file_for_ta.mp3',
        'audio_file_for_tha.mp3',
        'audio_file_for_jim.mp3'
      ];
      await player.setAsset(audioFiles[currentIndex]);
    } catch (e) {
      // catch load errors
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(letters[currentIndex], style: const TextStyle(fontSize: 30)),
                  IconButton(
                    icon: const Icon(CupertinoIcons.play, size: 50),
                    onPressed: () {
                      player.play();
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (currentIndex > 0)
                      CustomButton(
                        buttonText: 'Back',
                        onPressedFunction: () {
                          setState(() {
                            currentIndex--;
                            _loadAudio();
                          });
                        },
                      ),
                    const SizedBox(width: 20),
                    if (currentIndex < letters.length - 1)
                      CustomButton(
                        buttonText: 'Next',
                        onPressedFunction: () {
                          setState(() {
                            currentIndex++;
                            _loadAudio();
                          });
                        },
                      ),
                    Visibility(
                      visible: currentIndex == letters.length - 1,
                      child: CustomButton(
                        buttonText: 'Finish',
                        onPressedFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LessonOneTest()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
