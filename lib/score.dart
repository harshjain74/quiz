import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  @override
  ScoreState createState() => ScoreState();
}

class ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade900,
      appBar: AppBar(
        title: Text('Score'),
        backgroundColor: Colors.black38,
      ),
      body: SafeArea(
        child: Center(
          child: Text("Score is"),
        ),
      ),
    );
  }
}
