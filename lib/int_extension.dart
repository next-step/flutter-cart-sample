import 'package:intl/intl.dart';

extension IntExtension on int {
  String formatToString() {
    var formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}