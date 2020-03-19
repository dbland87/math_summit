import 'package:flutter/material.dart';

import 'NumKey.dart';

class NumKeypadWidget extends StatelessWidget {

  final Function(int) onNumKeyPressed;

  NumKeypadWidget({@required this.onNumKeyPressed})

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "1", onKeyClicked: () => _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "2", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "3", onKeyClicked: _publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "4", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "5", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "6", onKeyClicked: _publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "7", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "8", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "9", onKeyClicked: _publishValue),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: NumKey(displayValue: "", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "0", onKeyClicked: _publishValue),
            ),
            Expanded(
              child: NumKey(displayValue: "⌫", onKeyClicked: _publishValue),
            ),
          ],
        ),
      ],
    );
  }

  void _publishValue({@required String value}) {
    switch(value) {
      case "⌫":
        break;
      case "0":
        break;
      case "1":
        break;
      case "2":
        break;
      case "3":
        break;
      case "4":
        break;
      case "5":
        break;
      case "6":
        break;
      case "7":
        break;
      case "8":
        break;
      case "9":
        break;
    }

  }
}
