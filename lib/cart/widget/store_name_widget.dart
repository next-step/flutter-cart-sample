import 'package:cart_sample/cart/model/store_name_data.dart';
import 'package:flutter/material.dart';

class StoreNameWidget extends StatelessWidget {
  const StoreNameWidget(this._storeNameData, {Key? key}) : super(key: key);

  final StoreNameData _storeNameData;

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
              _storeNameData.image,
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            _storeNameData.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
