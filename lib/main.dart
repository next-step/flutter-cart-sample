import 'package:cart_sample/model/menu_count_model.dart';
import 'package:cart_sample/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => MenuCounterModel(), child: CartScreen()),
    );
  }
}