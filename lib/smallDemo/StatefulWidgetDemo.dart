import 'package:flutter/material.dart';


class StatefulWidgetDemo extends State<DataContent> {
  int _counter = 0;



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
      appBar: AppBar(),
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
              ),
              RaisedButton(
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
      )),
    );
  }
}

class DataContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return StatefulWidgetDemo();
  }
}
