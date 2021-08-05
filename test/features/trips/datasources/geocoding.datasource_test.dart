import 'package:fahrtenbuch/features/trips/data/datasources/location/geocoding.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GeocodingDatasource geocodingDatasource;
  late CoordinatesModel coords;

  setUp(() {
    geocodingDatasource = GeocodingDatasource();
    coords = new CoordinatesModel(
      51.681609699999996,
      9.379117799722223,
    );
  });

  test('should return the correct location for given coordinates', () async {
    var location = await geocodingDatasource.getLocationName(coords);
  });
}
