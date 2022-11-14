import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cart_sample/cart_screen_widget/StoreName.dart';
import 'package:cart_sample/cart_screen_widget/AddMore.dart';
import 'package:cart_sample/cart_screen_widget/Billing.dart';
import 'package:cart_sample/cart_screen_widget/BillingButton.dart';
import 'package:cart_sample/cart_screen_widget/QuantityControlButton.dart';
import 'package:cart_sample/util/numberFormat.dart';
part 'cart_screen_widget/Menu.dart';

// 1. MenuCount 생성 with ChangeNotifier
class MenuCount extends InheritedWidget with ChangeNotifier {
  MenuCount({
    Key? key,
    this.count = 1,
    required Widget child,
  }) : super(key: key, child: child);

  final int count;
  // Q1. final 변수 선언 시 초기화 하지 않고 생성자에서 count 값 초기화하는 이유
  // Q2. final 로 선언하는 이유

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
  int _count = 1; // 변경될 값

  @override
  Widget build(BuildContext context) {
    return MenuCount(
      // 2. 기존 Scaffold 를 return 하던 build Method 에서
      // 1 에서 생성한 InheritedWidget MenuCount return
      // MenuCount 파라메터 count 에 Stateful CartScreenState 위젯의 _count state 세팅
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
          elevation: 0, // the size of the shadow below the app bar
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              storeName: "치킨 판교점",
            ),
            SizedBox(
              height: 1,
            ),
            _Menu(
              menuName: '후라이드 반 양념 반',
              menuPrice: 18000,
              eventContents: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              // 4-2. onChanged named parameter 가 호출될 때
              // _updateCount Method 를 callback 으로 호출
              onChanged: (count) => _updateCount(count),
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(
              menuPrice: 18000,
              deliveryPrice: 3000,
            ),
          ],
        ),
        bottomNavigationBar: BillingButton(
          menuPrice: 18000,
          deliveryPrice: 3000,
        ),
      ),
    );
  }

  // 3. Stateful CartScreenState 위젯의 _count 값을 변경해줄 Method 생성
  void _updateCount(int count) {
    setState(() => _count = count);
  }
}
