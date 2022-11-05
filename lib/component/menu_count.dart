import 'package:flutter/material.dart';

class MenuCount extends StatefulWidget {
  const MenuCount({Key? key}) : super(key: key);

  @override
  State<MenuCount> createState() => _MenuCountState();
}

class _MenuCountState extends State<MenuCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed: null,
          ),
          Text('1'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
