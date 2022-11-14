import 'package:cart_sample/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:cart_sample/util/numberFormat.dart';
import 'package:cart_sample/util/numberCalculator.dart';

// stateless -> stateful 변경
class BillingButton extends StatefulWidget {
  final int _deliveryPrice;
  final int _menuPrice;

  const BillingButton({
    Key? key,
    required int deliveryPrice,
    required int menuPrice,
  })  : _deliveryPrice = deliveryPrice,
        _menuPrice = menuPrice,
        super(key: key);

  @override
  State<BillingButton> createState() => _BillingButtonState();
}

class _BillingButtonState extends State<BillingButton> {
  @override
  Widget build(BuildContext context) {
    int count = MenuCount.of(context).count;

    return Container(
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
                  '${numberFormat.format(totalPrice(widget._menuPrice, count, widget._deliveryPrice))} 배달 주문하기',
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
    );
  }
}
