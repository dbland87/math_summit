import 'package:math_ninja/constants/OperatorEnum.dart';

import 'Quiz.dart';

class QuizRepository {
  Future<Quiz> getQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    return Quiz(operand: 5, operator: OperatorEnum.MULTIPLY, problems: null);
  }
}
