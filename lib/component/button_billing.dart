import 'package:flutter/material.dart';

class ButtonBilling extends ElevatedButton {
  ButtonBilling({Key? key, required VoidCallback? onPressed})
      : super(key: key, onPressed: onPressed, child: children(), style: buttonStyle());

  static ButtonStyle buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color.fromRGBO(44, 191, 188, 1.0),
      ),
    );
  }

  static Row children() {
    return Row(
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
          '21,000원 배달 주문하기',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
