import 'package:cart_sample/model/menu_count_model.dart';
import 'package:cart_sample/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  final String _menuName;
  final String _menuImage;
  final String _menuDescription;
  final String _formattedPrice;

  Menu({
    Key? key,
    required menuName,
    required menuImage,
    required price,
    required menuDescription,
  })  : _menuName = menuName,
        _menuImage = menuImage,
        _menuDescription = menuDescription,
        _formattedPrice = CurrencyFormatter.convert(price),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuCounterModel>(
      builder: (context, menuCounter, child) => Container(
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
                _menuCountButton(menuCounter),
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
      ),
    );
  }

  Widget _menuCountButton(MenuCounterModel menuCounter) {
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
            onPressed: menuCounter.menuCount <= 1
                ? null
                : () {
                    menuCounter.minus();
                  },
          ),
          Text('${menuCounter.menuCount}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              menuCounter.add();
            },
          ),
        ],
      ),
    );
  }
}
