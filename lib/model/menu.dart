part of 'cart.dart';

class Menu extends ChangeNotifier{
  final String itemName;
  final String itemImgPath;
  final String? description;
  final int price;

  int _count = 1;
  int get count => _count;

  Function? _changeNotifier;

  Menu({
    required this.itemName,
    required this.itemImgPath,
    this.description,
    required this.price,
  });

  int getTotalPrice() {
    return price * count;
  }

  void incrementCount(){
    _count++;
    _changeNotifier?.call();
    notifyListeners();
  }

  void decrementCount(){
    _count--;
    _changeNotifier?.call();
    notifyListeners();
  }

  void _setChangeNotifier(void Function() changeNotifier) {
    _changeNotifier = changeNotifier;
  }
}
