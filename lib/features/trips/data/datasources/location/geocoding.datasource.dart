import 'package:fahrtenbuch/features/trips/data/datasources/location/location.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingDatasource extends LocationDatasource {
  @override
  Future<String> getLocationName(CoordinatesModel coords) async {
    
    List<Placemark> placemarks =
        await placemarkFromCoordinates(coords.latitude, coords.longitude, localeIdentifier: 'en');

    final cityName = placemarks.first.locality;

    if (cityName == null) {
      throw Exception('No locality found');
    }

    return cityName;
  }
}
