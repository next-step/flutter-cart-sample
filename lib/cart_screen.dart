import 'package:flutter/material.dart';
import 'package:cart_sample/cart_screen_widget/StoreName.dart';
import 'package:cart_sample/cart_screen_widget/AddMore.dart';
import 'package:cart_sample/cart_screen_widget/Billing.dart';
import 'package:cart_sample/cart_screen_widget/BillingButton.dart';
import 'package:cart_sample/util/numberFormat.dart';
part 'cart_screen_widget/Menu.dart';

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
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(
              sumMenuPrice: 18000,
              deliveryPrice: 3000,
            ),
          ],
        ),
        bottomNavigationBar: BillingButton(
          totalPrice: 21000,
        ));
  }
}
