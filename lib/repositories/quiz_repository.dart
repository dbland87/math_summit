import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/operator.dart';
import 'package:math_summit/models/Problem.dart';
import 'package:math_summit/models/Quiz.dart';
import 'package:math_summit/providers/firestore_provider.dart';
import 'package:uuid/uuid.dart';

class QuizRepository {
  FirestoreProvider _firestoreProvider = FirestoreProvider();

  //TODO This shouldn't be assigned here
  static final uuid = Uuid();



  Future<Quiz> getQuizById(String id) {
    return _firestoreProvider.getQuizById(id);
  }
}
