import 'package:cart_sample/component/menu_counter.dart';
import 'package:cart_sample/utils/CurrencyFormatter.dart';
import 'package:flutter/material.dart';

class Billing extends StatelessWidget {

  final int menuPrice;
  final int deliveryPrice;

  Billing({
    Key? key,
    required this.menuPrice,
    required this.deliveryPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _deliveryPrice = CurrencyFormatter.convert(deliveryPrice);
    var _orderPrice = CurrencyFormatter.convert(calculateOrderPrice(context));
    var _totalPrice = CurrencyFormatter.convert(deliveryPrice + (calculateOrderPrice(context)));

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
                Text('$_orderPrice원'),
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
                  '$_deliveryPrice원',
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
                Text(
                  '$_totalPrice원',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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

  int calculateOrderPrice(BuildContext context) => menuPrice * MenuCounter.of(context).value;
}
