import 'package:cart_sample/cart/model/count_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
    this._name,
    this._image,
    this._description,
    this._price, {
    Key? key,
  }) : super(key: key);

  final String _name;
  final String _image;
  final String _description;
  final String _price;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                _name,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 20),
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
                    _image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _description,
                    style: TextStyle(color: Color.fromRGBO(125, 125, 125, 1.0)),
                  ),
                  Text(_price),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildCount(context),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildCount(BuildContext context) {
    final countModel = Provider.of<CountModel>(context);
    final count = Provider.of<CountModel>(context).count;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed: count == 1
                ? null
                : () {
                    countModel.count = count - 1;
                  },
          ),
          Text('$count'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              countModel.count = count + 1;
            },
          ),
        ],
      ),
    );
  }
}
