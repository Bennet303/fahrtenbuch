import 'package:fahrtenbuch/features/export/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late CsvExportDataSource csvExportDataSource;
  late List<TripExportModel> tTrips;
  final String tFieldDelimter = ';';

  setUp(() {
    csvExportDataSource = CsvExportDataSource();
    tTrips = [
      TripExportModel(DateTime.now(), "u389asdglk", 128921, 321.5, "Berlin")
    ];
  });

  test('csv should contain the correct header', () {
    // arrange
    final expected =
        'Datum${tFieldDelimter}Uhrzeit${tFieldDelimter}Kilometerstand${tFieldDelimter}Tageskilometer${tFieldDelimter}Ort';

    // act
    final res = csvExportDataSource.convertTripsToCSV(tTrips);

    // assert
    assert(res.startsWith(expected));
  });

  test('field should be delmited by a semikolon', () {
    // arrange
    final expected = 'Datum;Uhrzeit';

    // act
    final res = csvExportDataSource.convertTripsToCSV(tTrips);

    // assert
    assert(res.contains(expected));
  });
}
