import 'package:intl/intl.dart';

String formatPrice(int price) {
  final numberFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');
  return "${numberFormat.format(price)} 원";
}
