import 'package:flutter/material.dart';

import '../main/main.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), iconTheme: IconThemeData()),
      body: DataContent(),
    );
  }
}

class DataContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Image.network(
            "https://upload-images.jianshu.io/upload_images/11572843-890c90abdda98c0a.png?imageMogr2/auto-orient/strip|imageView2/2/w/300/format/webp",
            repeat: ImageRepeat.repeatY,
          )

      ),


    );
  }
}
