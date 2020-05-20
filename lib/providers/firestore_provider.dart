import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:math_summit/models/Quiz.dart';

class FirestoreProvider {
  static const COLLECTION_USER = "user";
  static const COLLECTION_QUIZ = "quiz";

  Future<Quiz> getQuizById(String id) async {
    DocumentSnapshot doc =
        await Firestore.instance
            .collection(COLLECTION_QUIZ)
            .document(id)
            .get();

    return Quiz.fromFirestore(doc);
  }
}
