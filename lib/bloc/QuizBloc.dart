import 'dart:async';

import 'package:math_summit/base/Bloc.dart';
import 'package:math_summit/data/Problem.dart';
import 'package:math_summit/data/Quiz.dart';
import 'package:math_summit/data/QuizRepository.dart';

class QuizBloc implements Bloc {

  QuizBloc(this._quizRepository);

  final QuizRepository _quizRepository;

  final _quizStreamController = StreamController<QuizState>.broadcast();
  final _inputStreamController = StreamController<int>.broadcast();

  Stream<QuizState> get quizStream => _quizStreamController.stream;
  Stream<int> get inputStream => _inputStreamController.stream;

  Quiz _quiz;
  int _currentInput = null;
  Problem _currentProblem = null;

  void loadQuizData() {
    _quizStreamController.sink.add(QuizState._quizLoading());
    _quizRepository.getQuiz().then((quiz) {
      this._quiz = quiz;
      _quizRepository.getNextUnfinishedProblem().then((problem) {
        this._currentProblem = problem;
        _quizStreamController.sink.add(QuizState._quizData(_currentProblem));
      });
    });
  }

  void onInput(int newValue) {
    _currentInput = newValue;
    _inputStreamController.sink.add(_currentInput);
  }

  @override
  void dispose() {
    _quizStreamController.close();
    _inputStreamController.close();
  }

  onNextClicked() {
    _currentProblem.setResponse(_currentInput);
    if (!_quiz.isComplete()) {
      nextProblem();
    } else {
      _quizStreamController.sink.add(QuizState._quizComplete());
    }
  }

  void nextProblem() {
    _currentProblem = _quiz.nextUnfinishedProblem();
    _quizStreamController.sink.add(QuizState._quizData(_currentProblem));
  }

  void onProblemClicked(String id) {
    _quizRepository.getProblem(id).then((problem) {
      _quizStreamController.sink.add(QuizState._quizData(_currentProblem));
    });
  }
}

class QuizState {
  QuizState();
  factory QuizState._quizLoading() = QuizLoadingState;
  factory QuizState._quizData(Problem problem) = QuizDataState;
  factory QuizState._quizComplete() = QuizCompleteState;
}

class QuizInitState extends QuizState {}
class QuizLoadingState extends QuizState {}
class QuizCompleteState extends QuizState {}
class QuizDataState extends QuizState {
  QuizDataState(this.problem);
  final Problem problem;
}

