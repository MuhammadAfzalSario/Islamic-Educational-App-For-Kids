import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/button.dart';

class ImageGuessGame extends StatefulWidget {
  const ImageGuessGame({super.key});

  @override
  _ImageGuessGameState createState() => _ImageGuessGameState();
}

class _ImageGuessGameState extends State<ImageGuessGame> with TickerProviderStateMixin {
  List<TextEditingController> myControllers = [];
  List<FocusNode> myFocusNodes = [];
  List<AnimationController> myShakeControllers = [];
  List<String> displayImages = ['assets/images/makkah.jpg', 'assets/images/madina.jpg', 'assets/images/arafat.jpg', 'assets/images/hira.jpg', 'assets/images/uhad.jpg', 'assets/images/nabvi.jpg',];
  List<String> correctAnswers = ['MAKKAH', 'MADINA', 'ARAFAT', 'HIRA', 'UHAD', 'NABVI'];
  int currentIndex = 0;
  String message = '';
  int hintIndex = 0;

  @override
  void initState() {
    super.initState();
    myControllers = List.generate(correctAnswers[currentIndex].length, (index) => TextEditingController());
    myFocusNodes = List.generate(correctAnswers[currentIndex].length, (index) => FocusNode());
    myShakeControllers = List.generate(correctAnswers[currentIndex].length, (index) => AnimationController(vsync: this, duration: const Duration(milliseconds: 100)));
  }

  void checkAnswer() {
    String userAnswer = myControllers.map((controller) => controller.text.toUpperCase()).join();
    if (userAnswer == correctAnswers[currentIndex]) {
      setState(() {
        message = 'Correct!';
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          message = '';
          currentIndex++;
          hintIndex = 0;
          if (currentIndex < correctAnswers.length) {
            myControllers = List.generate(correctAnswers[currentIndex].length, (index) => TextEditingController());
            myFocusNodes = List.generate(correctAnswers[currentIndex].length, (index) => FocusNode());
            myShakeControllers = List.generate(correctAnswers[currentIndex].length, (index) => AnimationController(vsync: this, duration: const Duration(milliseconds: 100)));
          } else {
            message = 'Congrats! You have guessed all the words correctly!';
          }
        });
      });
    } else {
      setState(() {
        message = 'Try again!';
        myShakeControllers.forEach((controller) {
          controller.forward(from: 0);
        });
        myControllers.forEach((controller) => controller.clear());
      });
    }
  }

  void showHint() {
    if (hintIndex < correctAnswers[currentIndex].length) {
      myControllers[hintIndex].text = correctAnswers[currentIndex][hintIndex];
      hintIndex++;
      if (hintIndex == correctAnswers[currentIndex].length) {
        Future.delayed(const Duration(seconds: 2), () {
          checkAnswer();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Image Guess Game',
          style: TextStyle(color: Colors.green),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: currentIndex < correctAnswers.length
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Guess the name of the image:', style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 24,
            ),),
            const SizedBox(height: 5),
            Image.asset(
              displayImages[currentIndex],
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myControllers.asMap().entries.map((entry) {
                int index = entry.key;
                TextEditingController controller = entry.value;
                AnimationController shakeController = myShakeControllers[index];
                return ShakeAnimation(
                  shakeController: shakeController,
                  child: Container(
                    width: 60,
                    height: 100,
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: controller,
                      focusNode: myFocusNodes[index],
                      maxLength: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < correctAnswers[currentIndex].length - 1) {
                          FocusScope.of(context).requestFocus(myFocusNodes[index + 1]);
                        }
                        if (index == correctAnswers[currentIndex].length - 1) {
                          checkAnswer();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      textInputAction: TextInputAction.next,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10,),
            CustomButton(
              buttonWidth: 100,
              buttonText: 'Hint',
              onPressedFunction: showHint,
            ),
            const SizedBox(height: 5,),
            Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      )
          : Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red, fontSize: 24),
        ),
      ),
    );
  }
}

class ShakeAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController shakeController;

  const ShakeAnimation({super.key, required this.child, required this.shakeController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shakeController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(shakeController.value * 5, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}
