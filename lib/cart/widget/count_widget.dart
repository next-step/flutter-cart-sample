import 'package:flutter/material.dart';

class CountWidget extends InheritedWidget {
  const CountWidget({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  final int value;

  static CountWidget of(BuildContext context) {
    final CountWidget? result =
        context.dependOnInheritedWidgetOfExactType<CountWidget>();
    assert(result != null, 'No CountWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CountWidget old) {
    return old.value != value;
  }
}
