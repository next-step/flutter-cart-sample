import 'package:flutter/material.dart';

import 'widget/add_more_button.dart';
import 'widget/menu.dart';
import 'widget/receipt.dart';
import 'widget/store_name.dart';

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
                    '21,000원 배달 주문하기',
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
