part of '../cart_screen.dart';

class AdditionalOrderButton extends StatelessWidget {
  const AdditionalOrderButton({Key? key}) : super(key: key);

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

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
    required this.paymentTotal,
    required this.itemCount,
  }) : super(key: key);

  final String paymentTotal;
  final String itemCount;

  @override
  Widget build(BuildContext context) {
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
                  itemCount,
                  style: TextStyle(
                    color: Color.fromRGBO(44, 191, 188, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 7),
            Text(
              '$paymentTotal${Label.won.displayName} ${Label.order.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
