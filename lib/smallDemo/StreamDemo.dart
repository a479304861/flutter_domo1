import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  StreamDemo({Key key}) : super(key: key);

  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  String _data="";

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print("create a stream.");
    _streamController = StreamController.broadcast();
    addDataToStream();
    print("start listen.");
    _streamSubscription = _streamController.stream.listen((data) {
      print("one+$data");
      setState(() {
        _data = data;
      });
    }, onError: (e) {
      print('$e');
    }, onDone: () {
      print('down');
    });
    _streamController.stream.listen((data) {
      print("two+$data");
    });
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));

    return "hello";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               StreamBuilder(
                 stream: _streamController.stream,
                 initialData: "..",
                 builder: (context,snapshot){
                   return Text(snapshot.data);
                 },
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("add"),
                      onPressed: () {
                        print('add subscription');
                        addDataToStream();
                      },
                    ),
                    RaisedButton(
                      child: Text("pause"),
                      onPressed: () {
                        print('pause subscription');
                        _streamSubscription.pause();
                      },
                    ),
                    RaisedButton(
                      child: Text("resume"),
                      onPressed: () {
                        print('resume subscription');
                        _streamSubscription.resume();
                      },
                    ),
                    RaisedButton(
                      child: Text("cancel"),
                      onPressed: () {
                        print('cancel subscription');
                        _streamSubscription.cancel();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addDataToStream() async {
    String value = await fetchData();
    _streamController.add(value);
  }
}
