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
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar() {
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

  ListView body() {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        StoreName(),
        SizedBox(
          height: 1,
        ),
        Product(),
        SizedBox(
          height: 1,
        ),
        More(),
        PaymentAmount(),
      ],
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
  const StoreName({Key? key}) : super(key: key);

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
          storeNameImage(),
          SizedBox(
            width: 10,
          ),
          storeName()
        ],
      ),
    );
  }

  Text storeName() {
    return Text(
      '치킨 잠실점',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  ClipRRect storeNameImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'images/chickenCartoonImage.jpg',
        width: 35,
        height: 35,
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

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
              menuTitle(),
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
              menuImage(),
              SizedBox(
                width: 10,
              ),
              menuContents(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column menuContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
          style: TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1.0),
          ),
        ),
        Text('18,000원'),
      ],
    );
  }

  Container menuImage() {
    return Container(
      decoration: menuImageDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'images/chicken.png',
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration menuImageDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.3),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Text menuTitle() {
    return Text(
      '후라이드 치킨',
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
