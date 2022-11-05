import 'package:flutter/material.dart';

class StoreName extends StatelessWidget {
  final String _storeName;
  final String _storeImageUrl;

  const StoreName({
    Key? key,
    required String storeName,
    required String storeImageUrl,
  })  : _storeName = storeName,
        _storeImageUrl = storeImageUrl,
        super(key: key);

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
              _storeImageUrl,
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            _storeName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
