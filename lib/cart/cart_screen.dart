import 'package:cart_sample/cart/more.dart';
import 'package:cart_sample/cart/order.dart';
import 'package:cart_sample/cart/payment_amount.dart';
import 'package:cart_sample/cart/product.dart';
import 'package:cart_sample/cart/store_name.dart';
import 'package:flutter/material.dart';

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
      appBar: _appBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          StoreName(name: '치킨 잠실점', image: 'images/chickenCartoonImage.jpg'),
          SizedBox(
            height: 1,
          ),
          Product(
              name: '후라이드 치킨',
              image: 'images/chicken.png',
              contents: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              price: '18,000'),
          SizedBox(
            height: 1,
          ),
          More(),
          PaymentAmount(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Widget bottomNavigationBar() {
    return Order();
  }
}
