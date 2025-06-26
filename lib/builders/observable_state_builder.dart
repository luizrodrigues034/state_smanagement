import 'package:flutter/material.dart';
import 'package:state_smanagement/contracts/observable_state.dart';
import 'package:state_smanagement/controllers/state_oberseble.dart';

class ObservableStateBuilder<T> extends StatefulWidget {
  final StateOberseble<T> stateOberseble;
  final Widget child;
  final Widget Function(BuildContext context, T state, Widget child) build;
  const ObservableStateBuilder({
    super.key,
    required this.stateOberseble,
    required this.build,
    required this.child,
  });

  @override
  State<ObservableStateBuilder<T>> createState() =>
      _ObservableStateBuilderState<T>();
}

class _ObservableStateBuilderState<T> extends State<ObservableStateBuilder<T>> {
  late T state;
  @override
  void initState() {
    state = widget.stateOberseble.state;
    widget.stateOberseble.addListener(callback);
    super.initState();
  }

  void callback() {
    state = widget.stateOberseble.state;
    setState(() {});
  }

  @override
  void dispose() {
    widget.stateOberseble.removeListener(callback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, state, widget.child);
  }
}
