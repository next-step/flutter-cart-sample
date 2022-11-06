import 'package:intl/intl.dart';

class Formatter {
  static String getWon(int number) {
    final f = NumberFormat.currency(
      locale: 'ko_KR',
      customPattern: '###,###,###원',
    );

    return f.format(number);
  }
}
