import 'package:flutter/material.dart';
import '../cart_screen.dart';

// 10. CountCallback typedef 선언
typedef CountCallback = void Function(int value);

class QuantityControlButton extends StatefulWidget {
  // 9. onChanged field 생성
  final CountCallback? onChanged;

  const QuantityControlButton({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<QuantityControlButton> createState() => _QuantityControlButtonState();
}

class _QuantityControlButtonState extends State<QuantityControlButton> {
  // 11. didChangeDependencies 를 override
  @override
  void didChangeDependencies() {
    final menuCount = MenuCount.of(context);
    // State 가 변경되어 build 를 다시 호출하기 전 didChangeDependencies 가 호출되므로
    // inheritedWidget 에 접근해 class 를 받아오기 좋은 위치라고 함
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          width: 100,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 39,
                height: 43,
                child: TextButton(
                  child: Icon(Icons.remove),
                  onPressed: _isCounterOne() ? null : _decreaseCounter,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // foreground
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 43,
                child: Center(child: Text('${MenuCount.of(context).count}')),
              ),
              SizedBox(
                width: 39,
                height: 43,
                child: TextButton(
                  child: Icon(Icons.add),
                  onPressed: _increaseCounter,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // foreground
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  bool _isCounterOne() {
    if (MenuCount.of(context).count == 1) return true;
    return false;
  }

  void _increaseCounter() {
    widget.onChanged?.call(MenuCount.of(context).count - 1);
  }

  void _decreaseCounter() {
    widget.onChanged?.call(MenuCount.of(context).count + 1);
  }
}
