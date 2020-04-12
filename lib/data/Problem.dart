import 'package:flutter/material.dart';
import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_ninja/lib/enums/OperatorEnum.dart';

class Problem {

  final String id;
  final int first;
  final int second;
  final Operators operator;
  int _response = null;

  Problem({@required this.id, @required this.first, @required this.second, @required this.operator}):
        assert (first != null),
        assert(second != null),
        assert(operator != null);

  int answer() {
    switch (operator) {
      case Operators.MULTIPLY:
        return this.first * second;
        break;
      case Operators.DIVIDE:
        return first ~/ second;
        break;
      case Operators.ADD:
        return first + second;
        break;
      case Operators.SUBTRACT:
        return first - second;
        break;
    }
    throw new Exception("Error computing answer for: $first $second $operator");
  }

  bool isCorrect() {
    return _response == answer();
  }

  bool isComplete() {
    return _response != null;
  }

  void setResponse(int response) {
    this._response = response;
  }
}
