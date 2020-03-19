import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/data/QuizRepository.dart';
import 'package:math_ninja/ui/Problem/ProblemWidget.dart';
import 'package:math_ninja/ui/keypad/KeypadWidget.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen(this._repository);

  final QuizRepository _repository;

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizBloc _quizBloc;

  @override
  void initState() {
    _quizBloc = QuizBloc(widget._repository);
    _quizBloc.loadQuizData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Screen'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ProblemWidget(stream: _quizBloc.quiz),
          KeypadWidget(),
        ],
      )),
    );
  }

  @override
  void dispose() {
    _quizBloc.dispose();
    super.dispose();
  }
}
