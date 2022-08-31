import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/format.dart';

part './order.dart';

part './count_button.dart';

part './more.dart';

part './payment_amount.dart';

part './product.dart';

part './store_name.dart';

class Count extends ChangeNotifier {
  late int count;

  Count({this.count = 1});

  void add() {
    count++;
  }

  void minus() {
    count--;
    notifyListeners();
  }

  bool isOne() {
    return count == 1;
  }
}

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
    var paymentAmount = PaymentAmount(
      totalOrderAmount: price * _count.count,
      deliveryTip: 3000,
    );
    return ChangeNotifierProvider(
        create: (context) => _count,
        child: Scaffold(
          backgroundColor: background,
          appBar: _appBar(),
          body: body(paymentAmount),
          bottomNavigationBar: Order(payment: paymentAmount.calculate()),
        ));
  }

  ListView body(PaymentAmount paymentAmount) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildCount(),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(
          height: 1,
        ),
        More(),
        paymentAmount,
      ],
    );
  }

  Widget _buildCount() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: buttonContents(),
    );
  }

  Wrap buttonContents() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        minusButton(),
        Text('${_count.count}'),
        addButton(),
      ],
    );
  }

  IconButton addButton() {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        setState(() {
          _count.add();
        });
      },
    );
  }

  IconButton minusButton() {
    return IconButton(
      icon: Icon(Icons.remove),
      disabledColor: Colors.grey,
      onPressed: _count.isOne()
          ? null
          : () {
              setState(() {
                _count.minus();
              });
            },
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
}
