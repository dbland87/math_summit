import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/data/Quiz.dart';

class ProblemWidget extends StatelessWidget {
  final Stream<QuizState> stream;

  ProblemWidget({@required this.stream}) : assert(stream != null);

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
              return _buildContent(state.quiz, state.input);
            } else {
              return _buildError();
            }
          }),
    ));
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(Quiz quiz, int input) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Operand: ${quiz.operand}'),
        Text('Operator: ${quiz.operator}'),
        Text('Answer: $input')
      ],
    ));
  }

  Widget _buildError() {
    return Center(
      child: Text('Wat.'),
    );
  }
}
