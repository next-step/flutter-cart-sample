import 'package:cart_sample/utils/number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/counter.dart';

class BillingWidget extends StatelessWidget {
  const BillingWidget({
    Key? key,
    required this.deliveryPrice,
    required this.itemPrice,
  }) : super(key: key);

  final int deliveryPrice;
  final int itemPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('총 주문금액'),
                Spacer(),
                Consumer<Counter>(builder: (context, counter, child) {
                  int count = counter.count;

                  return Text(formatPrice(itemPrice * count));
                }),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
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
                  formatPrice(deliveryPrice),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
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
                Consumer<Counter>(builder: (context, counter, child) {
                  int count = counter.count;

                  return Text(
                    formatPrice((itemPrice * count) + deliveryPrice),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
