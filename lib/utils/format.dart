import 'package:intl/intl.dart';

String krw(int price) {
  return NumberFormat.currency(locale: 'ko_KR', symbol: '').format(price) + '원';
}