import 'package:flutter/material.dart';
import 'package:cart_sample/view/cart/store_name.dart';
import 'package:cart_sample/view/cart/menu_screen.dart';
import 'package:cart_sample/view/cart/billing.dart';
import 'package:cart_sample/view/order_button.dart';
import 'package:provider/provider.dart';
import 'package:cart_sample/model/cart.dart';

part 'cart/add_more.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Cart _cart = widget.cart;
    return ChangeNotifierProvider(
      create: (context) => _cart,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            '장바구니',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            StoreName(
              name: _cart.storeName,
              storeImagePath: _cart.storeImgPath,
            ),
            SizedBox(
              height: 1,
            ),
            ...List<Widget>.generate(_cart.getSize(), (index) {
              Menu _menu = _cart.getMenu(index);
              return MenuScreen(
                valueKey: ValueKey(index),
                menuTitle: _menu.itemName,
                menuImagePath: _menu.itemImgPath,
                price: _menu.price,
              );
            }),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(),
          ],
        ),
        bottomNavigationBar: OrderButton(),
      ),
    );
  }
}
