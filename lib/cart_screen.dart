import 'package:flutter/material.dart';

import 'widget/add_more_button.dart';
import 'widget/menu.dart';
import 'widget/order_button.dart';
import 'widget/receipt.dart';
import 'widget/store_name.dart';

class MenuCount extends InheritedWidget with ChangeNotifier {
  MenuCount({
    Key? key,
    this.count = 1,
    required Widget child,
  }) : super(key: key, child: child);

  final int count;

  static MenuCount of(BuildContext context) {
    final MenuCount? result = context.dependOnInheritedWidgetOfExactType<MenuCount>();
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
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return MenuCount(
      count: _count,
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
            StoreNameWidget(
              name: '치킨 잠실점',
              imageUrl: 'images/chickenCartoonImage.jpg',
            ),
            SizedBox(
              height: 1,
            ),
            MenuWidget(
              name: '후라이드 치킨',
              imageUrl: 'images/chicken.png',
              price: 18000,
              description: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              onChanged: (count) {
                _updateCount(count);
              },
            ),
            SizedBox(
              height: 1,
            ),
            AddMoreButton(),
            ReceiptWidget(
              price: 18000,
              deliveryTip: 3000,
            ),
          ],
        ),
        bottomNavigationBar: OrderButton(
          price: 18000,
        ),
      ),
    );
  }

  void _updateCount(int count) {
    print('_updateCount');
    setState(() {
      _count = count;
    });
  }
}
