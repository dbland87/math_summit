import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/data/Quiz.dart';
import 'package:math_ninja/data/QuizRepository.dart';

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
        child: StreamBuilder<QuizState>(
          stream: _quizBloc.quiz,
          initialData: QuizInitState(),
          builder: (context, snapshot) {
             if (snapshot.data is QuizLoadingState) {
              return _buildLoading();
            } else if (snapshot.data is QuizDataState) {
              QuizDataState state = snapshot.data;
              return _buildContent(state.quiz);
            } else {
               return _buildError();
            }
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quizBloc.dispose();
    super.dispose();
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(Quiz quiz) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Operand: ${quiz.operand}'),
          Text('Operator: ${quiz.operator}'),
        ],
      )

    );
  }

  Widget _buildError() {
    return Center(
      child: Text('Wat.'),
    );
  }
}
