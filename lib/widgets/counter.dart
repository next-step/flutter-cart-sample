import 'package:flutter/material.dart';

class Counter extends InheritedWidget {
  const Counter({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  final int value;

  static Counter of(BuildContext context) {
    final Counter? result =
        context.dependOnInheritedWidgetOfExactType<Counter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Counter old) {
    return old.value != value;
  }
}
