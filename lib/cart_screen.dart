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
  int _counter = 1;
  final int _price = 18000;
  final int _tipPrice = 3000;

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
            name: '치킨 잠실점',
            storeImagePath: 'images/chickenCartoonImage.jpg',
          ),
          SizedBox(
            height: 1,
          ),
          MenuCounter(
            count: _counter,
            onIncrementCount: _incrementCounter,
            onDecrementCount: _decrementCounter,
            child: Menu(
              menuTitle: '후라이드 치킨',
              subTitle: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              menuImagePath: 'images/chicken.png',
              price: _price,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          AddMore(),
          Billing(
            totalPrice: _counter * _price,
            tipPrice: _tipPrice,
          ),
        ],
      ),
      bottomNavigationBar: OrderButton(
        orderPrice: _price * _counter + _tipPrice,
        orderCount: _counter,
      ),
    );
  }
}

class MenuCounter extends InheritedWidget {
  final int count;
  final VoidCallback onIncrementCount;
  final VoidCallback onDecrementCount;

  const MenuCounter({
    Key? key,
    required this.count,
    required this.onIncrementCount,
    required this.onDecrementCount,
    required Widget child,
  }) : super(key: key, child: child);

  static MenuCounter of(BuildContext context) {
    final MenuCounter? result =
        context.dependOnInheritedWidgetOfExactType<MenuCounter>();
    assert(result != null, 'No OrderPriceAndCounter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuCounter oldWidget) {
    return oldWidget.count != count;
  }
}
