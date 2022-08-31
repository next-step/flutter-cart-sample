import 'package:cart_sample/cart/model/counter.dart';
import 'package:cart_sample/cart/model/menu.dart';
import 'package:cart_sample/utils/number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part './counter_widget.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key, required this.menu}) : super(key: key);

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                menu.name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    menu.imageSrc,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.description,
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text(formatPrice(menu.price)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _CounterWidget(),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
