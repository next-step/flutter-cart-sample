import 'package:cart_sample/component/utils/money_format.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String _menuName;
  final String _menuImageUrl;
  final String _menuDescription;
  final int _menuPrice;
  final VoidCallback _onCancel;

  const Menu({
    Key? key,
    required String menuName,
    required String menuImageUrl,
    required String menuDescription,
    required int menuPrice,
    required VoidCallback onCancel,
  })  : _menuName = menuName,
        _menuImageUrl = menuImageUrl,
        _menuDescription = menuDescription,
        _menuPrice = menuPrice,
        _onCancel = onCancel,
        super(key: key);

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
                onPressed: _onCancel,
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
                    _menuImageUrl,
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
                  Text('${_menuPrice.toMoneyFormatString()}원'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );;
  }
}
