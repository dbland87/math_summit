import 'package:flutter/material.dart';
import 'package:math_ninja/constants/OperatorEnum.dart';

class Quiz {
  Quiz({@required this.operand, @required this.operator});

  final int operand;
  final OperatorEnum operator;
}
