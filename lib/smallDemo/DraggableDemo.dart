import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  final Offset offset;
  final Color color;

  const DraggableDemo({Key key, this.offset, this.color}) : super(key: key);

  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Offset _offset = Offset(1, 2);
  Color _color = Colors.red;

  @override
  void initState() {
    _offset = widget.offset;
    _color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: Draggable(
            onDraggableCanceled: (Velocity velocity, Offset offset) {},
            data: _color,
            feedback: Container(
              width: 50,
              height: 50,
              color: _color,
            ),
            child: Container(
              width: 100,
              height: 100,
              color: _color,
            ),
          ),
        ),
      ),
    );
  }
}
