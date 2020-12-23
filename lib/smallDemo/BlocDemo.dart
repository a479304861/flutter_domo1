import 'dart:async';

import 'package:flutter/material.dart';

/// 业务逻辑组件
class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        body: CounterPage(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc counterBloc;

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    counterBloc.disponst();
  }

  @override
  Widget build(BuildContext context) {
    counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text("${snapshot.data}"),
            onPressed: () {
              counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        counterBloc.streamController.add(1);
      },
    );
  }
}

class CounterBloc {
  CounterBloc() {
    streamController.stream.listen((data) {
      print(data);
      _count = data + _count;
      counterController.add(_count);
    });
  }

  int _count = 0;
  final StreamController<int> streamController = StreamController();

  StreamSink<int> get counter => streamController.sink;
  final StreamController<int> counterController = StreamController();

  Stream<int> get count => counterController.stream;

  void disponst() {
    streamController.close();
    counterController.close();
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({
    this.child,
    this.bloc,
    Key key,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}
