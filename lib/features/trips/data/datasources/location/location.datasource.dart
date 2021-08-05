import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';

abstract class LocationDatasource {
  Future<String> getLocationName(CoordinatesModel coordinates);
}
