import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/operator_enums.dart';
import 'Problem.dart';

class Quiz {
//  final int operand;
//  final Operators operator;
  final List<Problem> problems;

  Quiz(
//      {@required this.operand,
//      @required this.operator,
      {@required this.problems})
//      : assert(operand != null),
//        assert(operator != null),
       : assert(problems != null && problems.isNotEmpty);

  factory Quiz.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Quiz(
      problems: data['problems'].map<Problem>((problem) {
        return Problem.fromMap(problem);
      }).toList());
  }

  bool isComplete() {
    return !problems.any((problem) => !problem.isComplete());
  }

  Problem nextUnfinishedProblem() {
    return problems.firstWhere((problem) => !problem.isComplete());
  }
}
