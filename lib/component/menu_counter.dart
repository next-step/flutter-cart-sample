import 'package:flutter/material.dart';

class MenuCounter extends InheritedWidget {

  final int value;

  MenuCounter({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  static MenuCounter of(BuildContext context) {
    final MenuCounter? result =
    context.dependOnInheritedWidgetOfExactType<MenuCounter>();
    assert(result != null, 'No MenuCounter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuCounter old) {
    return old.value != value;
  }
}
