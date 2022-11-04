import 'package:flutter/material.dart';
import 'package:cart_sample/cart/store_name.dart';
import 'package:cart_sample/cart/menu.dart';
import 'package:cart_sample/cart/billing.dart';
import 'package:cart_sample/order_button.dart';

part 'cart/add_more.dart';

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
          StoreName(),
          SizedBox(
            height: 1,
          ),
          Menu(),
          SizedBox(
            height: 1,
          ),
          AddMore(),
          Billing(),
        ],
      ),
      bottomNavigationBar: OrderButton(),
    );
  }
}
