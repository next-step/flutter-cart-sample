import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cart_screen.dart';

typedef CountCallback = void Function(int value);

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description,
    this.onChanged,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final int price;
  final String? description;
  final CountCallback? onChanged;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  @override
  void didChangeDependencies() {
    final menuCount = MenuCount.of(context);

    super.didChangeDependencies();
  }

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
              Text(
                widget.name,
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
                    widget.imageUrl,
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
                    widget.description ?? '',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text(NumberFormat('#,###원').format(widget.price)),
                ],
              ),
            ],
          ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCount(BuildContext context) {
    int count = MenuCount.of(context).count;

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
            onPressed: count == 1 ? null : () {
              widget.onChanged?.call(count - 1);
            },
          ),
          Text('$count'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              widget.onChanged?.call(count + 1);
            },
          ),
        ],
      ),
    );
  }
}