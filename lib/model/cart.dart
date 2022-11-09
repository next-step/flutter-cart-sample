import 'package:flutter/material.dart';

part 'menu.dart';

class Cart extends ChangeNotifier {
  final String storeName;
  final String storeImgPath;
  final List<Menu> _menus = List.empty(growable: true);
  final int tipPrice;

  Cart({
    required this.storeName,
    required this.storeImgPath,
    required this.tipPrice,
  });

  int getTotalPrice() {
    return getOrderPrice() + tipPrice;
  }

  int getOrderPrice() {
    return _menus
        .map((menu) => menu.getTotalPrice())
        .reduce((price, menuPrice) => price + menuPrice);
  }

  void addMenu(Menu menu) {
    _menus.add(menu);
    notifyListeners();
  }

  int getSize() {
    return _menus.length;
  }

  int getTotalCount() {
    return _menus
        .map((menu) => menu.count)
        .reduce((totalCount, count) => totalCount + count);
  }

  Menu getMenu(int idx) {
    return _menus[idx];
  }

  void incrementMenuCount(int menuIdx){
    _menus[menuIdx]._incrementCount();
    notifyListeners();
  }

  void decrementMenuCount(int menuIdx){
    _menus[menuIdx]._decrementCount();
    notifyListeners();
  }
}
