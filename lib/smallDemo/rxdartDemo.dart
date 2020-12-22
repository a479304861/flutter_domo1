import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class rxDartDemo extends StatefulWidget {
  @override
  _rxDartDemoState createState() => _rxDartDemoState();
}

class _rxDartDemoState extends State<rxDartDemo> {
  PublishSubject<String> subject=PublishSubject<String>();

  String _data="";

  @override
  void initState() {
    super.initState();
    // Observable<String> observable =
    //     Observable(Stream.fromIterable(["hello", "你好"]));
    // Observable<String> observable2 =
    //     Observable.fromFuture(Future.value("hello"));
    //
    // observable.listen(print);
    // observable2.listen((event) {
    //   print('$event');
    // });
    //
    // PublishSubject<String> subject = PublishSubject();
    //
    // subject.listen((event) {
    //   print('$event');
    // });
    // subject.add("hello");

    // BehaviorSubject<String> subject = BehaviorSubject();
    // subject.add("hello1");
    // subject.listen((event) {
    //   print('$event');
    // });
    // subject.add("hello2");

    // ReplaySubject<String> subject = ReplaySubject(maxSize: 1);
    // subject.add("hello1");
    // subject.add("hello2");
    // subject.listen((event) {
    //   print('$event');
    // });


    subject.debounce(Duration(milliseconds: 500)).listen((event) {
      setState(() {
        _data=event;
        print(event);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black12,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  subject.add(value);
                },
                decoration: InputDecoration(
                  filled: false,
                ),
              ),
              Text(_data)
            ],
          ),
        ),
      ),
    );
  }
}
