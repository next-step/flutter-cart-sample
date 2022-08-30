import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
      appBar: _appBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          StoreName(name: '치킨 잠실점', image: 'images/chickenCartoonImage.jpg'),
          SizedBox(
            height: 1,
          ),
          Product(
              name: '후라이드 치킨',
              image: 'images/chicken.png',
              contents: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
              price: '18,000'),
          SizedBox(
            height: 1,
          ),
          More(),
          PaymentAmount(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Widget bottomNavigationBar() {
    return Order();
  }
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

class StoreName extends StatelessWidget {
  final String name;
  final String image;

  const StoreName({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          storeNameImage(image),
          SizedBox(
            width: 10,
          ),
          storeName(name)
        ],
      ),
    );
  }

  Text storeName(name) {
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  ClipRRect storeNameImage(image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        image,
        width: 35,
        height: 35,
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String image;
  final String contents;
  final String price;

  const Product(
      {Key? key,
      required this.name,
      required this.image,
      required this.contents,
      required this.price})
      : super(key: key);

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
              productName(name),
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
              productImage(image),
              SizedBox(
                width: 10,
              ),
              productContents(contents, price),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column productContents(contents, price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contents,
          style: TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1.0),
          ),
        ),
        Text('$price원'),
      ],
    );
  }

  Container productImage(image) {
    return Container(
      decoration: productImageDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration productImageDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.3),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Text productName(name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: decoration(),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(
              '더 담으러 가기',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
    );
  }
}

class PaymentAmount extends StatelessWidget {
  const PaymentAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          totalOrderAmount(),
          SizedBox(
            height: 10,
          ),
          deliveryTip(),
          divider(),
          paymentAmount(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Padding totalOrderAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text('총 주문금액'),
          Spacer(),
          Text('18,000원'),
        ],
      ),
    );
  }

  Padding paymentAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '결제예정금액',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            '21,000원',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding deliveryTip() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '배탈팁',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            '3,000원',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Padding divider() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
    );
  }
}

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
