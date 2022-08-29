import 'package:intl/intl.dart';

String formatPrice(int price) {
  // Intl.getCurrentLocale()
  var f = NumberFormat.currency(locale: 'ko_KR', symbol: '');

  return f.format(price) + '원';
}
