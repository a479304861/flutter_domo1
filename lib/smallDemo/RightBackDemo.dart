import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightBackDemo extends StatefulWidget {
  @override
  _RightBackDemoState createState() => _RightBackDemoState();
}

class _RightBackDemoState extends State<RightBackDemo> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => RightBackDemo()));
            },
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
