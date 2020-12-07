import 'package:flutter/material.dart';



class DataContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Image.network(
          "https://upload-images.jianshu.io/upload_images/11572843-890c90abdda98c0a.png?imageMogr2/auto-orient/strip|imageView2/2/w/300/format/webp",
        )),
        Image.asset("assets/image/下载.jpg"),
        ClipOval(
            child: Image.asset(
          "assets/image/下载.jpg",

        )),
      ],
    );
  }
}
