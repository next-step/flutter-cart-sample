import 'package:flutter/material.dart';
import 'package:cart_sample/util/numberFormat.dart';

class BillingButton extends StatelessWidget {
  final int totalPrice;
  const BillingButton({Key? key, required this.totalPrice}) : super(key: key);

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
            child: GestureDetector(
              child: Container(
                color: Color.fromRGBO(44, 191, 188, 1.0),
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
                      '${f.format(totalPrice)} 배달 주문하기',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            )),
      ),
    );
  }
}
