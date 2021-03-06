import 'package:flutter/material.dart';




class TextSpanDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "定风波",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: "苏轼",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
