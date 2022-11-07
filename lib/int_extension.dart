import 'package:intl/intl.dart';

extension IntExtension on int {
  String formatToString() {
    final NumberFormat formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}