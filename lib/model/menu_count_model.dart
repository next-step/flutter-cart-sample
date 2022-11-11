import 'package:flutter/foundation.dart';

class MenuCounterModel extends ChangeNotifier {
  static const int minimumCount = 1;

  var _menuCount = 1;

  int get menuCount => _menuCount;

  void add() {
    _menuCount++;
    notifyListeners();
  }

  void minus() {
    if (_menuCount == minimumCount) {
      return;
    }
    _menuCount--;
    notifyListeners();
  }
}
