part of './cart_screen.dart';
class PaymentAmount extends StatelessWidget {
  const PaymentAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _totalOrderAmount(),
          SizedBox(
            height: 10,
          ),
          _deliveryTip(),
          _divider(),
          _paymentAmount(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Padding _totalOrderAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text('총 주문금액'),
          Spacer(),
          Text('18,000원'),
        ],
      ),
    );
  }

  Padding _paymentAmount() {
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
            '21,000원',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding _deliveryTip() {
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
            '3,000원',
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
