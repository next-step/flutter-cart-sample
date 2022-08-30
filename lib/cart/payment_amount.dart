import 'package:flutter/material.dart';

class PaymentAmount extends StatelessWidget {
  const PaymentAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          totalOrderAmount(),
          SizedBox(
            height: 10,
          ),
          deliveryTip(),
          divider(),
          paymentAmount(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Padding totalOrderAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text('총 주문금액'),
          Spacer(),
          Text('18,000원'),
        ],
      ),
    );
  }

  Padding paymentAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '결제예정금액',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            '21,000원',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding deliveryTip() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '배탈팁',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            '3,000원',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Padding divider() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
    );
  }
}
