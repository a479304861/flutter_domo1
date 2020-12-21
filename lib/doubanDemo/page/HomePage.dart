import 'package:flutter/material.dart';
import 'package:flutter_domo1/doubanDemo/result/BaseResult.dart';
import '../http/api.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageWidgetState();
  }
}

class HomePageWidgetState extends State<HomePage> {
  BaseResult response;
  void hello() {
    Api.get("/checkUser").then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: hello,
      ));
  }
}
