import 'package:flutter/material.dart';

class NumKey extends StatelessWidget {
  final String displayValue;
  final VoidCallback onKeyClicked;

  NumKey({@required this.displayValue, @required this.onKeyClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () => onKeyClicked,
        child: SizedBox(
          height: 75.0,
          child: Center(
            child: Text(
              displayValue,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
