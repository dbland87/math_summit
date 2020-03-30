import 'package:flutter/material.dart';

class NumKey extends StatelessWidget {
  final String displayValue;
  final Function(String) callback;

  NumKey({@required this.displayValue, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () => callback(displayValue),
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
