import 'package:cart_sample/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'model/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(
        store: chickenStore,
        cart: chickenStore.itemList[0],
      ),
    );
  }
}

Store chickenStore = Store(
  name: '치킨 잠실점',
  logo: 'chickenCartoonImage.jpg',
  itemList: [
    Item(
      name: '후라이드 치킨',
      description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
      image: 'chicken.png',
      price: 18000,
    ),
    Item(
      name: '치킨 무',
      image: 'pickled_radish.png',
      price: 500,
    ),
  ],
  deliveryFee: 3000,
);
