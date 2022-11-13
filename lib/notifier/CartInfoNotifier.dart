import 'package:cart_sample/model/cart_info.dart';
import 'package:flutter/material.dart';

class CartInfoNotifier extends ChangeNotifier {
  CartInfo _cartInfo = CartInfo(count: 1, price: 17500, deliveryFee: 3000);

  CartInfo get cartInfo => _cartInfo;

  void countUp() {
    _cartInfo = _cartInfo.countUp();
    notifyListeners();
  }

  void countDown() {
    _cartInfo = _cartInfo.countDown();
    notifyListeners();
  }

  int getTotalPayAmount() {
    return _cartInfo.getTotalPayAmount();
  }

  int getTotalMenuAmount() {
    return _cartInfo.getTotalMenuAmount();
  }
}
