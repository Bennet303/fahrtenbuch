import 'package:fahrtenbuch/core/utils/date.helper.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  DateTime tDateTime = DateTime(2021, 3, 7);

  test('should return correct month name', () {
    // arrange
    final expected = "March";
    // act
    final res = DateHelper.getMonthName(tDateTime);
    // assert
    expect(res, expected);
  });

  test('should return the last day of the month', () {
    // arrange
    final expected = 31;
    // act
    final res = DateHelper.getLastDayOfMonth(tDateTime);
    // assert
    expect(res.day, expected);
  });

  test('should return the last day of the month for December', () {
    // arrange
    final expected = 31;
    // act
    final res = DateHelper.getLastDayOfMonth(DateTime(2021, 12, 1));
    // assert
    expect(res.day, expected);
  });
}
