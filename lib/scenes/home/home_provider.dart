import 'package:q_flutter_template/services/safety/change_notifier_safety.dart';

class HomeProvider extends ChangeNotifierSafety {
  HomeProvider();

  int _counter = 0;

  int get counter => _counter;

  void increase() {
    _counter ++;
    notifyListeners();
  }

  @override
  void resetState() {
    _counter = 0;
    notifyListeners();
  }
}