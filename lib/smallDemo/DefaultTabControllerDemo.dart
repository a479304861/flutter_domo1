import 'package:flutter/material.dart';

class DefaultTabControllerDemo extends StatefulWidget {
  @override
  _DefaultTabControllerDemoState createState() =>
      _DefaultTabControllerDemoState();
}

class _DefaultTabControllerDemoState extends State<DefaultTabControllerDemo> {
  List<String> _list = ["@我", "评论", "私信"];
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _list.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          brightness: Brightness.light,
          toolbarOpacity: 0.5,
          bottomOpacity: 1,
          toolbarHeight: 50,
          bottom: TabBar(
            tabs: _list.map((title) => Tab(text: title)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("暂无内容"),
            ),
            Center(
              child: Text("暂无内容"),
            ),
            Center(
              child: Text("暂无内容"),
            ),
          ],
        ),
      ),
    );
  }
}
