library cart_screen;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
part 'widgets/menu.dart';
part 'widgets/billing.dart';
part 'widgets/add_more.dart';
part 'widgets/payment.dart';
part 'widgets/store_name.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _count = 1;

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
      body: MenuCounter(
        count: _count,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              name: '치킨 잠실점',
              imageUrl: 'images/chickenCartoonImage.jpg',
            ),
            SizedBox(
              height: 1,
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Menu(
              name: '후라이드치킨',
              imageUrl: 'images/chicken.png',
              price: 18000,
              description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              onUpdateCount: _updateCount,
            ),
            Billing(
              price: 18000,
              deliveryTip: 3000,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Payment(
        price: 18000,
        count: _count,
        deliveryTip: 3000,
      ),
    );
  }

  void _updateCount(int value) {
    setState(() {
      _count = value;
    });
  }
}

class MenuCounter extends InheritedWidget {
  const MenuCounter({
    Key? key,
    this.count = 1,
    required Widget child,
  }) : super(key: key, child: child);

  final int count;

  static MenuCounter of(BuildContext context) {
    final MenuCounter? result = context.dependOnInheritedWidgetOfExactType<MenuCounter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuCounter oldWidget) => count != oldWidget.count;
}
