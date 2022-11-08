import 'package:flutter/material.dart';

import '../model/store_name_data.dart';

class StoreNameWidget extends StatelessWidget {
  const StoreNameWidget(
    StoreNameData storeNameData, {
    Key? key,
  })  : _storeNameData = storeNameData, super(key: key);

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
