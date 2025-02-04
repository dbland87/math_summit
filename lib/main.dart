import 'package:flutter/material.dart';
import 'package:math_summit/providers/bloc_provider.dart';
import 'package:math_summit/repositories/quiz_repository.dart';
import 'package:math_summit/ui/screens/QuizScreen.dart';
import 'package:math_summit/ui/screens/ReviewScreen.dart';

import 'bloc/quiz_bloc.dart';
import 'ui/screens/LandingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final QuizRepository _quizRepository = QuizRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'math_summit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/quiz': (context) => BlocProvider<QuizBloc>(
            bloc: QuizBloc(_quizRepository),
            child: QuizScreen()),
        '/review': (context) => ReviewScreen(),
      },
    );
  }
}
