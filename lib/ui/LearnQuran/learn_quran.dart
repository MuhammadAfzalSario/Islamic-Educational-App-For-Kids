import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/LearnQuran/lesson_one.dart';
import 'package:fyp_islamic_kids/ui/LearnQuran/lesson_two.dart';

import '../widgets/learn_card_widget.dart';

class LearnQuran extends StatelessWidget {
  const LearnQuran({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Learn Quran',
            style: TextStyle(
              color: Colors.green
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.green,
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   LearnCard(text: 'Lesson One', route: LessonOne()),
                   LearnCard(text: 'Lesson Two', route: LessonTwo()),
                 ],
               ),
             )
            ],
          ),
        )
    );
  }
}
