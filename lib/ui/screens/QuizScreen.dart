import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/providers/BlockProvider.dart';
import 'package:math_ninja/ui/Problem/ProblemWidget.dart';
import 'package:math_ninja/ui/keypad/KeypadWidget.dart';

class QuizScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final QuizBloc bloc = BlocProvider.of<QuizBloc>(context);
    bloc.loadQuizData();

    bloc.quizStream.listen((event) {
      if (event is QuizCompleteState) {
        Navigator.pushNamed(context, '/review');
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
          KeypadWidget(bloc: bloc),
        ],
      )),
    );
  }
}
