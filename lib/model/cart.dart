part 'menu.dart';

class Cart {
  final String storeName;
  final String storeImgPath;
  final List<Menu> menus = List.empty(growable: true);
  final int tipPrice;

  Cart({
    required this.storeName,
    required this.storeImgPath,
    required this.tipPrice,
  });

  int getTotalPrice() {
    return menus
        .map((menu) => menu.getTotalPrice())
        .reduce((price, menuPrice) => price + menuPrice);
  }
}
