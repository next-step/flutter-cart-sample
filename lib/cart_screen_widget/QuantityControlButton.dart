import 'package:flutter/material.dart';

class QuantityControlButton extends StatelessWidget {
  const QuantityControlButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          width: 100,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.remove),
              SizedBox(
                width: 10,
              ),
              Text("1"),
              SizedBox(width: 10),
              Icon(Icons.add),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
