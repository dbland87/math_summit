import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/operator_enums.dart';
import 'package:math_summit/models/Problem.dart';
import 'package:math_summit/models/Quiz.dart';
import 'package:math_summit/providers/firestore_provider.dart';
import 'package:uuid/uuid.dart';

class QuizRepository {
  FirestoreProvider _firestoreProvider = FirestoreProvider();

  //TODO This shouldn't be assigned here
  static final uuid = Uuid();

  Quiz _quiz;

//  Future<Quiz> getQuiz() async {
//    await Future.delayed(Duration(seconds: 1));
//    _quiz = Quiz(
//        operand: 2, operator: Operators.DIVIDE, problems: _createProblems());
//    return _quiz;
//  }

  Future<Quiz> getQuizById(String id) async {
    _firestoreProvider.getQuizById(id).then((quiz) {
      this._quiz = quiz;
      return quiz;
    });
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

    return new List.from([problem1, problem2, problem3, problem4]);
  }
}
