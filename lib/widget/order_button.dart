import 'package:cart_sample/widget/utils/money_format.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final int _numberOfMenu;
  final int _totalPayAmount;
  final VoidCallback _onPressed;

  const OrderButton({
    Key? key,
    required int numberOfMenu,
    required int totalPayAmount,
    required VoidCallback onPressed,
  })
      : _numberOfMenu = numberOfMenu,
        _totalPayAmount = totalPayAmount,
        _onPressed = onPressed,
        super(key: key);

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
                    child: Text(
                      _numberOfMenu.toString(),
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
                  '${_totalPayAmount.toMoneyFormatString()}원 배달 주문하기',
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
