part of './cart_screen.dart';

class Order extends StatefulWidget {
  final int price;
  final int deliveryTip;

  const Order(
      {Key? key, required this.price, required this.deliveryTip})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            height: 65,
            padding: padding,
            child: _contents(),
          ),
        ));
  }

  Consumer<Count> _contents() {
    return Consumer<Count>(
            builder: (BuildContext context, value, Widget? child) {
              return ElevatedButton(
                child: _buttonContents(value),
                style: _buttonStyle(),
                onPressed: () {},
              );
            },
          );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(44, 191, 188, 1.0),
                ),
              );
  }
  int _calculate(Count value) => widget.price * value.count + widget.deliveryTip;

  Row _buttonContents(Count value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _orderCount(value.count),
        SizedBox(width: 7),
        _buttonPhase(krw(_calculate(value))),
      ],
    );
  }

  Container _orderCount(count) {
    return Container(
      width: 25,
      height: 25,
      decoration: _decoration(),
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

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    );
  }

  Text _buttonPhase(payment) {
    return Text(
      '$payment 배달 주문하기',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
