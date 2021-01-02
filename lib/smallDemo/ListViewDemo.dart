import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("hello"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text("$index");
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class ContainWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(width: 2)),
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
      ),
    );
  }

  ContainWidget(this.title, this.subtitle, this.imageUrl);
}
