import 'package:cart_sample/widget/order_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/CartInfoNotifier.dart';
import 'widget/add_more.dart';
import 'widget/billing.dart';
import 'widget/menu.dart';
import 'widget/store_name.dart';

part 'cart_screen_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}
