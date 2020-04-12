import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_ninja/lib/enums/OperatorEnum.dart';
import 'package:math_ninja/data/Problem.dart';
import 'package:uuid/uuid.dart';

import 'Quiz.dart';

class QuizRepository {

  //TODO This shouldn't be assigned here
  static final uuid = Uuid();

  static final Problem problem1 = Problem(id: uuid.v4(), first: 1, second: 2, operator: Operators.DIVIDE);
  static final Problem problem2 = Problem(id: uuid.v4(), first: 2, second: 2, operator: Operators.ADD);
  static final Problem problem3 = Problem(id: uuid.v4(), first: 3, second: 2, operator: Operators.SUBTRACT);
  static final Problem problem4 = Problem(id: uuid.v4(), first: 4, second: 2, operator: Operators.MULTIPLY);

  static final List<Problem> problemList = new List.from([problem1, problem2, problem3, problem4]);

  Quiz _quiz = Quiz(operand: 2, operator: Operators.DIVIDE, problems: problemList);

  Future<Quiz> getQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    return _quiz;
  }

  Future<Problem> getNextUnfinishedProblem() async {
    return _quiz.nextUnfinishedProblem();
  }

  Future<Problem> getProblem(String id) async {
    return _quiz.problems.firstWhere((problem) => problem.id == id);
  }
}
