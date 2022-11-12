import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(locale: "ko_KR", name: "", decimalDigits: 0);

  static String convert(int currency) {
    return _formatter.format(currency);
  }
}
