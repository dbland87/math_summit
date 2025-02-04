import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_summit/bloc/quiz_bloc.dart';
import 'package:math_summit/providers/bloc_provider.dart';
import 'package:math_summit/ui/Problem/ProblemWidget.dart';
import 'package:math_summit/ui/keypad/KeypadWidget.dart';

class QuizScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  QuizBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<QuizBloc>(context);
    _bloc.loadQuizData();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.quizStream.listen((event) {
      if (event is QuizCompleteState) {
        Navigator.popAndPushNamed(context, '/review');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Screen'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ProblemWidget(),
          KeypadWidget(bloc: _bloc),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}
