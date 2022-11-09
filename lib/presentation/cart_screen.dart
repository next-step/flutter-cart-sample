import 'package:flutter/material.dart';
import '../int_extension.dart';
import 'cart_screen/label.dart';
import '../model/store.dart';

part 'cart_screen/cart_container.dart';

part 'cart_screen/payment_total_container.dart';

part 'cart_screen/store_information_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required Store store,
    required Item cart,
  })  : _store = store,
        _cart = cart,
        super(key: key);

  final Store _store;
  final Item _cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _subtotal = 0;
  int _counter = 1;
  late Item _item;

  void _increaseCount() {
    setState(() {
      _subtotal += widget._cart.price;
      _counter++;
    });
  }

  void _decreaseCount() {
    if (_counter > 1) {
      setState(() {
        _subtotal -= widget._cart.price;
        _counter--;
      });
    }
  }

  @override
  void initState() {
    _counter = widget._cart.count;
    _subtotal = widget._cart.price * _counter;
    _item = widget._cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Counter(
      _counter,
      child: Scaffold(
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
            Cart(_item,
              child: CartContainer(
                onAddButtonPressed: _increaseCount,
                onRemoveButtonPressed: _decreaseCount,
              ),
            ),
            SizedBox(height: 1),
            _AdditionalOrderButton(),
            SubtotalCalculator(
              _subtotal,
              child: PaymentTotalContainer(
                deliveryFee: widget._store.deliveryFee,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            child: SubtotalCalculator(_subtotal, child: _OrderButton()),
          ),
        ),
      ),
    );
  }
}

class _AdditionalOrderButton extends StatelessWidget {
  const _AdditionalOrderButton({Key? key}) : super(key: key);

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

class _OrderButton extends StatelessWidget {
  const _OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemCount = Counter.of(context).count;
    final int subtotal = SubtotalCalculator.of(context).subtotal;

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
                  itemCount.toString(),
                  style: TextStyle(
                    color: Color.fromRGBO(44, 191, 188, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 7),
            Text(
              '$subtotal${Label.won.displayName} ${Label.order.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends InheritedWidget {
  const Counter(
    this.count, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final int count;

  static Counter of(BuildContext context) {
    final Counter? result =
        context.dependOnInheritedWidgetOfExactType<Counter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Counter oldWidget) {
    return oldWidget.count != count;
  }
}

class SubtotalCalculator extends InheritedWidget {
  const SubtotalCalculator(
    this.subtotal, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final int subtotal;

  static SubtotalCalculator of(BuildContext context) {
    final SubtotalCalculator? result =
        context.dependOnInheritedWidgetOfExactType<SubtotalCalculator>();
    assert(result != null, 'No SubtotalCalculator found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SubtotalCalculator oldWidget) {
    return oldWidget.subtotal != subtotal;
  }
}

class Cart extends InheritedWidget {
  const Cart(
    this.item, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final Item item;

  static Cart of(BuildContext context) {
    final Cart? result = context.dependOnInheritedWidgetOfExactType<Cart>();
    assert(result != null, 'No Cart found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Cart oldWidget) {
    return oldWidget.item != item;
  }
}
