import 'package:flutter/material.dart';
import 'package:flutter_domo1/smallDemo/BSCurve.dart';
import 'package:flutter_domo1/smallDemo/BlocDemo.dart';
import 'package:flutter_domo1/smallDemo/ButtonDemo.dart';
import 'package:flutter_domo1/smallDemo/DateTimeDemo.dart';
import 'package:flutter_domo1/smallDemo/DefaultTabControllerDemo.dart';
import 'package:flutter_domo1/smallDemo/EasyLoading.dart';
import 'package:flutter_domo1/smallDemo/ExpansionTileDemo.dart';
import 'package:flutter_domo1/smallDemo/HeroDemo.dart';
import 'package:flutter_domo1/smallDemo/ImageDemo.dart';
import 'package:flutter_domo1/smallDemo/ListViewDemo.dart';
import 'package:flutter_domo1/smallDemo/RightBackDemo.dart';
import 'package:flutter_domo1/smallDemo/SplashScreen.dart';
import 'package:flutter_domo1/smallDemo/StreamDemo.dart';
import 'package:flutter_domo1/smallDemo/TextFieldDemo.dart';
import 'package:flutter_domo1/smallDemo/TextSpanDemo.dart';
import 'package:flutter_domo1/smallDemo/TooltipDemo.dart';
import 'package:flutter_domo1/smallDemo/WarpDemo.dart';
import 'package:flutter_domo1/smallDemo/Custom_router.dart';
import 'package:flutter_domo1/smallDemo/RxdartDemo.dart';
import 'package:flutter_domo1/smallDemo/SearchDemo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Channel/Android_back.dart';
import 'smallDemo/FormFieldDemo.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      //多应用程序切换的标题
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
      routes: routers,
      builder: EasyLoading.init(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AndroidBackTop.backDeskTop(); //设置为返回不退出app
        return false;
      },
      child: Scaffold(
          body: ListView.builder(
              itemCount: routers.length,
              itemBuilder: (BuildContext context, int index) {
                return RaisedButton(
                  child: Text(routers.keys.elementAt(index)),
                  onPressed: () => Navigator.pushNamed(
                      context, routers.keys.elementAt(index)),
                );
              })),
    );
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
  "HeroDemo": (BuildContext content) => HeroDemo(),
  "SearchDemo": (BuildContext content) => SearchDemo(),
  "WarpDemo": (BuildContext content) => WrapDemo(),
  "ExpansionTileDemo": (BuildContext content) => ExpansionTileDemo(),
  "BSCurve": (BuildContext content) => BSCurve(),
  "RightBackDemo": (BuildContext content) => RightBackDemo(),
  "TooltipDemo": (BuildContext content) => TooltipDemo(),
  "TabControllerDemo": (BuildContext content) => DefaultTabControllerDemo(),
  "EasyLoadingDemo": (BuildContext content) => EasyLoadingDemo(),
};
