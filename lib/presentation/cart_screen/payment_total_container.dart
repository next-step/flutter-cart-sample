part of '../cart_screen.dart';

class PaymentTotalContainer extends StatelessWidget {
  const PaymentTotalContainer({Key? key, required int deliveryFee})
      : _deliveryFee = deliveryFee,
        super(key: key);

  final int _deliveryFee;

  @override
  Widget build(BuildContext context) {
    final int subtotal = SubtotalCalculator.of(context).subtotal;
    final int paymentTotal = subtotal + _deliveryFee;

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
                Text('${subtotal.toString()}${Label.won.displayName}'),
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
                  '${_deliveryFee.toString()}${Label.won.displayName}',
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
                  '${paymentTotal.toString()}${Label.won.displayName}',
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
