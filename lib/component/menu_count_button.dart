import 'package:cart_sample/component/menu_counter.dart';
import 'package:flutter/material.dart';

class MenuCountButton extends StatefulWidget {
  const MenuCountButton({Key? key}) : super(key: key);

  @override
  State<MenuCountButton> createState() => _MenuCountButtonState();
}

class _MenuCountButtonState extends State<MenuCountButton> {
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
            onPressed: MenuCounter.of(context).value <= 1 ? null : (){
              setState(() {
                MenuCounter.of(context).value--;
              });
            },
          ),
          Text('${MenuCounter.of(context).value}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                MenuCounter.of(context).value++;
              });
            },
          ),
        ],
      ),
    );
  }
}
