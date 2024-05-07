class QuizLogic {
  int _questionIndex = 0;
  int _totalScore = 0;
  int _correctAnswers = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'اسلام کا پہلا استون کیا ہے؟',
      'answers': [
        {'text': 'نماز', 'score': 0},
        {'text': 'شہادہ', 'score': 1},
        {'text': 'زکوٰۃ', 'score': 0},
      ],
    },
    {
      'questionText': 'روزانہ کتنی بار نماز ادا کی جاتی ہے؟',
      'answers': [
        {'text': '3 بار', 'score': 0},
        {'text': '5 بار', 'score': 1},
        {'text': '7 بار', 'score': 0},
      ],
    },
    {
      'questionText': 'قرآن مجید میں کل کتنی سورتیں ہیں؟',
      'answers': [
        {'text': '114', 'score': 1},
        {'text': '116', 'score': 0},
        {'text': '120', 'score': 0},
      ],
    },
    {
      'questionText': 'حضرت محمد ﷺ کس شہر میں پیدا ہوئے؟',
      'answers': [
        {'text': 'مکہ', 'score': 1},
        {'text': 'طائف', 'score': 0},
        {'text': 'مدینہ', 'score': 0},
      ],
    },
    {
      'questionText': 'حضرت نوح علیہ السلام کی کس چیز کا ذکر قرآن میں ہے؟',
      'answers': [
        {'text': 'جہاز', 'score': 0},
        {'text': 'کشتی', 'score': 1},
        {'text': 'گھوڑا', 'score': 0},
      ],
    },
    {
      'questionText': 'حضرت یوسف علیہ السلام کس کے بیٹے تھے؟',
      'answers': [
        {'text': 'حضرت ابراہیم', 'score': 0},
        {'text': 'حضرت یعقوب', 'score': 1},
        {'text': 'حضرت اسحاق', 'score': 0},
      ],
    },
  ];

  int getQuestionCount() {
    return _questions.length;
  }

  void incrementQuestionIndex() {
    _questionIndex++;
  }

  void incrementTotalScore(int score) {
    _totalScore += score;
  }

  void incrementCorrectAnswers() {
    _correctAnswers++;
  }

  bool isQuizEnded() {
    return _questionIndex >= _questions.length;
  }

  String getQuestionText() {
    return _questions[_questionIndex]['questionText'] as String;
  }

  List<Map<String, Object>> getAnswers() {
    return _questions[_questionIndex]['answers'] as List<Map<String, Object>>;
  }

  int getCorrectAnswers() {
    return _correctAnswers;
  }

  int getTotalScore() {
    return _totalScore;
  }

  void resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    _correctAnswers = 0;
  }
}