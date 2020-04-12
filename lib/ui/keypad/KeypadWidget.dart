import 'package:flutter/material.dart';
import 'package:math_ninja/bloc/QuizBloc.dart';
import 'package:math_ninja/providers/BlockProvider.dart';
import 'package:math_ninja/extensions/StringExtensions.dart';

import 'NumKey.dart';

class KeypadWidget extends StatelessWidget {

  final QuizBloc bloc;
  String _currentInputValue = "";

  KeypadWidget({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "1", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "2", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "3", callback: onNewValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "4", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "5", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "6", callback: onNewValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "7", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "8", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "9", callback: onNewValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "Next", callback: onNextClicked),
            ),
            Expanded(
              child: NumKey(displayValue: "0", callback: onNewValue),
            ),
            Expanded(
              child: NumKey(displayValue: "⌫", callback: onNewValue),
            ),
          ],
        ),
      ],
    );
  }

  void clear() {
    _currentInputValue = "";
    bloc.onInput(null);
  }

  void onNewValue(String value) {
    switch (value) {
      case "⌫":
        if (_currentInputValue.length == 0) return;
        _currentInputValue = _currentInputValue.substring(0, _currentInputValue.length - 1);
        break;
      default:
        if (!(_currentInputValue + value).isValidAnswerInput()) return;
        _currentInputValue =  _currentInputValue + value;
        break;
    }
    if (_currentInputValue != "") {
      bloc.onInput(int.parse(_currentInputValue));
    } else {
      bloc.onInput(null);
    }
  }

  void onNextClicked(String value) {
    bloc.onNextClicked();
    clear();
  }
}
