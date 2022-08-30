part of './cart_screen.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                orderCount(),
                SizedBox(
                  width: 7,
                ),
                buttonContents(),
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

  Container orderCount() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '1',
          style: TextStyle(
            color: Color.fromRGBO(44, 191, 188, 1.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Text buttonContents() {
    return Text(
      '21,000원 배달 주문하기',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
