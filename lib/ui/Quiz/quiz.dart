import 'package:flutter/material.dart';
import 'quiz_backend.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final quizLogic = QuizLogic();

  void _answerQuestion(int score) {
    if (score == 1) {
      quizLogic.incrementCorrectAnswers();
    }
    quizLogic.incrementTotalScore(score);
    setState(() {
      quizLogic.incrementQuestionIndex();
    });
    if (quizLogic.isQuizEnded()) {
      int incorrectAnswers = quizLogic.getQuestionCount() - quizLogic.getCorrectAnswers();
      String resultTitle = quizLogic.getCorrectAnswers() > incorrectAnswers ? 'شاباش' : 'ہار مت مانو، دوبارہ کوشش کرو';
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      resultTitle,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontFamily: 'Jameel-Noori',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'آپنے کوئز کے آخر تک پہنچ لیا.\n'
                          'صحیح جوابات:  ${quizLogic.getCorrectAnswers()}\n'
                          'غلط جوابات:  $incorrectAnswers\n'
                          'آپ کا کل سکور:  ${quizLogic.getTotalScore()}.',
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Jameel-Noori',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.refresh, color: Colors.white,),
                      title: const Text(
                        'دوبارہ شروع کریں',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Jameel-Noori',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        setState(() {
                          quizLogic.resetQuiz();
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.close, color: Colors.white,),
                      title: const Text(
                        'بند کریں',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Jameel-Noori',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
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
          'Quiz',
          style: TextStyle(
              color: Colors.green
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: quizLogic.isQuizEnded()
          ? const Center(
        child: Text(
          'کوئز ختم ہوا',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Jameel-Noori',
          ),
        ),
      )
          : Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Text(
                  quizLogic.getQuestionText(),
                  style: const TextStyle(
                    fontFamily: 'Jameel-Noori',
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ...(quizLogic.getAnswers()).map((answer) {
                return Container(
                  width: 250,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green[100],
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                      elevation: MaterialStateProperty.all<double>(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: Text(
                      answer['text'] as String,
                      style: const TextStyle(
                        fontFamily: 'Jameel-Noori',
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => setState(() {
                      _answerQuestion(answer['score'] as int);
                    }),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}