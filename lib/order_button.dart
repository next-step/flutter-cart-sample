import 'package:cart_sample/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:cart_sample/util/price_formatter.dart';

class OrderButton extends StatelessWidget {
  final int price;
  final int tipPrice;

  const OrderButton({
    Key? key,
    required this.price,
    required this.tipPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int orderCount = MenuCounter.of(context).count;
    int orderPrice = price * orderCount + tipPrice;

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
                      orderCount.toString(),
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
                  '${getPriceString(orderPrice)} 배달 주문하기',
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
