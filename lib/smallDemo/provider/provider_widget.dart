import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) initState;
  final Function(T) dispose;
  final T model;
  Key key;

  ProviderWidget(
      {this.child,
      this.builder,
      this.initState,
      this.model,
      this.dispose,
      this.key})
      : super(key: key);

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    if (widget.initState != null) {
      widget.initState(widget.model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose(widget.model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (_) => widget.model,
    );
  }
}
