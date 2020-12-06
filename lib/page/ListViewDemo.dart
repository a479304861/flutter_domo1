import 'package:flutter/material.dart';

import '../main/main.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            DataContent("hello", "hello",
                "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
            DataContent("hello1", "hell1o",
                "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
            DataContent("hell1o", "hel12o",
                "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
          ],
        ),
      )),
    );
  }
}

class DataContent extends StatelessWidget {
  final String subtitle;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2
        )
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 28),
          ),
          Text(subtitle),
          Image.network(imageUrl),
        ],
      ),
    );
  }

  DataContent(this.title, this.subtitle, this.imageUrl);
}
