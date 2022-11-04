import 'package:flutter/material.dart';
import 'int_extension.dart';
import 'label.dart';
import 'store.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required this.store,
    required this.cart,
  }) : super(key: key);

  final Store store;
  final List<Item> cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int subtotal = 0;
  int paymentTotal = 0;

  @override
  void initState() {
    for(var item in widget.cart) {
      subtotal += item.price;
    }
    paymentTotal = subtotal + widget.store.deliveryFee;
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
            name: widget.store.name,
            logo: widget.store.logo,
          ),
          SizedBox(height: 1),
          CartContainer(items: widget.cart),
          SizedBox(height: 1),
          AdditionalOrderButton(),
          PaymentTotalContainer(
            subtotal: subtotal.formatToString(),
            deliveryFee: widget.store.deliveryFee.formatToString(),
            paymentTotal: paymentTotal.formatToString(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: OrderButton(
            paymentTotal: paymentTotal.formatToString(),
            itemCount: widget.cart.length.formatToString(),
          ),
        ),
      ),
    );
  }
}

class StoreInformationContainer extends StatelessWidget {
  const StoreInformationContainer({
    Key? key,
    required this.name,
    required this.logo,
  }) : super(key: key);

  final String name;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('images/$logo', width: 35, height: 35),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ...items.map((item) => ItemTile(item)).toList(),
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Text(
              item.name,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.close, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 20),
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
                  'images/${item.image}',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Offstage(offstage: item.description == null,
                  child: Text(
                    item.description ?? '',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1),
                    ),
                  ),
                ),
                Text('${item.price.formatToString()}${Label.won.displayName}'),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class AdditionalOrderButton extends StatelessWidget {
  const AdditionalOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 2,
            ),
          ),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(
              Label.additionalOrder.displayName,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTotalContainer extends StatelessWidget {
  const PaymentTotalContainer({
    Key? key,
    required this.subtotal,
    required this.deliveryFee,
    required this.paymentTotal,
  }) : super(key: key);

  final String subtotal;
  final String deliveryFee;
  final String paymentTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 2),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(Label.subtotal.displayName),
                Spacer(),
                Text('$subtotal${Label.won.displayName}'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  Label.deliveryFee.displayName,
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '$deliveryFee${Label.won.displayName}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  Label.paymentTotal.displayName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '$paymentTotal${Label.won.displayName}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
    required this.paymentTotal,
    required this.itemCount,
  }) : super(key: key);

  final String paymentTotal;
  final String itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(44, 191, 188, 1.0),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  itemCount,
                  style: TextStyle(
                    color: Color.fromRGBO(44, 191, 188, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 7),
            Text(
              '$paymentTotal${Label.won.displayName} ${Label.order.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
