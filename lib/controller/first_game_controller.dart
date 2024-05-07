// import 'package:get/get.dart';
//
// class ImageGuessGameController extends GetxController {
//   List<String> displayImages = ['assets/dog.png', 'assets/cat.png'];
//   List<String> correctAnswers = ['DOG', 'CAT'];
//   int currentIndex = 0;
//   String message = '';
//
//   void checkAnswer(String userAnswer) {
//     if (userAnswer == correctAnswers[currentIndex]) {
//       message = 'Correct!';
//       currentIndex++;
//       if (currentIndex >= correctAnswers.length) {
//         message += ' You have guessed all the words correctly!';
//       }
//     } else {
//       message = 'Try again!';
//     }
//     update();
//   }
// }
