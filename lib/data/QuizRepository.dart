import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/OperatorEnum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:math_summit/data/Problem.dart';
import 'package:uuid/uuid.dart';

import 'Quiz.dart';

class QuizRepository {
  //TODO This shouldn't be assigned here
  static final uuid = Uuid();

  Quiz _quiz;

  Future<Quiz> getQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    _quiz = Quiz(
        operand: 2, operator: Operators.DIVIDE, problems: _createProblems());
    return _quiz;
  }

  Future<Problem> getNextUnfinishedProblem() async {
    return _quiz.nextUnfinishedProblem();
  }

  Future<Problem> getProblem(String id) async {
    return _quiz.problems.firstWhere((problem) => problem.id == id);
  }

  List<Problem> _createProblems() {
    final Problem problem1 =
        Problem(id: uuid.v4(), first: 1, second: 2, operator: Operators.DIVIDE);
    final Problem problem2 =
        Problem(id: uuid.v4(), first: 2, second: 2, operator: Operators.ADD);
    final Problem problem3 = Problem(
        id: uuid.v4(), first: 3, second: 2, operator: Operators.SUBTRACT);
    final Problem problem4 = Problem(
        id: uuid.v4(), first: 4, second: 2, operator: Operators.MULTIPLY);

    Firestore.instance
        .collection('quiz')
        .where("userId", isEqualTo: "RsikNdYsKeSlsQuTPbzM")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
      });
    });

    return new List.from([problem1, problem2, problem3, problem4]);
  }
}
