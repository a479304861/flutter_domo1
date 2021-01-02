import 'package:flutter/material.dart';
import 'package:flutter_domo1/smallDemo/provider/MyViewModel.dart';
import 'package:flutter_domo1/smallDemo/provider/provider_widget.dart';


class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderDemo"),
      ),
      body: Column(
        children: [
          ProviderWidget<MyViewModel>(
            key: UniqueKey(),
            model: MyViewModel(),
            initState: (model) {
              model.load();
            },
            dispose: (_) {
              print("dispose");
            },
            builder: (BuildContext context, model, Widget child) {
              return Container(
                color: Colors.white38,
                child: Column(
                  children: [
                    Text("${model.count}"),
                    TextButton(
                      onPressed: () {
                        model.add();
                      },
                      child: Text("add"),
                    )
                  ],
                ),
              );
            },
            child: Text("hello"),
          ),
        ],
      ),
    );
  }
}
