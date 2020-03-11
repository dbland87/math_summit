import 'package:flutter/material.dart';
import 'package:math_ninja/constants/OperatorEnum.dart';
import 'Problem.dart';

class Quiz {

  Quiz({@required this.operand, @required this.operator, @required this.problems}):
        assert (operand != null),
        assert(operator != null),
        assert(problems != null && problems.isNotEmpty);

  final int operand;
  final OperatorEnum operator;
  final List<Problem> problems;

  bool isComplete() {
    return problems.any((element) => !element.isComplete());
  }
}
