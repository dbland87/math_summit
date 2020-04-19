import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/providers/BlockProvider.dart';
import 'package:math_ninja/extensions/OperatorsExtensions.dart';
import 'package:math_ninja/ui/Problem/ProblemCharacter.dart';

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
