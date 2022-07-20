import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../cart_screen.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.price,
  }) : super(key: key);

  final int price;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  void didChangeDependencies() {
    print('OrderButton didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<MenuCount>(context).count;

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
                      '$count',
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
                  '${NumberFormat('#,###원').format(widget.price * count)} 배달 주문하기',
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
