import 'package:intl/intl.dart';

class NumberUtil {
  static String formatByDefaultCurrency(String number) {
    final result = NumberFormat.currency(locale: 'ko_KR', symbol: '');
    return result.format(int.parse(number));
  }
}
