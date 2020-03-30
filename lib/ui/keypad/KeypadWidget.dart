import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/providers/BlockProvider.dart';

import 'NumKey.dart';

class KeypadWidget extends StatelessWidget {

  final QuizBloc bloc;

  KeypadWidget({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "1", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "2", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "3", callback: publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "4", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "5", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "6", callback: publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "7", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "8", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "9", callback: publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "0", callback: publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "⌫", callback: publishValue),
            ),
          ],
        ),
      ],
    );
  }

  void publishValue(String value) {
    switch (value) {
      case "⌫":
        bloc.removeLastCharacter();
        break;
      default:
        bloc.appendCharacter(value);
        break;
    }
  }
}
