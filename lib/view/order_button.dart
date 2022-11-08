import 'package:cart_sample/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:cart_sample/view/util/price_formatter.dart';
import 'package:provider/provider.dart';

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
                    child: Consumer<MenuCounter>(
                      builder: (context, menuCounter, child) => Text(
                        menuCounter.count.toString(),
                        style: TextStyle(
                          color: Color.fromRGBO(44, 191, 188, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Consumer<MenuCounter>(
                  builder: (context, menuCounter, child) => Text(
                    '${getPriceString(menuCounter.count * price + tipPrice)} 배달 주문하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
