import 'package:flutter/material.dart';
import 'package:flutter_domo1/smallDemo/ListViewDemo.dart';

class BSCurve extends StatefulWidget {
  @override
  _BSCurveState createState() => _BSCurveState();
}

class _BSCurveState extends State<BSCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(height: 300, color: Colors.red),
            ),
            ClipRRect(
              clipper: MyRRctClipper(),
              child: Container(height: 300, color: Colors.red),
            ),
            ClipOval(
              clipper: MyOvalClipper(),
              child: Container(height: 300, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

class MyOvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    var rect = Rect.fromCenter(
        width: 200,
        height: 300,
        center: Offset(size.width / 2, size.height / 2));
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class MyRRctClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    // RRect rect = RRect.fromLTRBR(0, 0, 200, 300, Radius.circular(100));
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
            width: 200,
            height: 300,
            center: Offset(size.width / 2, size.height / 2)),
        Radius.circular(5));
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2);
    var first = Offset(size.width / 4, size.height);
    var second = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(first.dx, first.dy, second.dx, second.dy);
    var third = Offset(size.width * 3 / 4, 0);
    var forth = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(third.dx, third.dy, forth.dx, forth.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
