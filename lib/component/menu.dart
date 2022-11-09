import 'package:cart_sample/component/menu_counter.dart';
import 'package:cart_sample/utils/currency_formatter.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String _menuName;
  final String _menuImage;
  final int _price;
  final String _menuDescription;
  final Function _plusCount;
  final Function _minusCount;

  late String _formattedPrice;

  Menu({
    Key? key,
    required menuName,
    required menuImage,
    required price,
    required menuDescription,
    required plusCount,
    required minusCount,
  })  : _menuName = menuName,
        _menuImage = menuImage,
        _price = price,
        _menuDescription = menuDescription,
        _plusCount = plusCount,
        _minusCount = minusCount,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    _formattedPrice = CurrencyFormatter.convert(_price);

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
                _menuName,
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
                    _menuImage,
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
                    _menuDescription,
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text('$_formattedPrice원'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _menuCountButton(context),
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

  Widget _menuCountButton(BuildContext context) {
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
            onPressed: MenuCounter.of(context).value <= 1
                ? null
                : () {
                    _minusCount();
                  },
          ),
          Text('${MenuCounter.of(context).value}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _plusCount();
            },
          ),
        ],
      ),
    );
  }
}
