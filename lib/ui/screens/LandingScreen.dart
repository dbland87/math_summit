import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing Screen"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Text("Take Quiz"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
