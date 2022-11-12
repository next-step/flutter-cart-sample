import 'package:cart_sample/component/add_more.dart';
import 'package:cart_sample/component/billing.dart';
import 'package:cart_sample/component/bottom_navigation_bar.dart';
import 'package:cart_sample/component/menu.dart';
import 'package:cart_sample/component/menu_counter.dart';
import 'package:cart_sample/component/store_name.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _menuCount = 1;

  void minusCount() {
    setState(() {
      _menuCount--;
    });
  }

  void plusCount() {
    setState(() {
      _menuCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const deliveryPrice = 3000;
    const menuPrice = 18000;

    return Scaffold(
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
      body: MenuCounter(
        value: _menuCount,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              storeName: '치킨 잠실점',
              storeImage: 'images/chickenCartoonImage.jpg',
            ),
            SizedBox(
              height: 1,
            ),
            Menu(
              menuName: '황금 올리브 후라이드 치킨',
              menuImage: 'images/chicken.png',
              price: menuPrice,
              menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              plusCount: plusCount,
              minusCount: minusCount,
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(
              menuPrice: menuPrice,
              deliveryPrice: deliveryPrice,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MenuCounter(
        value: _menuCount,
        child: BottomButton(
          deliveryPrice: deliveryPrice,
          menuPrice: menuPrice,
        ),
      ),
    );
  }
}
