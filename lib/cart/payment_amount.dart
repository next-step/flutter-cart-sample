part of './cart_screen.dart';

class PaymentAmount extends StatelessWidget {
  final int totalOrderAmount;
  final int deliveryTip;

  const PaymentAmount(
      {Key? key, required this.totalOrderAmount, required this.deliveryTip})
      : super(key: key);

  int calculate() {
    return totalOrderAmount + deliveryTip;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _totalOrderAmount(krw(totalOrderAmount)),
          SizedBox(
            height: 10,
          ),
          _deliveryTip(krw(deliveryTip)),
          _divider(),
          _paymentAmount(krw(calculate())),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Padding _totalOrderAmount(totalOrderAmount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text('총 주문금액'),
          Spacer(),
          Text(totalOrderAmount),
        ],
      ),
    );
  }

  Padding _paymentAmount(paymentAmount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '결제예정금액',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            paymentAmount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding _deliveryTip(deliveryTip) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '배탈팁',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            deliveryTip,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Padding _divider() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
    );
  }
}
