import 'package:state_smanagement/contracts/observeble.dart';

class ChangeState implements Observeble {
  final List<void Function()> _callbacks = [];
  @override
  void addListener(void Function() callback) {
    if (!_callbacks.contains(callback)) {
      print('adicionando callback');
      _callbacks.add(callback);
      print(callback);
    }
  }

  @override
  void removeListener(void Function() callback) {
    if (_callbacks.contains(callback)) {
      print('removendo callback');
      _callbacks.remove(callback);
    }
  }

  void notifyListeners() {
    for (final callback in _callbacks) {
      print('Iterando lista de callbacks');
      callback();
    }
  }
}
