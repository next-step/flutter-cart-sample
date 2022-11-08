import 'package:cart_sample/view/cart_screen.dart';
import 'package:flutter/material.dart';

import 'model/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(cart: _initCart()),
    );
  }

  static Cart _initCart() {
    Cart cart = Cart(
      storeName: '치킨 잠실점',
      storeImgPath: 'images/chickenCartoonImage.jpg',
      tipPrice: 3000,
    );

    cart.addMenu(Menu(
      itemName: '후라이드 치킨',
      itemImgPath: 'images/chicken.png',
      description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
      price: 10000,
    ));

    cart.addMenu(Menu(
      itemName: '후라이드 치킨1',
      itemImgPath: 'images/chicken.png',
      description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
      price: 1000,
    ));

    return cart;
  }
}
