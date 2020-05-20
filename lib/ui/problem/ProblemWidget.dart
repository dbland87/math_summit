import 'package:flutter/material.dart';
import 'package:math_summit/bloc/quiz_bloc.dart';
import 'package:math_summit/providers/bloc_provider.dart';
import 'package:math_summit/ui/Problem/ProblemCharacter.dart';
import 'package:math_summit/extensions/operator_extensions.dart';

class ProblemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StreamBuilder<QuizState>(
            stream: BlocProvider.of<QuizBloc>(context).quizStream,
            initialData: QuizInitState(),
            builder: (context, snapshot) {
              if (snapshot.data is QuizDataState) {
                QuizDataState state = snapshot.data;
                return Expanded(
                  flex: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ProblemCharacter(character: state.problem.first.toString()),
                        ProblemCharacter(character: state.problem.operator.displaySymbol),
                        ProblemCharacter(character: state.problem.second.toString()),
                        ProblemCharacter(character: '='),
                      ]),
                );
              } else {
                return _buildError();
              }
            }),
        StreamBuilder<int>(
            stream: BlocProvider.of<QuizBloc>(context).inputStream,
            builder: (context, snapshot) {
              return Expanded(
                flex: 1,
                child: Center(
                  child: ProblemCharacter(
                      character: (snapshot.data != null) ? snapshot.data.toString() : ""),
                ),
              );
            }),
      ],
    );
  }

  Widget _buildError() {
    return Container();
  }
}
