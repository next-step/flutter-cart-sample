part of './cart_screen.dart';

class Order extends StatefulWidget {
  final int payment;

  const Order({Key? key, required this.payment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            height: 65,
            padding: padding,
            child: Consumer<Count>(
              builder: (BuildContext context, value, Widget? child) {
                return ElevatedButton(
                  child: buttonContents(value),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(44, 191, 188, 1.0),
                    ),
                  ),
                  onPressed: () {},
                );
              },
            ),
          ),
        ));
  }

  Row buttonContents(Count value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        orderCount(value.count),
        SizedBox(width: 7),
        contents(krw(widget.payment)),
      ],
    );
  }

  Container orderCount(count) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$count',
          style: TextStyle(
            color: Color.fromRGBO(44, 191, 188, 1.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Text contents(payment) {
    return Text(
      '$payment 배달 주문하기',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
