import 'package:flutter/material.dart';

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
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'images/chickenCartoonImage.jpg',
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '치킨 잠실점',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}