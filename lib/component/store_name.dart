import 'package:flutter/material.dart';

class StoreName extends StatelessWidget {

  final String storeName;
  final String storeImage;

  const StoreName({Key? key, required this.storeName, required this.storeImage, }) : super(key: key);

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
              storeImage,
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            storeName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
