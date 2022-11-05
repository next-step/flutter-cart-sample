import 'package:intl/intl.dart';

final _simpleCurrencyFormat = NumberFormat.currency(
  locale: 'ko_KR',
  symbol: '',
);

extension MoneyFormatString on int {
  String toMoneyFormatString() {
    return _simpleCurrencyFormat.format(this);
  }
}
