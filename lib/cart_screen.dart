import 'package:flutter/material.dart';
import 'package:cart_sample/store_name.dart';

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
          StoreName(name: '치킨 잠실점'),
          SizedBox(
            height: 1,
          ),
          _buildMenu(),
          SizedBox(
            height: 1,
          ),
          _buildAddMore(),
          _buildBilling(),
        ],
      ),
      bottomNavigationBar: Container(
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
                    '21,000원 배달 주문하기',
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

  Widget _buildMenu() {
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
                '후라이드 치킨',
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
                    '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text('18,000원'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildAddMore() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 2,
            ),
          ),
        ),
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

  Widget _buildBilling() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('총 주문금액'),
                Spacer(),
                Text('18,000원'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
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
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
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
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
