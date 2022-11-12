import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/CartInfoNotifier.dart';
import 'utils/money_format.dart';

class Billing extends StatelessWidget {
  const Billing({
    Key? key,
  }) : super(key: key);

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
                Consumer<CartInfoNotifier>(
                  builder: (context, cartInfoNotifier, child) {
                    return Text(
                        '${cartInfoNotifier.getTotalMenuAmount().toMoneyFormatString()}원');
                  },
                ),
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
                Consumer<CartInfoNotifier>(
                  builder: (context, cartInfoNotifier, child) {
                    return Text(
                      '${cartInfoNotifier.cartInfo.deliveryFee.toMoneyFormatString()}원',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    );
                  },
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
                Consumer<CartInfoNotifier>(
                  builder: (context, cartInfoNotifier, child) {
                    return Text(
                      '${cartInfoNotifier.getTotalPayAmount().toMoneyFormatString()}원',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
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
