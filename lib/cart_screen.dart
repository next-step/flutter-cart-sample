import 'package:flutter/material.dart';
import 'package:cart_sample/cart/store_name.dart';
import 'package:cart_sample/cart/menu.dart';
import 'package:cart_sample/cart/billing.dart';
import 'package:cart_sample/order_button.dart';
import 'package:provider/provider.dart';

part 'cart/add_more.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final int _price = 18000;
  final int _tipPrice = 3000;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MenuCounter(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            '장바구니',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              name: '치킨 잠실점',
              storeImagePath: 'images/chickenCartoonImage.jpg',
            ),
            SizedBox(
              height: 1,
            ),
            Menu(
              menuTitle: '후라이드 치킨',
              subTitle: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              menuImagePath: 'images/chicken.png',
              price: _price,
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(
              price: _price,
              tipPrice: _tipPrice,
            ),
          ],
        ),
        bottomNavigationBar: OrderButton(
          price: _price,
          tipPrice: _tipPrice,
        ),
      ),
    );
  }
}

class MenuCounter extends ChangeNotifier {
  int _count = 1;
  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    notifyListeners();
  }
}
