import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final formatter = NumberFormat.currency(locale: "ko_KR", name: "", decimalDigits: 0);

  static String convert(int currency) {
    return formatter.format(currency);
  }
}
