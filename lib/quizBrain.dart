import 'question.dart';
//import 'score.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans.', true),
    Question('You can led a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
  ];
  void nextQuestion() {
    //if (_questionNumber < _questionBank.length - 1) {
    _questionNumber++;
    //}
  }

  int getQuestionLength() {
    return _questionBank.length;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  String getQuestionBank() {
    if (_questionNumber < 3) {
      return _questionBank[_questionNumber].questionText;
    }
    return _questionBank[0].questionText;
  }

  bool getQuestionAnswer() {
    if (_questionNumber < 3) {
      return _questionBank[_questionNumber].questionAnswer;
    }
    return _questionBank[0].questionAnswer;
  }
}
