part of 'cart_screen.dart';

class _CartScreenState extends State<CartScreen> {
  CartInfo _cartInfo = CartInfo(count: 1, price: 17500, deliveryFee: 3000);

  void _increaseCount() {
    setState(() {
      _cartInfo = _cartInfo.countUp();
    });
  }

  void _decreaseCount() {
    setState(() {
      _cartInfo = _cartInfo.countDown();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _cartInfo,
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.black,
            ),
            title: const Text(
              '장바구니',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              StoreName(
                storeImageUrl: 'images/chickenCartoonImage.jpg',
                storeName: '치킨 잠실점',
              ),
              SizedBox(
                height: 1,
              ),
              Menu(
                menuName: '후라이드 치킨',
                menuImageUrl: 'images/chicken.png',
                menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
                onCancel: () => {},
                onIncrease: _increaseCount,
                onDecrease: _decreaseCount,
              ),
              SizedBox(
                height: 1,
              ),
              AddMore(
                onTap: () => {},
              ),
              Billing(),
            ],
          ),
          bottomNavigationBar: OrderButton(
            onPressed: () => {},
          )),
    );
  }
}

//Scaffold(
//           backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
//           appBar: AppBar(
//             leading: const BackButton(
//               color: Colors.black,
//             ),
//             title: const Text(
//               '장바구니',
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             elevation: 0,
//             backgroundColor: Colors.white,
//           ),
//           body: ListView(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               StoreName(
//                 storeImageUrl: 'images/chickenCartoonImage.jpg',
//                 storeName: '치킨 잠실점',
//               ),
//               SizedBox(
//                 height: 1,
//               ),
//               Menu(
//                 menuName: '후라이드 치킨',
//                 menuImageUrl: 'images/chicken.png',
//                 menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
//                 menuPrice: 17500,
//                 onCancel: () => {},
//                 onIncrease: _increaseCount,
//                 onDecrease: _decreaseCount,
//               ),
//               SizedBox(
//                 height: 1,
//               ),
//               AddMore(
//                 onTap: () => {},
//               ),
//               Billing(
//                 totalAmount: 17500 * _count,
//                 deliveryFee: 3000,
//               ),
//             ],
//           ),
//           bottomNavigationBar: OrderButton(
//             numberOfMenu: 1,
//             totalPayAmount: 17500 * _count + 3000,
//             onPressed: () => {},
//           ))
