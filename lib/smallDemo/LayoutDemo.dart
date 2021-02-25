import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            //不加align无效
              alignment: Alignment(-1, -1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              )),
          Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red[200],
              )),
          Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(Size(100, 100)),
                child: LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints constraints) {
                      print(constraints);
                      return Container(
                        width: 50,
                        color: Colors.red[300],);
                    }
                ),
              )),
        ],
      ),
    );
  }
}
