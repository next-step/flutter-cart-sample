import 'package:cart_sample/widgets/add_more.dart';
import 'package:cart_sample/widgets/billing.dart';
import 'package:cart_sample/widgets/menu.dart';
import 'package:cart_sample/widgets/payment.dart';
import 'package:cart_sample/widgets/store_name.dart';
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
        count: 1,
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
                description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공'),
            Billing(
              price: 21000,
              deliveryTip: 3000,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Payment(
        price: 21000,
      ),
    );
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
    final MenuCounter? result =
    context.dependOnInheritedWidgetOfExactType<MenuCounter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuCounter oldWidget) => count != oldWidget.count;
}
