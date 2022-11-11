import 'package:cart_sample/model/menu_count_model.dart';
import 'package:cart_sample/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final _deliveryPrice = CurrencyFormatter.convert(deliveryPrice);

    return Consumer<MenuCounterModel>(
      builder: (context, menuCounter, child) => Container(
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
                  Text(
                      '${CurrencyFormatter.convert(calculateOrderPrice(menuCounter))}원'),
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
                    '${CurrencyFormatter.convert(deliveryPrice + (calculateOrderPrice(menuCounter)))}원',
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
      ),
    );
  }

  int calculateOrderPrice(MenuCounterModel menuCounter) =>
      menuPrice * menuCounter.menuCount;
}
