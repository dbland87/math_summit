import 'dart:async';

import 'package:math_ninja/data/Quiz.dart';
import 'package:math_ninja/data/QuizRepository.dart';

class QuizBloc {
  QuizBloc(this._quizRepository);

  final QuizRepository _quizRepository;

  final _quizStreamController = StreamController<QuizState>();

  Stream<QuizState> get quiz => _quizStreamController.stream;

  void loadQuizData() {
    _quizStreamController.sink.add(QuizState._quizLoading());
    _quizRepository.getQuiz().then((quiz) {
      _quizStreamController.sink.add(QuizState._quizData(quiz));
    });
  }

  void dispose() {
    _quizStreamController.close();
  }
}

class QuizState {
  QuizState();
  factory QuizState._quizLoading() = QuizLoadingState;
  factory QuizState._quizData(Quiz quiz, [int input]) = QuizDataState;
}

class QuizInitState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizDataState extends QuizState {
  QuizDataState(this.quiz, [this.input]);
  final Quiz quiz;
  final int input;
}
