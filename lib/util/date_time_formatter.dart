import 'package:intl/intl.dart';

String formatFromDateFormatString({
  required DateTime dateTime,
  required String formatString,
}) {
  final formatter = DateFormat(formatString);
  final formatted = formatter.format(dateTime);
  return formatted;
}
