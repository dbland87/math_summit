import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/data/Quiz.dart';

class ProblemWidget extends StatelessWidget {
  final Stream stream;

  ProblemWidget({@required this.stream});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: StreamBuilder<QuizState>(
              stream: stream,
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
              }),
        )
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(Quiz quiz) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Operand: ${quiz.operand}'),
            Text('Operator: ${quiz.operator}'),
          ],
        ));
  }

  Widget _buildError() {
    return Center(
      child: Text('Wat.'),
    );
  }
}