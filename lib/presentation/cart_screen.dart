import 'package:flutter/material.dart';
import '../int_extension.dart';
import 'cart_screen/label.dart';
import '../model/store.dart';

part 'cart_screen/buttons.dart';

part 'cart_screen/cart_container.dart';

part 'cart_screen/payment_total_container.dart';

part 'cart_screen/store_information_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required Store store,
    required List<Item> cart,
  })  : _store = store,
        _cart = cart,
        super(key: key);

  final Store _store;
  final List<Item> _cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int subtotal = 0;
  int paymentTotal = 0;

  @override
  void initState() {
    subtotal = widget._cart.fold(0, (sum, item) => sum + item.price);
    paymentTotal = subtotal + widget._store.deliveryFee;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          Label.cart.displayName,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          StoreInformationContainer(
            name: widget._store.name,
            logo: widget._store.logo,
          ),
          SizedBox(height: 1),
          CartContainer(items: widget._cart),
          SizedBox(height: 1),
          AdditionalOrderButton(),
          PaymentTotalContainer(
            subtotal: subtotal.formatToString(),
            deliveryFee: widget._store.deliveryFee.formatToString(),
            paymentTotal: paymentTotal.formatToString(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: OrderButton(
            paymentTotal: paymentTotal.formatToString(),
            itemCount: widget._cart.length.formatToString(),
          ),
        ),
      ),
    );
  }
}
