import 'package:flutter/material.dart';
import 'package:flutter_domo1/doubanDemo/page/HomePage.dart';
import 'package:flutter_domo1/doubanDemo/page/MePage.dart';
import 'package:flutter_domo1/doubanDemo/page/MusicPage.dart';
import 'package:flutter_domo1/doubanDemo/page/SearchPage.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo", //多应用程序切换的标题
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStackPageState();
  }
}

class MyStackPageState extends State<MyStackPage> {
  List<BottomNavigationBarItem> list = new List<BottomNavigationBarItem>();
  int _curIndex;

  @override
  void initState() {
    super.initState();
    list.add(BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"));
    list.add(BottomNavigationBarItem(
        icon: Icon(Icons.find_replace_sharp), label: "搜索"));
    list.add(
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "音乐"));
    list.add(
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "我的"));
    _curIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: list,
          currentIndex: _curIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blue,
          onTap: (int index) {
            setState(() {
              _curIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _curIndex,
          children: [HomePage(), SearchPage(), MusicPage(), MePage(),],
        ));
  }
}
