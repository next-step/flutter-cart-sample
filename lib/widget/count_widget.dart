import 'package:flutter/material.dart';

class CountWidget extends InheritedWidget {
  final int count;

  const CountWidget({
    Key? key,
    required Widget child,
    required this.count,
  }) : super(key: key, child: child);

  static CountWidget of(BuildContext context) {
    final CountWidget? result =
        context.dependOnInheritedWidgetOfExactType<CountWidget>();
    assert(result != null, 'No CountWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    return oldWidget.count != count;
  }
}
