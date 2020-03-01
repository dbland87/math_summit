import 'package:flutter/material.dart';

class PadKey extends StatelessWidget {
  final String _text;

  PadKey(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          _showSnackbar(context, _text);
        },
        child: SizedBox(
          height: 75.0,
          child: Center(
            child: Text(
             _text,
              style: TextStyle(
                fontSize: 24.0
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
//    Scaffold.of(context).showSnackBar(snackBar);
  }
}
