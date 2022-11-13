part of 'cart_screen.dart';

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartInfoNotifier(),
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
        ),
      ),
    );
  }
}
