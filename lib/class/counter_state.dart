import 'package:state_smanagement/controllers/change_state.dart';

class CounterState extends ChangeState {
  int count = 0;

  void counter() {
    print('incrementando contador');
    count++;
    notifyListeners();
  }
}
