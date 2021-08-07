import 'package:fahrtenbuch/features/export/data/models/trip.export.model.dart';
import 'package:fahrtenbuch/features/trips/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('fromTrip()', () {
    test('should be created from a trip correctly', () {
      // arrange
      Trip tTrip = Trip(
        dateAndTime: DateTime.now(),
        kmAbsolute: 128921,
        kmTrip: 321.5,
        location: "Berlin",
      );

      // act
      final res = TripExportModel.fromTrip(tTrip);

      // assert
      expect(res.dateAndTime, tTrip.dateAndTime);
      expect(res.id, tTrip.id);
      expect(res.location, tTrip.location);
      expect(res.kmTrip, tTrip.kmTrip);
      expect(res.kmAbsolute, tTrip.kmAbsolute);
    });
  });

  group('toCSV()', () {
    test('should return an empty field when location is null', () {
      // arrange
      TripExportModel tripExportModel = TripExportModel(
        DateTime.now(),
        'laksdjf318',
        128921,
        321.5,
        null,
      );

      // act
      final res = tripExportModel.toCSV();

      // assert
      assert(res[res.length - 1] == "");
    });
  });
}
