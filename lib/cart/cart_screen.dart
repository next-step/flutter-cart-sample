import 'package:flutter/material.dart';

import '../utils/format.dart';

part './more.dart';

part './order.dart';

part './payment_amount.dart';

part './product.dart';

part './store_name.dart';

class MenuCount extends InheritedWidget with ChangeNotifier {
  MenuCount({
    Key? key,
    this.count = 1,
    required Widget child,
  }) : super(key: key, child: child);

  final int count;

  static MenuCount of(BuildContext context) {
    final MenuCount? result =
        context.dependOnInheritedWidgetOfExactType<MenuCount>();
    assert(result != null, 'No MenuCount found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuCount oldWidget) {
    return oldWidget.count != count;
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _count = 1;

  @override
  Widget build(BuildContext context) {
    var price = 18000;
    var paymentAmount =
        PaymentAmount(totalOrderAmount: price * _count, deliveryTip: 3000);
    return MenuCount(
      count: _count,
      child: Scaffold(
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
                price: price),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildCount(),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            More(),
            paymentAmount,
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(paymentAmount.calculate()),
      ),
    );
  }

  Widget _buildCount() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed: _count == 1
                ? null
                : () {
                    setState(() {
                      _count--;
                    });
                  },
          ),
          Text('$_count'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
        ],
      ),
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

  Widget _bottomNavigationBar(payment) {
    return Order(payment: payment);
  }
}
