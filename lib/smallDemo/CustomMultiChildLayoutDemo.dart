import 'package:flutter/material.dart';

class CustomMultiChildLayoutDemo extends StatefulWidget {
  @override
  _CustomMultiChildLayoutDemoState createState() =>
      _CustomMultiChildLayoutDemoState();
}

class _CustomMultiChildLayoutDemoState
    extends State<CustomMultiChildLayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: MyMultiChildLayoutDelegate(),
      children: [
        LayoutId(
            id: 1,
            child: FlutterLogo(
              size: 100,
            )),
        LayoutId(id: 2, child: Text("heloo")),
        LayoutId(id: 3, child: FlutterLogo()),
      ],
    );
  }
}

class MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size size1, size2;
    if (hasChild(1)) {
      size1 = layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, Offset(0, 0));
    }

    if (hasChild(2)) {
      size2 = layoutChild(2, BoxConstraints.loose(size));
      positionChild(2, Offset(size1.width, size1.height));
    }
    if (hasChild(3)) {
      layoutChild(3, BoxConstraints.loose(Size(100, 100)));
      positionChild(3, Offset(size2.width, size2.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
