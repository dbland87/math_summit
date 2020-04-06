import 'dart:async';

import 'package:math_ninja/base/Bloc.dart';
import 'package:math_ninja/constants/QuizConstants.dart';
import 'package:math_ninja/data/Quiz.dart';
import 'package:math_ninja/data/QuizRepository.dart';
import 'package:math_ninja/extensions/StringExtensions.dart';

class QuizBloc implements Bloc {
  QuizBloc(this._quizRepository);

  final QuizRepository _quizRepository;

  final _problemStreamController = StreamController<ProblemState>();
  final _inputStreamController = StreamController<int>();

  Stream<ProblemState> get problemStream => _problemStreamController.stream;
  Stream<int> get inputStream => _inputStreamController.stream;

  Quiz _quiz;
  String _currentInput = "";

  void loadQuizData() {
    _problemStreamController.sink.add(ProblemState._quizLoading());
    _quizRepository.getQuiz().then((quiz) {
      //TODO
      this._quiz = quiz;
      _problemStreamController.sink.add(ProblemState._problemData(quiz));
    });
  }

  void onInput(int newValue) {
    _inputStreamController.sink.add(newValue);
  }

  @override
  void dispose() {
    _problemStreamController.close();
    _inputStreamController.close();
  }

  void nextProblem() {}

  void onNewInputValue(String value) {
    switch (value) {
      case "⌫":
        removeLastCharacter();
        break;
      case "Next":
        nextProblem();
        break;
      default:
        appendCharacter(value);
        break;
    }
  }

  void removeLastCharacter() {
    if (_currentInput.length == 0) return;
    _currentInput = _currentInput.substring(0, _currentInput.length - 1);
    _problemStreamController.sink.add(ProblemState._problemData(_quiz, _currentInput));
  }

  void appendCharacter(String character) {
    if (!(_currentInput + character).isValidAnswerInput()) return;
    _currentInput = _currentInput + character;
    _problemStreamController.sink.add(ProblemState._problemData(_quiz, _currentInput));
  }

  void onNewAnswerInput(int newAnswer) {

  }

  onNextClicked() {

  }
}

class ProblemState {
  //TODO this needs to send only problem data
  //TODO need a separate stream for input
  ProblemState();
  factory ProblemState._quizLoading() = ProblemLoadingState;
  factory ProblemState._problemData(Quiz quiz, [String input, int answer]) =
      ProblemDataState;
}

class ProblemInitState extends ProblemState {}

class ProblemLoadingState extends ProblemState {}

class ProblemDataState extends ProblemState {
  ProblemDataState(this.quiz, [this.input, this.answer]);
  final Quiz quiz;
  final String input;
  final int answer;
}
