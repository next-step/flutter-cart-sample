import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/format.dart';

part './order.dart';

part './count.dart';

part './count_button.dart';

part './more.dart';

part './payment_amount.dart';

part './product.dart';

part './store_name.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Color background = const Color.fromRGBO(246, 246, 246, 1.0);

  final Count _count = Count();
  final int price = 18000;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _count,
        child: Scaffold(
          backgroundColor: background,
          appBar: _appBar(),
          body: _body(),
          bottomNavigationBar: Order(
            price: price,
            deliveryTip: 3000,
          ),
        ));
  }

  AppBar _appBar() {
    return AppBar(
      leading: const BackButton(color: Colors.black),
      title: const Text(
        '장바구니',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  ListView _body() {
    return ListView(
      children: [
        SizedBox(height: 10),
        StoreName(
          name: '치킨 잠실점',
          image: 'images/chickenCartoonImage.jpg',
        ),
        SizedBox(height: 1),
        Product(
            name: '후라이드 치킨',
            image: 'images/chicken.png',
            contents: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
            price: price),
        _countButton(),
        SizedBox(height: 1),
        More(),
        PaymentAmount(
          price: price,
          deliveryTip: 3000,
        ),
      ],
    );
  }

  Row _countButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CountButton(),
        SizedBox(width: 20),
      ],
    );
  }
}
