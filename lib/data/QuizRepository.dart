import 'Quiz.dart';

class QuizRepository {
  Future<Quiz> getQuiz() async {
    await Future.delayed(Duration(seconds: 2));
    return Quiz(operand: 5, operator: "multiply");
  }
}
