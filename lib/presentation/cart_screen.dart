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
  })
      : _store = store,
        _cart = cart,
        super(key: key);

  final Store _store;
  final Item _cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int subtotal = 0;
  int counter = 1;

  void _increaseCount() {
    setState(() {
      subtotal += widget._cart.price;
      counter++;
    });
  }

  void _decreaseCount() {
    if (counter > 1) {
      setState(() {
        subtotal -= widget._cart.price;
        counter--;
      });
    }
  }

  @override
  void initState() {
    counter = widget._cart.count;
    subtotal = widget._cart.price * counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Counter(
      counter,
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
            CartContainer(
              items: widget._cart,
              onAddButtonPressed: _increaseCount,
              onRemoveButtonPressed: _decreaseCount,
            ),
            SizedBox(height: 1),
            _AdditionalOrderButton(),
            SubtotalCalculator(
              subtotal,
              child: PaymentTotalContainer(
                deliveryFee: widget._store.deliveryFee,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            child: _OrderButton(paymentTotal: paymentTotal.formatToString()),
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
  const _OrderButton({
    Key? key,
    required String paymentTotal,
  })
      : _paymentTotal = paymentTotal,
        super(key: key);

  final String _paymentTotal;

  @override
  Widget build(BuildContext context) {
    final int itemCount = Counter
        .of(context)
        .count;

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
              '$_paymentTotal${Label.won.displayName} ${Label.order
                  .displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends InheritedWidget {
  const Counter(this.count, {
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
  const SubtotalCalculator(this.subtotal, {
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
