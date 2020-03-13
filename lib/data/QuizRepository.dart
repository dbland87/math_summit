import 'package:math_ninja/constants/OperatorEnum.dart';
import 'package:math_ninja/data/Problem.dart';

import 'Quiz.dart';

class QuizRepository {

  static final Problem problem1 = Problem(first: 1, second: 2, operator: OperatorEnum.DIVIDE);
  static final Problem problem2 = Problem(first: 2, second: 2, operator: OperatorEnum.DIVIDE);
  static final Problem problem3 = Problem(first: 3, second: 2, operator: OperatorEnum.DIVIDE);
  static final Problem problem4 = Problem(first: 4, second: 2, operator: OperatorEnum.DIVIDE);

  static final List<Problem> problemList = new List.from([problem1, problem2, problem3, problem4]);

  Quiz quiz = Quiz(operand: 2, operator: OperatorEnum.DIVIDE, problems: problemList);

  Future<Quiz> getQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    return quiz;
  }
}
