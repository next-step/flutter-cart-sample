part of '../cart_screen.dart';

class _OrderWidget extends StatelessWidget {
  const _OrderWidget({
    Key? key,
    required this.totalPrice,
    required this.deliveryPrice,
  }) : super(key: key);

  final String totalPrice;
  final String deliveryPrice;

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<int>(context);

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
                Container(
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
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  '${NumberUtil.formatByDefaultCurrency(_calculateToBePaidPrice(count))}원 '
                  '배달 주문하기',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(44, 191, 188, 1.0),
              ),
            ),
            onPressed: () {
              debugPrint('ElevatedButton');
            },
          ),
        ),
      ),
    );
  }

  String _calculateToBePaidPrice(int count) {
    return '${int.parse(totalPrice) * count + int.parse(deliveryPrice)}';
  }
}
