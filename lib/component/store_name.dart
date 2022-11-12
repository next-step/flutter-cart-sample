import 'package:flutter/material.dart';

class StoreName extends StatelessWidget {
  final String _storeName;
  final String _storeImage;

  const StoreName({
    Key? key,
    required storeName,
    required storeImage,
  })  : _storeName = storeName,
        _storeImage = storeImage,
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
              _storeImage,
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
