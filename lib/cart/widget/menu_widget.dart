import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/number.dart';
import '../cart_screen.dart';
import '../model/menu.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {required this.menu,
      required this.addCounter,
      required this.minusCounter,
      Key? key})
      : super(key: key);

  final Menu menu;
  final Function addCounter;
  final Function minusCounter;

  @override
  Widget build(BuildContext context) {
    int counter = Counter.of(context).value;

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
                    menu.image,
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
                  Text(NumberFormat('#,###원').format(menu.price)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildCount(
                  counter: counter,
                  addCounter: addCounter,
                  minusCounter: minusCounter),
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

Widget _buildCount({counter, addCounter, minusCounter}) {
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
          onPressed: counter == 1 ? null : minusCounter,
        ),
        Text('$counter'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: addCounter,
        ),
      ],
    ),
  );
}
