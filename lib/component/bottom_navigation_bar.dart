part of '../../screen/cart_screen.dart';

class BottomButton extends StatelessWidget {
  final int _menuPrice;
  final int _deliveryPrice;

  const BottomButton({Key? key, required menuPrice, required deliveryPrice})
      : _menuPrice = menuPrice,
        _deliveryPrice = deliveryPrice,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuCounterModel>(
      builder: (context, menuCount, child) => Container(
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
                    '${_calculateTotalPrice(menuCount)}원 배달 주문하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
      ),
    );
  }

  int _calculateTotalPrice(MenuCounterModel menuCounter) =>
      _deliveryPrice + (_menuPrice * menuCounter.menuCount);
}
