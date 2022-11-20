import 'package:flutter/material.dart';

import 'component/button_billing.dart';
import 'component/billing.dart';
import 'component/button_add_more.dart';
import 'component/menu.dart';
import 'component/store_name.dart';

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
          StoreName('치킨 잠실점', 'images/chickenCartoonImage.jpg'),
          SizedBox(
            height: 1,
          ),
          Menu(
            '후라이드 치킨',
            '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
            '18,000원',
          ),
          SizedBox(
            height: 1,
          ),
          ButtonAddMore(),
          Billing(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ButtonBilling(
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
