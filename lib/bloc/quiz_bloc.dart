import 'dart:async';

import 'package:math_summit/base/bloc.dart';
import 'package:math_summit/models/Problem.dart';
import 'package:math_summit/models/Quiz.dart';
import 'package:math_summit/repositories/quiz_repository.dart';

class QuizBloc implements Bloc {

  QuizBloc(this._quizRepository);

  final QuizRepository _quizRepository;

  final _quizStreamController = StreamController<QuizState>.broadcast();
  final _inputStreamController = StreamController<int>.broadcast();

  Stream<QuizState> get quizStream => _quizStreamController.stream;
  Stream<int> get inputStream => _inputStreamController.stream;

  int _currentInput = null;
  Quiz _quiz;
  Problem _currentProblem = null;

  void loadQuizData() async {
    _quizStreamController.sink.add(QuizState._quizLoading());
    _quiz = await _quizRepository.getQuizById("9AGQVlgTGfUnhpWd1vZp");
    _currentProblem = _quiz.nextUnfinishedProblem();
    _quizStreamController.sink.add(QuizState._quizData(_quiz, _currentProblem));
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
    _quizStreamController.sink.add(QuizState._quizData(_quiz, _currentProblem));
  }
}

class QuizState {
  QuizState();
  factory QuizState._quizLoading() = QuizLoadingState;
  factory QuizState._quizComplete() = QuizCompleteState;
  factory QuizState._quizData(Quiz quiz, Problem currentProblem) = QuizDataState;

}

class QuizInitState extends QuizState {}
class QuizLoadingState extends QuizState {}
class QuizCompleteState extends QuizState {}
class QuizDataState extends QuizState {
  QuizDataState(this.quiz, this.problem);
  final Quiz quiz;
  final Problem problem;
}

