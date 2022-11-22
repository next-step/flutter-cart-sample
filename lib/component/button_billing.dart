part of '../cart_screen.dart';

class ButtonBilling extends StatelessWidget {
  final String _price;
  final VoidCallback? onPressed;

  const ButtonBilling(this._price, {Key? key, required this.onPressed})
      : super(key: key);

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color.fromRGBO(44, 191, 188, 1.0),
      ),
    );
  }

  Row _children() {
    return Row(
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
          '$_price원 배달 주문하기',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _children(),
      style: _buttonStyle(),
      onPressed: onPressed,
    );
  }
}
