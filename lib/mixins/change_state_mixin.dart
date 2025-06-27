import 'package:flutter/material.dart';
import 'package:state_smanagement/controllers/change_state.dart';

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  late List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState) {
    changeState.addListener(callback);
    _changeStates.add(changeState);
  }

  void callback() {
    setState(() {});
  }

  @override
  void dispose() {
    for (ChangeState changeState in _changeStates) {
      changeState.removeListener(callback);
    }
    super.dispose();
  }
}
