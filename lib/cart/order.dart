part of './cart_screen.dart';

class Order extends StatelessWidget {
  final int payment;
  const Order({Key? key, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = Provider.of<int>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                orderCount(count),
                SizedBox(
                  width: 7,
                ),
                buttonContents(krw(payment)),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(44, 191, 188, 1.0),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
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

  Text buttonContents(payment) {
    return Text(
      '$payment 배달 주문하기',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
