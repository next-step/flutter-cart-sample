import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int _count = 1;

  get count {
    return _count;
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
