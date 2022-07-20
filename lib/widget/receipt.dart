import 'package:cart_sample/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReceiptWidget extends StatefulWidget {
  const ReceiptWidget({
    Key? key,
    required this.price,
    required this.deliveryTip,
  }) : super(key: key);

  final int price;
  final int deliveryTip;

  @override
  State<ReceiptWidget> createState() => _ReceiptWidgetState();
}

class _ReceiptWidgetState extends State<ReceiptWidget> {
  int _totalPrice = 0;

  @override
  void didChangeDependencies() {

    print('didChangeDependencies');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<MenuCount>(context).count;
    print(count);
    _totalPrice = count * widget.price;

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
                Text(NumberFormat('#,###원').format(_totalPrice)),
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
                  NumberFormat('#,###원').format(widget.deliveryTip),
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
                  NumberFormat('#,###원').format(_totalPrice + widget.deliveryTip),
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
}