import 'package:flutter_test/flutter_test.dart';
import 'package:memo_sample/util/date_time_formatter.dart';

void main() {
  group('[formatFromDateFormatString]', () {
    test('Return correctly String', () {
      const dateTimeString = '2022-01-01 10:01:00';
      final dateTime = DateTime.parse(dateTimeString);
      final result = formatFromDateFormatString(
        dateTime: dateTime,
        formatString: 'yyyy-MM-dd HH:mm:ss',
      );
      expect(result, equals(dateTimeString));
    });
  });
}
