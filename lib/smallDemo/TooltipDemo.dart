import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TooltipDemo extends StatefulWidget {
  @override
  _TooltipDemoState createState() => _TooltipDemoState();
}

class _TooltipDemoState extends State<TooltipDemo> {
  void tip() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Tooltip(
                message: '你好',
                child: Text("hello"),
              ),
              RaisedButton(
                onPressed: (){
                  Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                },
                child: Text("show toast"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
