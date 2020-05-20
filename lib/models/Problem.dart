import 'package:flutter/material.dart';
import 'package:math_summit/enums/operator.dart';
import 'package:math_summit/extensions/string_extensions.dart';

class Problem {
  final String id;
  final int first;
  final int second;
  final Operator operator;
  int _response = null;

  Problem(
      {@required this.id, @required this.first, @required this.second, @required this.operator})
      : assert(id != null),
        assert(first != null),
        assert(second != null),
        assert(operator != null);

  Problem.fromMap(Map<dynamic, dynamic> data)
      : id = "1337",
        first = data['first'],
        second = data['second'],
        operator = data['operator'].toString().toOperator();

  int answer() {
    switch (operator) {
      case Operator.MULTIPLY:
        return this.first * second;
        break;
      case Operator.DIVIDE:
        return first ~/ second;
        break;
      case Operator.ADD:
        return first + second;
        break;
      case Operator.SUBTRACT:
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
