import 'dart:convert';

import 'package:fahrtenbuch/features/trips/data/datasources/location/geocoding.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';
import 'package:http/http.dart' as http;

class GeocodingRestDataSource implements GeocodingDatasource {
  @override
  Future<String> getLocationName(CoordinatesModel coords) async {
    const apiKey = String.fromEnvironment('GEOCODING_KEY');
    var queryParams = {
      'key': apiKey,
      'latlng': "${coords.latitude},${coords.longitude}"
    };

    var url =
        Uri.https('maps.googleapis.com', '/maps/api/geocode/json', queryParams);

    var response = await http.get(url);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    var city = decodedResponse['results'][0]['address_components'][2];
    return city['short_name'];
  }
}
