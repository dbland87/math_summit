import 'package:flutter/material.dart';

import 'Key.dart';

class KeypadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: PadKey("1"),
            ),
            Expanded(
              child: PadKey("2"),
            ),
            Expanded(
              child: PadKey("3"),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: PadKey("4"),
            ),
            Expanded(
              child: PadKey("5"),
            ),
            Expanded(
              child: PadKey("6"),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: PadKey("7"),
            ),
            Expanded(
              child: PadKey("8"),
            ),
            Expanded(
              child: PadKey("9"),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: PadKey(""),
            ),
            Expanded(
              child: PadKey("0"),
            ),
            Expanded(
              child: PadKey("⌫"),
            ),
          ],
        ),
      ],
    );
  }
}
