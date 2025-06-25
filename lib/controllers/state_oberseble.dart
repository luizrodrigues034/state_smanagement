import 'package:state_smanagement/contracts/observable_state.dart';
import 'package:state_smanagement/controllers/change_state.dart';

class StateOberseble<T> extends ChangeState implements ObservableState {
  T _state;
  @override
  // TODO: implement state
  T get state => _state;

  set state(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyListeners();
  }

  StateOberseble(this._state);
}
