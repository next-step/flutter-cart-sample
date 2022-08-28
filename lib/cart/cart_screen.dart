import 'package:cart_sample/cart/widget/add_more_widget.dart';
import 'package:cart_sample/cart/widget/billing_widget.dart';
import 'package:cart_sample/cart/widget/count_widget.dart';
import 'package:cart_sample/cart/widget/menu_widget.dart';
import 'package:cart_sample/cart/widget/store_name_widget.dart';
import 'package:cart_sample/util/util.dart';
import 'package:flutter/material.dart';

part 'widget/order_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map _store = {
    'image': 'images/chickenCartoonImage.jpg',
    'title': '치킨 잠실점',
  };

  final Map _menu = {
    'name': '후라이드 치킨',
    'image': 'images/chicken.png',
    'description': '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
    'price': '18000',
  };

  final Map _billing = {
    'delivery price': '3000',
  };

  int _count = 1;

  void incrementCount() {
    setState(() {
      _count++;
    });
  }

  void decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('장바구니', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: CountWidget(
        value: _count,
        child: ListView(
          children: [
            SizedBox(height: 10),
            StoreNameWidget(_store['image'], _store['title']),
            SizedBox(height: 1),
            MenuWidget(
              _menu['name'],
              _menu['image'],
              _menu['description'],
              _menu['price'],
              incrementCountCallback: incrementCount,
              decrementCountCallback: decrementCount,
            ),
            SizedBox(height: 1),
            AddMoreWidget(),
            BillingWidget(
              _menu['price'],
              _billing['delivery price'],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _OrderWidget('0'),
    );
  }
}
