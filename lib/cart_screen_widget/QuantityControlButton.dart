import 'package:flutter/material.dart';

class QuantityControlButton extends StatefulWidget {
  const QuantityControlButton({Key? key}): super(key: key);
  @override
  State<QuantityControlButton> createState() => _QuantityControlButtonState();
}

class _QuantityControlButtonState extends State<QuantityControlButton> {
  int counter = 0;

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
                  width: 39,
                  height: 43,
                  child: TextButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black, // foreground
                    ),
                  ),
              ),
              SizedBox(
                width: 20,
                height: 43,
                child: Center(
                    child: Text("1")
                ),
              ),
              SizedBox(
                width: 39,
                height: 43,
                child: TextButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // foreground
                  ),
                ),
              ),
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
