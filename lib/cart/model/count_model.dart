import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  CountModel({required this.count});

  int count;

  void update(int count) {
    this.count = count;
    notifyListeners();
  }
}
