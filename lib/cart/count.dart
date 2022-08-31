part of './cart_screen.dart';

class Count extends ChangeNotifier {
  late int count;

  Count({this.count = 1});

  void add() {
    count++;
    notifyListeners();
  }

  void minus() {
    count--;
    notifyListeners();
  }

  bool isOne() {
    return count == 1;
  }
}