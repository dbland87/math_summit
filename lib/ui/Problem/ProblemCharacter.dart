import 'package:flutter/material.dart';

class ProblemCharacter extends StatelessWidget {

  final String character;

  ProblemCharacter({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Text(
      character,
      style: TextStyle(fontSize: 50),
    );
  }
}
