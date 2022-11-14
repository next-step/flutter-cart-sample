part of '../cart_screen.dart';

// 6. CountCallback typedef 선언
typedef CountCallback = void Function(int value);

// 4. Menu Widget Stateless -> Stateful 변경
class _Menu extends StatefulWidget {
  final String menuName;
  final int menuPrice;
  final String eventContents;
  // 5. onChanged field 생성
  final CountCallback? onChanged;

  const _Menu({
    Key? key,
    required this.menuName,
    required this.menuPrice,
    required this.eventContents,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuWidgetState();
}

// 4. createState 에서 호출할 State Object 를 상속받은 class 구현
class _MenuWidgetState extends State<_Menu> {
  // 7. didChangeDependencies 를 override
  @override
  void didChangeDependencies() {
    final menuCount = MenuCount.of(context);
    // State 가 변경되어 build 를 다시 호출하기 전 didChangeDependencies 가 호출되므로
    // inheritedWidget 에 접근해 클래스를 받아오기 좋은 위치라고 함
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                widget.menuName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/chicken.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 8. 기존에 바로 접근하던 stateless 의 parameter 를
                    // _Menu widget 의 값에서 가져오도록 변경
                    widget.eventContents,
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text(numberFormat.format(widget.menuPrice)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // 새로운 Widget Class 대신 Method 로 변경
          _buildCount(context),
          // QuantityControlButton(
          //   onChanged: (count) {
          //     widget.onChanged?.call(MenuCount.of(context).count = count);
          //   },
          // ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  // 8. build Method 와 flat 한 위치에 _buildCount 생성
  Widget _buildCount(BuildContext context) {
    int count = MenuCount.of(context).count;

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
                  onPressed: _isCounterOne(count)
                      ? null
                      : () => widget.onChanged?.call(count - 1),
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
                  onPressed: () => widget.onChanged?.call(count + 1),
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

  bool _isCounterOne(int count) {
    if (count == 1) return true;
    return false;
  }
}
