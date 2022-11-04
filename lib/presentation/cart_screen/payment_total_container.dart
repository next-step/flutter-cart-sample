part of '../cart_screen.dart';

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