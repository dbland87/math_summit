import 'package:flutter/material.dart';
import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_ninja/lib/enums/OperatorEnum.dart';
import 'Problem.dart';

class Quiz {
  final int operand;
  final Operators operator;
  final List<Problem> problems;

  Quiz(
      {@required this.operand,
      @required this.operator,
      @required this.problems})
      : assert(operand != null),
        assert(operator != null),
        assert(problems != null && problems.isNotEmpty);

  bool isComplete() {
    return problems.any((element) => !element.isComplete());
  }

  Problem nextUnfinishedProblem() {
    return problems.firstWhere((problem) => !problem.isComplete());
  }
}
