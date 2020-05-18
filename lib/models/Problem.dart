import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/operator_enums.dart';

class Problem {
  final String id;
  final int first;
  final int second;
  final Operators operator;
  int _response = null;

  Problem(
      {@required this.id, @required this.first, @required this.second, @required this.operator})
      : assert(id != null),
        assert(first != null),
        assert(second != null),
        assert(operator != null);

//  factory Problem.fromFirestore(DocumentSnapshot doc) {
//    Map data = doc.data;
//
//    return Problem(
//      first: data['first'],
//      second: data['second'],
//      operator: data['operator']
//    );
//  }

  Problem.fromMap(Map<dynamic, dynamic> data)
      : id = "1337",
        first = data['first'],
        second = data['second'],
        operator = Operators.MULTIPLY;

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
