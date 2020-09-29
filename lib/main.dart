import 'package:flutter/material.dart';
import 'package:quiz/quizBrain.dart';
import 'quizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool result = quizBrain.getQuestionAnswer();
    if (userPickedAnswer == result) {
      score++;
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    int qlength = quizBrain.getQuestionLength();
    int qnumber = quizBrain.getQuestionNumber();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: qnumber < qlength - 1
                  ? Text(quizBrain.getQuestionBank(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ))
                  : Text(
                      "Your score is: $score",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
            ),
          ),
        ),
        Expanded(
          child: qnumber < qlength
              ? Padding(
                  padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 10.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                )
              : Container(),
        ),
        Expanded(
          child: qnumber < qlength
              ? Padding(
                  padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 10.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    },
                  ),
                )
              : Container(),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
'You can lead a cow down stairs but not up stairs',false,
'Approximately one quarter of human bones are in the feet',true,
'A slug's blood is green',true,
*/
