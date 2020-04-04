import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/data/Quiz.dart';
import 'package:math_ninja/providers/BlockProvider.dart';
import 'package:math_ninja/extensions/OperatorsExtensions.dart';
import 'package:math_ninja/ui/Problem/ProblemCharacter.dart';

class ProblemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: StreamBuilder<QuizState>(
          stream: BlocProvider.of<QuizBloc>(context).quizStream,
          initialData: QuizInitState(),
          builder: (context, snapshot) {
            if (snapshot.data is QuizDataState) {
              QuizDataState state = snapshot.data;
              return _buildContent(state.quiz, state.input);
            } else {
              return _buildError();
            }
          }),
    ));
  }

  Widget _buildContent(Quiz quiz, String input) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProblemCharacter(character: quiz.operand.toString()),
                ProblemCharacter(character: quiz.operator.displaySymbol),
                ProblemCharacter(character: quiz.operand.toString()),
                ProblemCharacter(character: '='),
              ]),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: ProblemCharacter(character: input.toString()),
          ),
        )
      ],
    );
  }

  Widget _buildError() {
    return Center(
      child: Text('Wat.'),
    );
  }
}
