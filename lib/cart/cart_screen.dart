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

  int _counter = 1;

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  void _minusCounter() {
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
      body: Counter(
        value: _counter,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreNameWidget(_storeNameData),
            SizedBox(
              height: 1,
            ),
            MenuWidget(
              menu: _menu,
              addCounter: _addCounter,
              minusCounter: _minusCounter,
            ),
            SizedBox(
              height: 1,
            ),
            AddMoreWidget(),
            _BillingWidget(_billing),
          ],
        ),
      ),
      bottomNavigationBar:
          OrderButtonWidget(_billing.billingPrice + _billing.deliveryFee),
    );
  }
}

class Counter extends InheritedWidget {
  const Counter({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  final int value;

  static Counter of(BuildContext context) {
    final Counter? result =
        context.dependOnInheritedWidgetOfExactType<Counter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Counter old) {
    return old.value != value;
  }
}
