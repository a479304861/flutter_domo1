import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;

  @override
  void initState() {
    list = List.generate(1, (index) => buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: width,
          height: height / 2,
          color: Color(0xff555555),
          child: Wrap(
            children: list,
            spacing: 26.0,
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(() {});
        list.add(GestureDetector(
          onTap: (){

          },
          child: Container(
              padding: EdgeInsets.all(8.0),
              width: 80.0,
              height: 80.0,
              color: Colors.redAccent,
              child: Text("hello")),
        ));
      },
      child: Container(
          padding: EdgeInsets.all(8.0),
          width: 80.0,
          height: 80.0,
          color: Colors.redAccent,
          child: Text("hello")));
  }
}
