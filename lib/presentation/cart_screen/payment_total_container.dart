part of '../cart_screen.dart';

class PaymentTotalContainer extends StatelessWidget {
  const PaymentTotalContainer({
    Key? key,
    required String subtotal,
    required String deliveryFee,
    required String paymentTotal,
  })  : _subtotal = subtotal,
        _deliveryFee = deliveryFee,
        _paymentTotal = paymentTotal,
        super(key: key);

  final String _subtotal;
  final String _deliveryFee;
  final String _paymentTotal;

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
                Text('$_subtotal${Label.won.displayName}'),
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
                  '$_deliveryFee${Label.won.displayName}',
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
                  '$_paymentTotal${Label.won.displayName}',
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
