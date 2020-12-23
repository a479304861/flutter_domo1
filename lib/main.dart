import 'package:flutter/material.dart';
import 'package:flutter_domo1/smallDemo/BlocDemo.dart';
import 'package:flutter_domo1/smallDemo/ButtonDemo.dart';
import 'package:flutter_domo1/smallDemo/DateTimeDemo.dart';
import 'package:flutter_domo1/smallDemo/HeroDemo.dart';
import 'package:flutter_domo1/smallDemo/ImageDemo.dart';
import 'package:flutter_domo1/smallDemo/ListViewDemo.dart';
import 'package:flutter_domo1/smallDemo/StreamDemo.dart';
import 'package:flutter_domo1/smallDemo/TextFieldDemo.dart';
import 'package:flutter_domo1/smallDemo/TextSpanDemo.dart';
import 'package:flutter_domo1/smallDemo/custom_router.dart';
import 'package:flutter_domo1/smallDemo/rxdartDemo.dart';
import 'package:flutter_domo1/smallDemo/searchDemo.dart';
import 'smallDemo/FormFieldDemo.dart';

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
      routes: routers,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: routers.length,
            itemBuilder: (BuildContext context, int index) {
              return RaisedButton(
                child: Text(routers.keys.elementAt(index)),
                onPressed: () =>
                    Navigator.pushNamed(context, routers.keys.elementAt(index)),
              );
            }));
  }
}

Map<String, WidgetBuilder> routers = {
  "FormFieldDemo": (BuildContext content) => FormFieldDemo(),
  "ImageDemo": (BuildContext content) => ImageDemo(),
  "ListViewDemo": (BuildContext content) => ListViewDemo(),
  "TextFieldDemo": (BuildContext content) => TextFieldDemo(),
  "TextSpanDemo": (BuildContext content) => TextSpanDemo(),
  "DateTimeDemo": (BuildContext content) => DateTimeDemo(),
  "ButtonDemo": (BuildContext content) => ButtonDemo(),
  "StreamDemo": (BuildContext content) => StreamDemo(),
  "rxdartDemo": (BuildContext content) => rxDartDemo(),
  "BlocDemo": (BuildContext content) => BlocDemo(),
  "FirstPage": (BuildContext content) => FirstPage(),
  "MainScreen": (BuildContext content) => MainScreen(),
  "SearchDemo": (BuildContext content) => SearchDemo(),
};
