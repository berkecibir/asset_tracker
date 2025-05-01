import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(double value) {
    final formatter = NumberFormat.currency(
      locale: 'tr_TR',
      symbol: '₺',
    );
    return formatter.format(value);
  }
}
