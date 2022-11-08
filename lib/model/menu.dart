part of 'cart.dart';

class Menu {
  final String itemName;
  final String itemImgPath;
  final String? description;
  final int price;
  int count = 1;

  Menu({
    required this.itemName,
    required this.itemImgPath,
    this.description,
    required this.price,
  });

  int getTotalPrice() {
    return price * count;
  }
}
