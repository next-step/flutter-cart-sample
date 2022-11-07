import 'package:cart_sample/cart/widget/add_more_widget.dart';
import 'package:cart_sample/cart/widget/menu_widget.dart';
import 'package:cart_sample/cart/widget/order_button_widget.dart';
import 'package:cart_sample/cart/widget/store_name_widget.dart';
import 'package:flutter/material.dart';
import '../utils/number.dart';
import 'model/billing.dart';
import 'model/menu.dart';
import 'model/store_name_data.dart';

part 'widget/billing_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _billing = Billing(billingPrice: 18000, deliveryFee: 3000);

  final _menu = Menu(
      name: '후라이드 치킨',
      image: 'images/chicken.png',
      description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
      price: 18000);

  final _storeNameData =
      StoreNameData(title: '치킨 잠실점', image: 'images/chickenCartoonImage.jpg');

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
          StoreNameWidget(_storeNameData),
          SizedBox(
            height: 1,
          ),
          MenuWidget(_menu),
          SizedBox(
            height: 1,
          ),
          AddMoreWidget(),
          _BillingWidget(_billing),
        ],
      ),
      bottomNavigationBar:
          OrderButtonWidget(_billing.billingPrice + _billing.deliveryFee),
    );
  }
}
