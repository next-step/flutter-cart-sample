import 'package:flutter/material.dart';

import 'models/payment.dart';
import 'models/product.dart';
import 'models/shop.dart';
import 'utils/formatter.dart';
import 'widgets/payment_info.dart';
import 'widgets/shop_info.dart';

part 'widgets/cart_item.dart';
part 'widgets/order_complete.dart';
part 'widgets/order_continue.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    /* Mock Data */
    final shopData = Shop(
      '가깝고도 먼치킨 석촌호수점',
      thumbnail: 'assets/images/chickenCartoonImage.jpg',
      deliveryPrice: 3000,
    );

    final productData = Product(
      '케이준 크리스피 치킨',
      description: '찜 & 리뷰 약속 시, 서비스 음료 제공 (콜라)',
      thumbnail: 'assets/images/chicken.png',
      originalPrice: 18000,
    );

    final paymentData = Payment(
      originalPrice: productData.originalPrice,
      deliveryPrice: shopData.deliveryPrice,
    );

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
          ShopInfo(shopData),
          SizedBox(
            height: 1,
          ),
          CartItem(productData),
          SizedBox(
            height: 1,
          ),
          OrderContinue(),
          SizedBox(
            height: 10,
          ),
          PaymentInfo(paymentData),
        ],
      ),
      bottomNavigationBar: OrderComplete(paymentData),
    );
  }
}
