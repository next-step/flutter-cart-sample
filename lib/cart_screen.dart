import 'package:flutter/material.dart';

import 'widgets/order_button.dart';
import 'widgets/payment_info.dart';
import 'widgets/product_card.dart';
import 'widgets/product_more.dart';
import 'widgets/shop_profile.dart';

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
          ShopProfile(),
          SizedBox(
            height: 1,
          ),
          ProductCard(),
          SizedBox(
            height: 1,
          ),
          ProductMore(),
          SizedBox(
            height: 10,
          ),
          PaymentInfo(),
        ],
      ),
      bottomNavigationBar: OrderButton(),
    );
  }
}
