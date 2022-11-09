import 'package:intl/intl.dart';

String getPriceString(int price) {
  return '${NumberFormat('#,###').format(price)}원';
}
