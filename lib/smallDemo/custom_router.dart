import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                  child: Text("to second"),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     CustomRoute(oldWidget: this, newWidget: SecondPage()));
                    Navigator.of(context).push(RippleRoute(
                        SecondPage(), RouteConfig.fromContext(context)));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second"),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("pop"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRoute extends PageRouteBuilder {
  final Widget newWidget;
  final Animation<double> animation;

  CustomRoute({@required this.animation, @required this.newWidget})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: _transitionsBuilder1,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return newWidget;
            });

  static Widget _transitionsBuilder1(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    //渐隐
    // return FadeTransition(
    //   opacity: Tween(begin: 0.0, end: 1.0).animate(
    //       CurvedAnimation(parent: animation,curve:  Curves.fastOutSlowIn)),
    //   child: child,
    // );

    //旋转
    // return ScaleTransition(
    //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: animation,
    //       curve: Curves.bounceInOut
    //   )),
    //   child: child,
    // );

    //旋转缩放
    // return RotationTransition(
    //   turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //       parent: animation, curve: Curves.fastOutSlowIn)),
    //   child: ScaleTransition(
    //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: animation, curve: Curves.fastOutSlowIn)),
    //     child: child,
    //   ),
    // );

    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 0.0), end: Offset(0, 0.0))
          .animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
      child: child,
    );
  }
}

class RouteConfig {
  Offset offset;
  double circleRadius;

  RouteConfig.fromContext(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject();
    offset = renderBox.localToGlobal(renderBox.size.center(Offset.zero));
    if (offset.dx > MediaQuery.of(context).size.width / 2) {
      if (offset.dy > MediaQuery.of(context).size.height / 2) {
        circleRadius = sqrt(pow(offset.dx, 2) + pow(offset.dy, 2)).toDouble();
      } else {
        circleRadius = sqrt(pow(offset.dx, 2) +
                pow(MediaQuery.of(context).size.height - offset.dy, 2))
            .toDouble();
      }
    }
    if (offset.dx <= MediaQuery.of(context).size.width / 2) {
      if (offset.dy > MediaQuery.of(context).size.height / 2) {
        circleRadius = sqrt(
                pow(MediaQuery.of(context).size.width - offset.dx, 2) +
                    pow(offset.dy, 2))
            .toDouble();
      } else {
        circleRadius = sqrt(
                pow(MediaQuery.of(context).size.width - offset.dx, 2) +
                    pow(MediaQuery.of(context).size.height - offset.dy, 2))
            .toDouble();
      }
    }
  }
}

// double circleRadius
class RippleRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteConfig routeConfig;

  RippleRoute(this.widget, this.routeConfig)
      : super(
          // 设置过度时间
          transitionDuration: Duration(seconds: 1),
          // 构造器
          pageBuilder: (
            // 上下文和动画
            BuildContext context,
            Animation<double> animation,
            Animation<double> _,
          ) {
            return widget;
          },
          opaque: false,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> _,
            Widget child,
          ) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: routeConfig.offset.dy -
                      routeConfig.circleRadius * animation.value,
                  left: routeConfig.offset.dx -
                      routeConfig.circleRadius * animation.value,
                  child: SizedBox(
                    height: routeConfig.circleRadius * 2 * animation.value,
                    width: routeConfig.circleRadius * 2 * animation.value,
                    child: ClipOval(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: routeConfig.circleRadius * animation.value -
                                routeConfig.offset.dy,
                            left: routeConfig.circleRadius * animation.value -
                                routeConfig.offset.dx,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: child,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
}
