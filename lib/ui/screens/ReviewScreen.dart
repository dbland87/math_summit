import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/providers/BlockProvider.dart';
import 'package:math_ninja/ui/Problem/ProblemWidget.dart';
import 'package:math_ninja/ui/keypad/KeypadWidget.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Screen'),
      ),
    );
  }
}
