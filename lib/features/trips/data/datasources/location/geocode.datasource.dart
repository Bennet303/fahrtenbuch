import 'package:fahrtenbuch/features/trips/data/datasources/location/location.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';
import 'package:geocode/geocode.dart';

class GeocodeDatasource extends LocationDatasource {
  @override
  Future<String> getLocationName(CoordinatesModel coordinates) async {
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(
        latitude: coordinates.latitude, longitude: coordinates.longitude);
    final cityName = address.city;
    if (cityName == null) {
      throw Exception('No locality found');
    }
    return cityName;
  }
}
