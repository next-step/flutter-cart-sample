import 'package:cart_sample/widget/order_button.dart';
import 'package:flutter/material.dart';

import 'widget/add_more.dart';
import 'widget/billing.dart';
import 'widget/menu.dart';
import 'widget/store_name.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              storeImageUrl: 'images/chickenCartoonImage.jpg',
              storeName: '치킨 잠실점',
            ),
            SizedBox(
              height: 1,
            ),
            Menu(
              menuName: '후라이드 치킨',
              menuImageUrl: 'images/chicken.png',
              menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              menuPrice: 17500,
              onCancel: () => {},
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(
              onTap: () => {},
            ),
            Billing(
              totalAmount: 17500,
              deliveryFee: 3000,
            ),
          ],
        ),
        bottomNavigationBar: OrderButton(
          numberOfMenu: 1,
          totalPayAmount: 20500,
          onPressed: () => {},
        ));
  }
}
