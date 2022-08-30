part of './cart_screen.dart';
class PaymentAmount extends StatelessWidget {
  final String totalOrderAmount;
  final String paymentAmount;
  final String deliveryTip;
  const PaymentAmount({Key? key, required this.totalOrderAmount, required this.paymentAmount, required this.deliveryTip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _totalOrderAmount(totalOrderAmount),
          SizedBox(
            height: 10,
          ),
          _deliveryTip(deliveryTip),
          _divider(),
          _paymentAmount(paymentAmount),
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
          Text('$totalOrderAmount원'),
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
            '$paymentAmount원',
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
            '$deliveryTip원',
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
