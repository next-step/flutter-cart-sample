import 'package:cart_sample/widget/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart_info.dart';

class OrderButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const OrderButton({
    Key? key,
    required VoidCallback onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartInfo cartInfo = Provider.of<CartInfo>(context);
    int totalPayAmount = cartInfo.price * cartInfo.count + cartInfo.deliveryFee;

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
                      "1",
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
                  '${totalPayAmount.toMoneyFormatString()}원 배달 주문하기',
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
            onPressed: _onPressed,
          ),
        ),
      ),
    );
  }
}
