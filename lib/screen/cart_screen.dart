import 'package:cart_sample/component/add_more.dart';
import 'package:cart_sample/component/billing.dart';
import 'package:cart_sample/component/menu.dart';
import 'package:cart_sample/component/menu_counter.dart';
import 'package:cart_sample/component/store_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    final format = NumberFormat.currency(locale: "ko_KR", name: "", decimalDigits: 0);

    var _deliveryPrice = 3000;
    var _menuPrice = 18000;
    var _totalPrice = format.format(_deliveryPrice + _menuPrice);

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
        value: 1,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              storeName: '치킨 잠실점',
              storeImage: 'images/chickenCartoonImage.jpg',
            ),
            SizedBox(
              height: 1,
            ),
            Menu(
              menuName: '황금 올리브 후라이드 치킨',
              menuImage: 'images/chicken.png',
              price: _menuPrice,
              menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(
              orderPrice: _menuPrice,
              deliveryPrice: _deliveryPrice,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Color.fromRGBO(44, 191, 188, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '$_totalPrice원 배달 주문하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(44, 191, 188, 1.0),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
