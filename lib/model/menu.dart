part of 'cart.dart';

class Menu {
  final String itemName;
  final String itemImgPath;
  final String? description;
  final int price;

  int _count = 1;

  int get count => _count;

  Menu({
    required this.itemName,
    required this.itemImgPath,
    this.description,
    required this.price,
  });

  int getTotalPrice() {
    return price * count;
  }

  void _incrementCount() => _count++;
  void _decrementCount() => _count--;
}
