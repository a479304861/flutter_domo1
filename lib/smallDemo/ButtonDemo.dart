import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                print("RaisedButton");
              },
              child: Text("RaisedButton"),
            ),
            FlatButton(
              onPressed: () {
                print("FlatButton");
              },
              child: Text("FlatButton"),
            ),
            OutlineButton(
              onPressed: () {
                print("OutlineButton");
              },
              child: Text("OutlineButton"),
            ),
            FloatingActionButton(
              onPressed: () {
                print("FloatingActionButton");
              },
              child: Icon(Icons.add),
            ),
            RaisedButton(
              onPressed: () {
                print("RaisedButton");
              },
              child: Text("RaisedButton"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }
}
