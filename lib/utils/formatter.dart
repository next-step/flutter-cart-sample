import 'package:intl/intl.dart';

class Formatter {
  static String getWon(double number) {
    var f = NumberFormat.currency(
      locale: 'ko_KR',
      customPattern: '###,###,###원',
    );

    return f.format(number);
  }
}
