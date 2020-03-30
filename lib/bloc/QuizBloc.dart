import 'dart:async';

import 'package:math_ninja/base/Bloc.dart';
import 'package:math_ninja/data/Quiz.dart';
import 'package:math_ninja/data/QuizRepository.dart';

class QuizBloc implements Bloc {
  QuizBloc(this._quizRepository);

  final QuizRepository _quizRepository;

  final _quizStreamController = StreamController<QuizState>();
  final _inputStreamController = StreamController<int>();

  Stream<QuizState> get quizStream => _quizStreamController.stream;
  Stream<int> get inputStream => _inputStreamController.stream;

  Quiz _quiz;
  String _currentInput = "";

  void loadQuizData() {
    _quizStreamController.sink.add(QuizState._quizLoading());
    _quizRepository.getQuiz().then((quiz) {
      //TODO
      this._quiz = quiz;
      _quizStreamController.sink.add(QuizState._quizData(quiz));
    });
  }

  void onInput(int newValue) {
    _inputStreamController.sink.add(newValue);
  }

  @override
  void dispose() {
    _quizStreamController.close();
    _inputStreamController.close();
  }

  void removeLastCharacter() {
    if (_currentInput.length == 0) return;
    _currentInput = _currentInput.substring(0, _currentInput.length - 1);
    _quizStreamController.sink.add(QuizState._quizData(_quiz, _currentInput));
  }

  void appendCharacter(String character) {
    _currentInput = _currentInput + character;
    _quizStreamController.sink.add(QuizState._quizData(_quiz, _currentInput));
  }

}

class QuizState {
  QuizState();
  factory QuizState._quizLoading() = QuizLoadingState;
  factory QuizState._quizData(Quiz quiz, [String input]) = QuizDataState;
}

class QuizInitState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizDataState extends QuizState {
  QuizDataState(this.quiz, [this.input]);
  final Quiz quiz;
  final String input;
}
