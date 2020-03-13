import 'package:flutter/material.dart';
import 'package:math_ninja/constants/OperatorEnum.dart';

class Problem {

  final int first;
  final int second;
  final OperatorEnum operator;
  int _response = -1;

  Problem({@required this.first, @required this.second, @required this.operator}):
        assert (first != null),
        assert(second != null),
        assert(operator != null);

  int answer() {
    switch (operator) {
      case OperatorEnum.MULTIPLY:
        return this.first * second;
        break;
      case OperatorEnum.DIVIDE:
        return first ~/ second;
        break;
      case OperatorEnum.ADD:
        return first + second;
        break;
      case OperatorEnum.SUBTRACT:
        return first - second;
        break;
    }
    throw new Exception("Error computing answer for: $first $second $operator");
  }

  bool isCorrect() {
    return _response == answer();
  }

  bool isComplete() {
    return _response != -1;
  }

  void setResponse(int response) {
    this._response = response;
  }
}
