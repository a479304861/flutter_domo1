import 'package:flutter/material.dart';

import '../main/main.dart';

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _incrementCounter() {
    setState(() {
      _counter++;
    });
    return "123";
  }

  @override
  void initState() {
    print("initState!!!!!!!!!!!!!!!!!!!!!!!!!");
    super.initState();
  }

  @override
  void dispose() {
    print("dispose!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          iconTheme:IconThemeData()
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("你点击的次数"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    _counter++;
                    print("hhe");
                    setState(() {});
                  },
                  child: Icon(Icons.add),
                ), RaisedButton(
                  onPressed: () {
                    _counter--;
                    setState(() {});
                  },
                  child: Icon(Icons.arrow_back_rounded),
                ),
              ],
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 20,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  hello() {}
}
