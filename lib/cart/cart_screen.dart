import 'package:cart_sample/cart/model/menu.dart';
import 'package:cart_sample/cart/model/store_data.dart';
import 'package:cart_sample/cart/widget/add_more_widget.dart';
import 'package:cart_sample/cart/widget/billing_widget.dart';
import 'package:cart_sample/cart/widget/menu_widget.dart';
import 'package:cart_sample/cart/widget/store_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/number.dart';

part 'widget/order_button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _storeData =
      StoreData(title: '치킨 잠실점', imageSrc: 'images/chickenCartoonImage.jpg');

  final _menu = Menu(
      name: '후라이드 치킨',
      imageSrc: 'images/chicken.png',
      description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
      price: 18000);

  final int _deliveryPrice = 3000;

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
        value: _counter,
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
              StoreNameWidget(_storeData),
              SizedBox(
                height: 1,
              ),
              MenuWidget(
                  menu: _menu,
                  incrementCounter: _incrementCounter,
                  decrementCounter: _decrementCounter),
              SizedBox(
                height: 1,
              ),
              AddMoreWidget(),
              BillingWidget(
                deliveryPrice: _deliveryPrice,
                itemPrice: _menu.price,
              ),
            ],
          ),
          bottomNavigationBar: _OrderButtonWidget(
            deliveryPrice: _deliveryPrice,
            itemPrice: _menu.price,
          ),
        ));
  }
}
