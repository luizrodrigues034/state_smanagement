import 'package:flutter/material.dart';
import 'package:state_smanagement/contracts/observable_state.dart';
import 'package:state_smanagement/controllers/state_oberseble.dart';

class ObservableStateBuilder<T> extends StatefulWidget {
  final StateOberseble<T> stateOberseble;
  final Widget? child;
  final bool Function(T newState, T oldState)? buildWhen;
  final Widget Function(BuildContext context, T state, Widget child) build;
  final void Function(BuildContext context, T state)? listener;

  const ObservableStateBuilder({
    super.key,
    required this.stateOberseble,
    required this.build,
    this.child,
    this.buildWhen,
    this.listener,
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
    if (shouldRebuild()) {
      state = widget.stateOberseble.state;
      if (widget.listener != null) {
        widget.listener!(context, state);
      }
      setState(() {});
    }
    state = widget.stateOberseble.state;
  }

  bool shouldRebuild() {
    if (widget.buildWhen != null) {
      return widget.buildWhen!(state, widget.stateOberseble.state);
    }
    return false;
  }

  @override
  void dispose() {
    widget.stateOberseble.removeListener(callback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, state, widget.child!);
  }
}
