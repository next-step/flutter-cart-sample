import 'package:flutter/material.dart';

class StoreNameWidget extends StatelessWidget {
  const StoreNameWidget(
    this._image,
    this._title, {
    Key? key,
  }) : super(key: key);

  final String _image;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(_image, width: 35, height: 35),
          ),
          SizedBox(width: 10),
          Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
