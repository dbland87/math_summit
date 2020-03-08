import 'package:flutter/material.dart';
import 'package:math_ninja/data/QuizRepository.dart';
import 'package:math_ninja/ui/screens/QuizScreen.dart';

import 'ui/screens/LandingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final QuizRepository _quizRepository = QuizRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'math_ninja',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/quiz': (context) => QuizScreen(_quizRepository),
      },
    );
  }
}

