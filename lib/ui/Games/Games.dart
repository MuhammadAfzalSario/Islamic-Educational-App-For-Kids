import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/Games/first_game.dart';
import 'package:get/get.dart';
import '../widgets/game_card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Games',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black,),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 28.0, left: 28.0,),
                child: GameCard(
                  name: 'Image Guess Game',
                  image: 'assets/images/word.jpeg',
                  onTap: () => Get.to(() => ImageGuessGame()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
